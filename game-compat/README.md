# game-compat锛堟父鎴忓吋瀹规€х儹淇級

鏈洰褰曞瓨鏀句负璁╂父鎴忓湪 BlissOS Surface 瀹氬埗鐗堜笂杩愯鑰屽仛鐨?*浜岃繘鍒剁儹淇?*銆傚綋鍓嶄粎閽堝 **Surface Pro 9** 楠岃瘉銆?
## 鏂囦欢

| 鏂囦欢 | 浣滅敤 | 鏉ユ簮 / md5 |
|---|---|---|
| `libndk_translation.so` | ndk_translation 0.2.4 鐨?`berberis_HandleNoExec` 浜岃繘鍒惰ˉ涓侊細guest 浠ｇ爜璋冪敤 host 鍦板潃鏃舵敼涓烘墽琛?host call 骞惰繑鍥烇紝涓嶅啀 SIGSEGV锛堣В鍐虫槑鏃ユ柟鑸?U8SDK 宕╂簝锛?| 鍘熺増 md5 `0410f2e3鈥 鈫?琛ヤ竵鐗?`d986d236鈥 |
| `libvulkan.so.api36` | API36 妯℃嫙鍣?host `libvulkan.so`锛堝惈 Vulkan 1.4 绗﹀彿锛夛紝鏇挎崲 Android 15 鑷甫鐨?API35 鐗堬紝婊¤冻 0.2.4 proxy 鐨勭鍙烽渶姹?| md5 `59fb1c2b鈥锛?23616B锛?|

## 搴旂敤鏂瑰紡

- **libndk 琛ヤ竵**锛氭瀯寤哄墠杩愯 `scripts/apply_game_compat.sh`锛堜細瑕嗙洊 vendor prebuilt锛夈€?- **libvulkan**锛氬畬鏁?`make` 涔嬪悗浼氬洖閫€鎴?API35锛屽繀椤?*鏋勫缓鍚庤ˉ鏁?*锛氭妸 `libvulkan.so.api36` 澶嶅埗鍒?  `out/target/product/x86_64/system/lib64/libvulkan.so` 涓?`obj/PACKAGING/target_files_intermediates/bliss_x86_64-target_files/SYSTEM/lib64/libvulkan.so`锛?  鍐嶅甫 `BOARD_IS_SURFACE_BUILD=true make iso_img`銆傝瑙?README銆屾瀯寤恒€嶄竴鑺備笌 `build.yml`銆?
## 绾︽潫

- 涓や釜琛ヤ竵閮?*缁戝畾鍏蜂綋 0.2.4 浜岃繘鍒?*锛堝亸绉诲浐瀹氾級锛涘崌绾?ndk_translation 闇€閲嶆柊鎵撹ˉ涓併€?- 瑁呮満/鍗囩骇鍚?*蹇呴』瀹屾暣閲嶅惎涓€娆?*锛坺ygote 鍚姩鏃堕杞?host libvulkan锛屼笉閲嶅惎涓嶇敓鏁堬級銆?- 浠呴獙璇侊細鏄庢棩鏂硅垷鍙繍琛?5+ 鍒嗛挓杩涘叆娓告垙閫昏緫锛涘叾瀹冨簲鐢?娓告垙鎸?閫愭父鎴忛€傞厤"瀵瑰緟锛堣浠撳簱 README锛夈€?