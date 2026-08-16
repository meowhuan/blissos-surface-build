# blissos-surface-build

**BlissOS Surface Pro 9 瀹氬埗鐗?ISO 鏋勫缓涓庡彂甯冧粨搴?*锛圙itHub Actions + 鏋勫缓鏈?self-hosted runner锛夈€?
> 鈿狅笍 **浠呴拡瀵?Microsoft Surface Pro 9 閫傞厤銆傚叾瀹冭澶囧潎鏈祴璇曪紝澶ф鐜囨棤娉曠洿鎺ヤ娇鐢紝璇峰嬁鍦ㄩ潪 SP9 璁惧涓婂畨瑁呫€?*

## 杩欐槸浠€涔?
鎶?BlissOS锛圓ndroid-x86/BlissRoms锛夊畾鍒朵负鑳藉湪 **Surface Pro 9** 涓婂畬鏁村伐浣滅殑绯荤粺锛屽苟鑷姩鏋勫缓銆佸彂甯?ISO锛?
- 鍏呯數鑷?100%锛堢鐢?EC Smart Charging锛夈€佽摑鐗欍€佺洅鐩栦紤鐪犮€侀攣灞忓瘑鐮併€佽Е鎽搞€佺浉鏈猴紙鍓嶆憚 OV5693 鍑哄抚锛夌瓑宸查€傞厤
- 閫氳繃 **ndk_translation (berberis) 杞瘧灞?*杩愯 arm64 搴旂敤/娓告垙
- 鑷姩鏋勫缓锛歚workflow_dispatch` 閫?vanilla/gapps 鍙樹綋 鈫?鍚屾琛ヤ竵浠撳簱 鈫?鏋勫缓 鈫?鏍￠獙 鈫?鍙戝竷 ISO 鍒?GitHub Release

## 馃幃 娓告垙鍏煎鎬э細鎸?閫愭父鎴忛€傞厤"澶勭悊锛堥噸瑕侊級

鏈郴缁熸病鏈?涓€濂楄浆璇戝眰閫氬悆鎵€鏈夋父鎴?鐨勯摱寮广€傛瘡娆?arm64 娓告垙閮藉彲鑳藉湪 berberis 杞瘧灞備笂閬囧埌**鍚勮嚜涓嶅悓鐨?*鍏煎鎬ч棶棰橈紝闇€瑕?*閫愭父鎴忓崟鐙€傞厤**銆傚綋鍓嶅疄娴嬶紙2026-08-16锛岃澶?r12j + 鐑慨锛夛細

| 娓告垙 | 鍖呭悕 | 鐘舵€?| 璇存槑 |
|---|---|---|---|
| 鏄庢棩鏂硅垷 | `com.hypergryph.arknights` | 鉁?鍙繍琛?| 淇 鈶?libvulkan API36 绗﹀彿锛坺ygote 棰勮浇锛夛紱鈶?berberis `HandleNoExec` host-call 琛ヤ竵锛圲8SDK libsmsdk 娣锋穯浠ｇ爜鐩存帴璋冪敤 host 搴?`libnativebridge::NativeBridgeError`锛夈€傚疄娴嬭繍琛?5+ 鍒嗛挓杩涘叆娓告垙閫昏緫锛堟洿鏂版湇鍔″櫒鏌ヨ鎴愬姛锛?|
| 鐜嬭€呰崳鑰€ | `com.tencent.tmgp.sgame` | 鉂?寰呴€傞厤 | `Guest call didn't restore sp`锛坆erberis guest-call 鏍堟寚閽堟仮澶嶆牎楠屽け璐ワ紝鏈熸湜/瀹為檯宸?0x10锛夈€傚凡鎺ㄨ繘鍒?GCloudCore/TDM/MSDK/Apollo 鍒濆鍖栧畬鎴?|
| Minecraft | `com.mojang.minecraftpe` | 鉂?寰呴€傞厤 | 瀹夸富 SIGSEGV(SEGV_ACCERR) 鎵ц `libminecraftpe.so` 鍙涓嶅彲鎵ц娈碉紙offset 0x720bef4锛夛紝鍙戠敓鍦?SwappyDisplayManager锛堜氦鎹㈤摼锛夊垵濮嬪寲鍚?|
| 鍜屽钩绮捐嫳 | `com.tencent.tmgp.pubgmhd` | 鉂?寰呴€傞厤 | 涓昏繘绋嬮潤榛?~22s 鍚?**clean exit(0)**锛堝瓙杩涚▼ SIGABRT锛夛紝鐤戜技鍙嶄綔寮?妯℃嫙鍣ㄦ娴嬪悗鑷粓姝紝闈炶浆璇戝眰宕╂簝 |

**缁撹**锛氭瘡娆炬父鎴忕殑闂鏈哄埗涓嶅悓锛圢oExec 鐩村懠 host / guest-call 鏍堟牎楠?/ 瀹夸富鎵ц杩濅緥 / 鍙嶄綔寮婃娴嬶級锛岄兘闇€瑕佸崟鐙垎鏋愩€佸崟鐙墦琛ヤ竵銆?*娆㈣繋绀惧尯寮€鍙戣€呴拡瀵瑰崟娆炬父鎴忔彁渚涘鐜般€佸垎鏋愩€佽ˉ涓併€?*

## 馃 绀惧尯鍗忎綔

- 鏈郴缁熺敱鐖卞ソ鑰呬负涓汉 Surface Pro 9 瀹氬埗锛?*闈炲晢涓氶」鐩€佹棤瀹樻柟鏀寔**銆?- 娆㈣繋鎻愪氦锛?  - 鍗曟娓告垙鐨勫吋瀹规€цˉ涓侊紙鍚鐜版棩蹇椼€乼ombstone銆乥erberis trace锛?  - 鏂拌澶囩Щ妞嶏紙闇€鑷閫傞厤锛屽綋鍓嶆湭娴嬭瘯鍏跺畠璁惧锛?  - bug 鎶ュ憡 / 瀹氫綅 / 淇 PR
- 闂璇峰甫锛氳澶囧瀷鍙枫€両SO 鐗堟湰鍙枫€乣logcat` 宕╂簝娈点€乣/data/tombstones`銆乣getprop ro.build.display.id`銆?
## 鏋勫缓鍘熺悊

- 鏋勫缓鏈猴紙192.168.31.159, Ubuntu 24.04, 64 鏍?47GB锛夋寕杞?GitHub self-hosted runner
- workflow 鍚屾 **12 涓?meowhuan fork 琛ヤ竵浠撳簱**锛堚殸锔?蹇呴』鐢?fork锛歋urface 瀹氬埗鍙瓨鍦ㄤ簬 fork锛孊lissOS 涓婃父浠撳簱娌℃湁锛夆啋 搴旂敤 `game-compat` 鐑慨 鈫?`make blissify iso_img -j32` 鈫?libvulkan API36 琛ユ晳 鈫?`gh release` 鍙戝竷 ISO

### 琛ヤ竵浠撳簱锛坢eowhuan 璐︽埛锛屽垎鏀?`r12e-meowhuan`锛?
| 浠撳簱 | 鍐呭 |
|---|---|
| device_generic_common | ssam 鍏呯數銆乴id_monitor銆乮ptsd銆乮nit.sh銆佽摑鐗欑瓑璁惧灞?|
| kernel_common锛坄r12e-meowhuan`锛?| IPU6 鐩告満銆丮AP_32BIT 4GiB銆丏RRS銆乷v5693 |
| frameworks/base | config_useAutoSuspend銆丼ystemUI 渚ф粦 |
| iptsd | 瑙︽懜椹卞姩淇 |
| vendor/bliss銆乥uild/soong | min_sdk銆佺讲鍚?|
| Blissify / BlissSystemUI / BlissUpdater / LMOFreeform / paranoidsense / Launcher3 | 姹夊寲 |
| **blissos-surface-build锛堟湰浠撳簱锛?* | 鏋勫缓宸ヤ綔娴?+ game-compat 鐑慨浜х墿 + 鏂囨。 |

## game-compat锛堟父鎴忕儹淇級

瑙?[`game-compat/README.md`](game-compat/README.md)銆傚綋鍓嶅寘鍚細
- `libndk_translation.so`锛?.2.4 host-call 琛ヤ竵锛岃В鍐虫槑鏃ユ柟鑸燂級
- `libvulkan.so.api36`锛圴ulkan 1.4 绗﹀彿锛?
## 閮ㄧ讲姝ラ锛堜竴娆℃€э級

### 1. 鏋勫缓鏈烘敞鍐?runner
GitHub 缃戦〉 鈫?鏈粨搴?鈫?Settings 鈫?Actions 鈫?Runners 鈫?New self-hosted runner锛圠inux x64锛夈€?鍦ㄦ瀯寤烘満鎵ц锛堜唬鐞嗛渶鍙敤锛夛細
```bash
cd ~ && mkdir actions-runner && cd actions-runner
# <绮樿创 GitHub 椤甸潰缁欑殑涓嬭浇涓庤В鍘嬪懡浠?
./config.sh --url https://github.com/meowhuan/blissos-surface-build --token <RUNNER_TOKEN> --labels blissos-build --name blissos-builder
sudo ./svc.sh install && sudo ./svc.sh start
```

### 2. 瑙﹀彂鏋勫缓
Actions 鈫?Build BlissOS Surface ISO 鈫?Run workflow 鈫?閫夊彉浣?+ 鐗堟湰鍚嶃€?瀹屾垚鍚?ISO 鍦?Release 椤点€?
## 鏈湴鎷夊彇鎸囦护锛堟瀯寤烘垚鍔熷悗鎵嬪姩锛?```powershell
scp -i C:\Users\Meowhuan\.ssh\PRTS-Ubuntu meowhuan@192.168.31.159:/home/meowhuan/blissos/out/target/product/x86_64/<ISO鏂囦欢鍚? F:\temp\
Get-FileHash F:\temp\<ISO鏂囦欢鍚? -Algorithm SHA256
```

## 瑁呮満娉ㄦ剰浜嬮」
- 宸茶鏈?7GB system 鍒嗗尯鐨勮澶囧繀椤诲厛鎵╁垎鍖哄埌 8GiB锛坰gdisk 鎵╁ + resize2fs锛?- ISO >4GB 鏃?FAT32 U 鐩樺啓涓嶄簡锛岀敤 exFAT/NTFS
- system.img 8GiB 椤舵牸闆朵綑閲忥紝鍔犲寘鍓嶅厛璇勪及
- 瑁呮満/鍗囩骇鍚?*蹇呴』瀹屾暣閲嶅惎涓€娆?*锛坺ygote 棰勮浇 host libvulkan锛屽惁鍒欐父鎴忓吋瀹圭儹淇笉鐢熸晥锛?