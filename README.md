# BlissOS Surface Pro 9 瀹氬埗鐗?
闈㈠悜 **Microsoft Surface Pro 9** 瀹氬埗鐨?BlissOS锛圓ndroid-x86锛夌郴缁熼暅鍍忋€傜敱鐖卞ソ鑰呬釜浜虹淮鎶ゃ€?
> 鈿狅笍 **浠呴拡瀵?Surface Pro 9 閫傞厤銆傚叾瀹冭澶囧潎鏈祴璇曪紝璇峰嬁鍦ㄩ潪 SP9 璁惧涓婂畨瑁呫€?*

## 涓嬭浇

闀滃儚鍙戝竷鍦?**SourceForge**锛?
- 椤圭洰椤碉細<https://sourceforge.net/projects/blissos-surface-build/>
- 鏂囦欢鍒楄〃锛?https://sourceforge.net/projects/blissos-surface-build/files/>
- r12k 鐩撮摼锛?https://downloads.sourceforge.net/project/blissos-surface-build/r12k/Bliss-Surface-v18.4-x86_64-UNOFFICIAL-vanilla-20260816-r12k.iso>

鍙戝竷鐗堬紙vanilla锛塖HA256锛?
| 鐗堟湰 | SHA256 |
|---|---|
| r12k (2026-08-16, vanilla) | `1a7ec872c9ecfa26c9032365d97753c3806d55cec7e0f5d0fc2aff070f7676d5` |

## 宸查€傞厤鐨勫姛鑳?
- 鍏呯數鑷?100%锛堢鐢?EC Smart Charging锛?- 钃濈墮銆乄i-Fi
- 鐩掔洊鐔勫睆 / 寮€鐩栦寒灞?/ 鏅鸿兘浼戠湢锛堟挱鏀鹃煶涔愪笉鐫★級
- 閿佸睆瀵嗙爜锛圙atekeeper锛?- 瑙︽懜锛堝惈 Surface 瑙︽帶绗斻€乀ype Cover锛?- 鐩告満锛堝墠鎽?OV5693 宸插嚭甯э級
- 閫氳繃 ndk_translation锛坆erberis锛夎浆璇戝眰杩愯 arm64 搴旂敤

## 馃幃 娓告垙鍏煎鎬э紙鎸?閫愭父鎴忛€傞厤"锛?
鏈郴缁熸病鏈?涓€濂楄浆璇戝眰閫氬悆鎵€鏈夋父鎴?鐨勯摱寮广€傛瘡娆?arm64 娓告垙閮藉彲鑳藉湪杞瘧灞備笂閬囧埌鍚勮嚜涓嶅悓鐨勫吋瀹规€ч棶棰橈紝闇€瑕侀€愭父鎴忓崟鐙€傞厤銆傚綋鍓嶅疄娴嬶細

| 娓告垙 | 鐘舵€?| 璇存槑 |
|---|---|---|
| 鏄庢棩鏂硅垷 | 鉁?鍙繍琛?| 淇 libvulkan 绗﹀彿 + berberis host-call 鐩村懠锛圲8SDK 娣锋穯灞傚弽妯℃嫙妫€娴嬶級 |
| 鐜嬭€呰崳鑰€ | 鉂?寰呴€傞厤 | berberis guest-call 鏍堟寚閽堟仮澶嶆牎楠屽け璐?|
| Minecraft | 鉂?寰呴€傞厤 | 鎵ц杩濅緥锛堣繘鍏ヨ嚜韬彧璇绘锛夛紝浜ゆ崲閾惧垵濮嬪寲鍚庡穿婧?|
| 鍜屽钩绮捐嫳 | 鉂?寰呴€傞厤 | 鍙嶄綔寮?妯℃嫙鍣ㄦ娴嬪悗鑷粓姝紙绛栫暐灞傞棶棰橈級 |

**缁撹**锛氭瘡娆炬父鎴忛棶棰樻満鍒朵笉鍚岋紝閮介渶瑕佸崟鐙垎鏋愩€佸崟鐙墦琛ヤ竵銆傛杩庣ぞ鍖哄紑鍙戣€呴拡瀵瑰崟娆炬父鎴忔彁渚涘鐜般€佸垎鏋愩€佽ˉ涓併€?
## 馃 绀惧尯鍗忎綔

- 鏈郴缁熺敱鐖卞ソ鑰呬负涓汉 Surface Pro 9 瀹氬埗锛?*闈炲晢涓氶」鐩€佹棤瀹樻柟鏀寔**銆?- 娆㈣繋鎻愪氦锛?  - 鍗曟娓告垙鐨勫吋瀹规€цˉ涓侊紙鍚鐜版棩蹇椼€乼ombstone锛?  - 鏂拌澶囩Щ妞嶏紙闇€鑷閫傞厤锛屽綋鍓嶆湭娴嬭瘯鍏跺畠璁惧锛?  - bug 鎶ュ憡 / 瀹氫綅 / 淇
- 闂璇峰甫锛氳澶囧瀷鍙枫€両SO 鐗堟湰銆佸穿婧冩棩蹇楋紙logcat / tombstones锛夈€乣ro.build.display.id`銆?
## 瑁呮満娉ㄦ剰浜嬮」

- ISO >4GB 鏃?FAT32 U 鐩樺啓涓嶄簡锛岀敤 exFAT/NTFS
- 宸茶鏈?7GB system 鍒嗗尯鐨勮澶囬渶鍏堟墿鍒嗗尯鍒?8GiB锛堥暅鍍忎负 8GiB锛?- 瑁呮満/鍗囩骇鍚庡缓璁畬鏁撮噸鍚竴娆★紙閮ㄥ垎绯荤粺搴撳湪鍚姩鏃堕杞斤級

## 鎶€鏈儗鏅紙绠€杩帮級

- 鍩虹锛欱lissOS锛圓ndroid-x86 / BlissRoms锛夛紝Android 15锛屽唴鏍?6.6锛堝惈 IPU6 鐩告満銆丮AP_32BIT 4GiB 绛?Surface 閫傞厤锛?- 杞瘧灞傦細ndk_translation 0.2.4锛坅rm64 鈫?x86_64锛?- 璇︾粏寮€鍙戣褰曚笌宸茬煡闂瑙侀」鐩?Issue 鍖?