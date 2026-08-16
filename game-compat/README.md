# game-compat（游戏兼容性热修）

本目录存放为让游戏在 BlissOS Surface 定制版上运行而做的**二进制热修**。当前仅针对 **Surface Pro 9** 验证。

## 文件

| 文件 | 作用 | 来源 / md5 |
|---|---|---|
| `libndk_translation.so` | ndk_translation 0.2.4 的 `berberis_HandleNoExec` 二进制补丁：guest 代码调用 host 地址时改为执行 host call 并返回，不再 SIGSEGV（解决明日方舟 U8SDK 崩溃） | 原版 md5 `0410f2e3…` → 补丁版 `d986d236…` |
| `libvulkan.so.api36` | API36 模拟器 host `libvulkan.so`（含 Vulkan 1.4 符号），替换 Android 15 自带的 API35 版，满足 0.2.4 proxy 的符号需求 | md5 `59fb1c2b…`（223616B） |

## 应用方式

- **libndk 补丁**：构建前运行 `scripts/apply_game_compat.sh`（会覆盖 vendor prebuilt）。
- **libvulkan**：完整 `make` 之后会回退成 API35，必须**构建后补救**：把 `libvulkan.so.api36` 复制到
  `out/target/product/x86_64/system/lib64/libvulkan.so` 与 `obj/PACKAGING/target_files_intermediates/bliss_x86_64-target_files/SYSTEM/lib64/libvulkan.so`，
  再带 `BOARD_IS_SURFACE_BUILD=true make iso_img`。详见 README「构建」一节与 `build.yml`。

## 约束

- 两个补丁都**绑定具体 0.2.4 二进制**（偏移固定）；升级 ndk_translation 需重新打补丁。
- 装机/升级后**必须完整重启一次**（zygote 启动时预载 host libvulkan，不重启不生效）。
- 仅验证：明日方舟可运行 5+ 分钟进入游戏逻辑；其它应用/游戏按"逐游戏适配"对待（见仓库 README）。
