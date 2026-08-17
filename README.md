# BlissOS Surface Pro 9 定制版

面向 **Microsoft Surface Pro 9** 定制的 BlissOS（Android-x86）系统镜像。由爱好者个人维护。

> ⚠️ **仅针对 Surface Pro 9 适配。其它设备均未测试，请勿在非 SP9 设备上安装。**

## 下载

镜像发布在 **SourceForge**：

- 项目页：<https://sourceforge.net/projects/blissos-surface-build/>
- 文件列表：<https://sourceforge.net/projects/blissos-surface-build/files/>
- r12k 直链：<https://downloads.sourceforge.net/project/blissos-surface-build/r12k/Bliss-Surface-v18.4-x86_64-UNOFFICIAL-vanilla-20260816-r12k.iso>

发布版（vanilla）SHA256：

| 版本 | SHA256 |
|---|---|
| r12k (2026-08-16, vanilla) | `1a7ec872c9ecfa26c9032365d97753c3806d55cec7e0f5d0fc2aff070f7676d5` |

## 已适配的功能

- 充电至 100%（禁用 EC Smart Charging）
- 蓝牙、Wi-Fi
- 盒盖熄屏 / 开盖亮屏 / 智能休眠（播放音乐不睡）
- 锁屏密码（Gatekeeper）
- 触摸（含 Surface 触控笔、Type Cover）
- 相机（前摄 OV5693 已出帧）
- 通过 ndk_translation（berberis）转译层运行 arm64 应用

## 🎮 游戏兼容性（按"逐游戏适配"）

本系统没有"一套转译层通吃所有游戏"的银弹。每款 arm64 游戏都可能在转译层上遇到各自不同的兼容性问题，需要逐游戏单独适配。当前实测：

| 游戏 | 状态 | 说明 |
|---|---|---|
| 明日方舟 | ✅ 可运行 | 修复 libvulkan 符号 + berberis host-call 直呼（U8SDK 混淆层反模拟检测） |
| 王者荣耀 | ❌ 待适配 | berberis guest-call 栈指针恢复校验失败 |
| Minecraft | ❌ 待适配 | 执行违例（进入自身只读段），交换链初始化后崩溃 |
| 和平精英 | ❌ 待适配 | 反作弊/模拟器检测后自终止（策略层问题） |

**结论**：每款游戏问题机制不同，都需要单独分析、单独打补丁。欢迎社区开发者针对单款游戏提供复现、分析、补丁。

## 🤝 社区协作

- 本系统由爱好者为个人 Surface Pro 9 定制，**非商业项目、无官方支持**。
- 欢迎提交：
  - 单款游戏的兼容性补丁（含复现日志、tombstone）
  - 新设备移植（需自行适配，当前未测试其它设备）
  - bug 报告 / 定位 / 修复
- 问题请带：设备型号、ISO 版本、崩溃日志（logcat / tombstones）、`ro.build.display.id`。

## 装机注意事项

- ISO >4GB 时 FAT32 U 盘写不了，用 exFAT/NTFS
- 已装机 7GB system 分区的设备需先扩分区到 8GiB（镜像为 8GiB）
- 装机/升级后建议完整重启一次（部分系统库在启动时预载）

## 技术背景（简述）

- 基础：BlissOS（Android-x86 / BlissRoms），Android 15，内核 6.6（含 IPU6 相机、MAP_32BIT 4GiB 等 Surface 适配）
- 转译层：ndk_translation 0.2.4（arm64 → x86_64）
- 详细开发记录与已知问题见项目 Issue 区