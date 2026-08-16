#!/bin/bash
# Apply game-compatibility hotfixes to the BlissOS build tree.
# Usage: BLISSOS_ROOT=/home/meowhuan/blissos ./apply_game_compat.sh
# Run BEFORE `make`. The libvulkan API36 recovery is a POST-build step (see build.yml / README).
set -e

BLISSOS_ROOT="${BLISSOS_ROOT:-/home/meowhuan/blissos}"
GAME_COMPAT="$(cd "$(dirname "$0")/.." && pwd)/game-compat"

echo "== game-compat: blissos root = $BLISSOS_ROOT =="

# 1) libndk_translation 0.2.4 host-call patch (md5 0410f2e3 -> d986d236)
#    Fixes Arknights (U8SDK libsmsdk) crash: guest->host address calls now do a host call.
NDK_PREBUILT="$BLISSOS_ROOT/vendor/google/proprietary/ndk_translation-prebuilt/prebuilts/lib64/libndk_translation.so"
if [ -f "$NDK_PREBUILT" ]; then
  cp "$GAME_COMPAT/libndk_translation.so" "$NDK_PREBUILT"
  chmod 755 "$NDK_PREBUILT"
  echo "patched libndk_translation -> $(md5sum "$NDK_PREBUILT" | cut -d' ' -f1)"
else
  echo "WARN: $NDK_PREBUILT not found, skipping libndk patch"
fi

echo "== game-compat pre-build apply done =="
