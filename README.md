# blissos-surface-build

**BlissOS Surface Pro 9 定制版 ISO 构建与发布仓库**（GitHub Actions + 构建机 self-hosted runner）。

> ⚠️ **仅针对 Microsoft Surface Pro 9 适配。其它设备均未测试，大概率无法直接使用，请勿在非 SP9 设备上安装。**

## 这是什么

把 BlissOS（Android-x86/BlissRoms）定制为能在 **Surface Pro 9** 上完整工作的系统，并自动构建、发布 ISO：

- 充电至 100%（禁用 EC Smart Charging）、蓝牙、盒盖休眠、锁屏密码、触摸、相机（前摄 OV5693 出帧）等已适配
- 通过 **ndk_translation (berberis) 转译层**运行 arm64 应用/游戏
- 自动构建：`workflow_dispatch` 选 vanilla/gapps 变体 → 同步补丁仓库 → 构建 → 校验 → 发布 ISO 到 GitHub Release

## 🎮 游戏兼容性：按"逐游戏适配"处理（重要）

本系统没有"一套转译层通吃所有游戏"的银弹。每款 arm64 游戏都可能在 berberis 转译层上遇到**各自不同的**兼容性问题，需要**逐游戏单独适配**。当前实测（2026-08-16，设备 r12j + 热修）：

| 游戏 | 包名 | 状态 | 说明 |
|---|---|---|---|
| 明日方舟 | `com.hypergryph.arknights` | ✅ 可运行 | 修复 ① libvulkan API36 符号（zygote 预载）；② berberis `HandleNoExec` host-call 补丁（U8SDK libsmsdk 混淆代码直接调用 host 库 `libnativebridge::NativeBridgeError`）。实测运行 5+ 分钟进入游戏逻辑（更新服务器查询成功） |
| 王者荣耀 | `com.tencent.tmgp.sgame` | ❌ 待适配 | `Guest call didn't restore sp`（berberis guest-call 栈指针恢复校验失败，期望/实际差 0x10）。已推进到 GCloudCore/TDM/MSDK/Apollo 初始化完成 |
| Minecraft | `com.mojang.minecraftpe` | ❌ 待适配 | 宿主 SIGSEGV(SEGV_ACCERR) 执行 `libminecraftpe.so` 只读不可执行段（offset 0x720bef4），发生在 SwappyDisplayManager（交换链）初始化后 |
| 和平精英 | `com.tencent.tmgp.pubgmhd` | ❌ 待适配 | 主进程静默 ~22s 后 **clean exit(0)**（子进程 SIGABRT），疑似反作弊/模拟器检测后自终止，非转译层崩溃 |

**结论**：每款游戏的问题机制不同（NoExec 直呼 host / guest-call 栈校验 / 宿主执行违例 / 反作弊检测），都需要单独分析、单独打补丁。**欢迎社区开发者针对单款游戏提供复现、分析、补丁。**

## 🤝 社区协作

- 本系统由爱好者为个人 Surface Pro 9 定制，**非商业项目、无官方支持**。
- 欢迎提交：
  - 单款游戏的兼容性补丁（含复现日志、tombstone、berberis trace）
  - 新设备移植（需自行适配，当前未测试其它设备）
  - bug 报告 / 定位 / 修复 PR
- 问题请带：设备型号、ISO 版本号、`logcat` 崩溃段、`/data/tombstones`、`getprop ro.build.display.id`。

## 构建原理

- 构建机（192.168.31.159, Ubuntu 24.04, 64 核/47GB）挂载 GitHub self-hosted runner
- workflow 同步 **12 个 meowhuan fork 补丁仓库**（⚠️ 必须用 fork：Surface 定制只存在于 fork，BlissOS 上游仓库没有）→ 应用 `game-compat` 热修 → `make blissify iso_img -j32` → libvulkan API36 补救 → `gh release` 发布 ISO

### 补丁仓库（meowhuan 账户，分支 `r12e-meowhuan`）

| 仓库 | 内容 |
|---|---|
| device_generic_common | ssam 充电、lid_monitor、iptsd、init.sh、蓝牙等设备层 |
| kernel_common（`r12e-meowhuan`） | IPU6 相机、MAP_32BIT 4GiB、DRRS、ov5693 |
| frameworks/base | config_useAutoSuspend、SystemUI 侧滑 |
| iptsd | 触摸驱动修复 |
| vendor/bliss、build/soong | min_sdk、署名 |
| Blissify / BlissSystemUI / BlissUpdater / LMOFreeform / paranoidsense / Launcher3 | 汉化 |
| **blissos-surface-build（本仓库）** | 构建工作流 + game-compat 热修产物 + 文档 |

## game-compat（游戏热修）

见 [`game-compat/README.md`](game-compat/README.md)。当前包含：
- `libndk_translation.so`（0.2.4 host-call 补丁，解决明日方舟）
- `libvulkan.so.api36`（Vulkan 1.4 符号）

## 部署步骤（一次性）

### 1. 构建机注册 runner
GitHub 网页 → 本仓库 → Settings → Actions → Runners → New self-hosted runner（Linux x64）。
在构建机执行（代理需可用）：
```bash
cd ~ && mkdir actions-runner && cd actions-runner
# <粘贴 GitHub 页面给的下载与解压命令>
./config.sh --url https://github.com/meowhuan/blissos-surface-build --token <RUNNER_TOKEN> --labels blissos-build --name blissos-builder
sudo ./svc.sh install && sudo ./svc.sh start
```

### 2. 触发构建
Actions → Build BlissOS Surface ISO → Run workflow → 选变体 + 版本名。
完成后 ISO 在 Release 页。

## 本地拉取指令（构建成功后手动）
```powershell
scp -i C:\Users\Meowhuan\.ssh\PRTS-Ubuntu meowhuan@192.168.31.159:/home/meowhuan/blissos/out/target/product/x86_64/<ISO文件名> F:\temp\
Get-FileHash F:\temp\<ISO文件名> -Algorithm SHA256
```

## 装机注意事项
- 已装机 7GB system 分区的设备必须先扩分区到 8GiB（sgdisk 扩容 + resize2fs）
- ISO >4GB 时 FAT32 U 盘写不了，用 exFAT/NTFS
- system.img 8GiB 顶格零余量，加包前先评估
- 装机/升级后**必须完整重启一次**（zygote 预载 host libvulkan，否则游戏兼容热修不生效）
