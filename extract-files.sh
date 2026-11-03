#!/bin/bash

DEVICE=heatqlte
VENDOR=samsung

BASE=../../../vendor/$VENDOR/$DEVICE/proprietary

while getopts ":nhsd:" options
do
  case $options in
    n ) NC=1 ;;
    d ) LDIR=$OPTARG ;;
    s ) SETUP=1 ;;
    h ) echo "Usage: `basename $0` [OPTIONS] "
        echo "  -n  No cleanup"
        echo "  -d  Fetch blob from filesystem"
        echo "  -s  Setup only, no extraction"
        echo "  -h  Show this help"
        exit ;;
    * ) ;;
  esac
done

if [ "x$NC" != "x1" ]; then
  rm -rf "${BASE:?}"/*
fi

fetch_blob() {
  local SRC=$1
  local DST=$2
  local SRC_DEVICE=$3

  if [ -z "$LDIR" ]; then
    adb pull "/system/$SRC" "$BASE/$DST"
  else
    cp -- "$LDIR/$SRC_DEVICE/system/$SRC" "$BASE/$DST"
  fi
}

while IFS= read -r LINE || [ -n "$LINE" ]; do
  LINE=${LINE%$'\r'}
  LINE=${LINE%%#*}
  LINE=${LINE#"${LINE%%[![:space:]]*}"}
  LINE=${LINE%"${LINE##*[![:space:]]}"}

  [ -z "$LINE" ] && continue

  case "$LINE" in
    -*) LINE=${LINE#-}
        LINE=${LINE#"${LINE%%[![:space:]]*}"} ;;
  esac

  # Select source device
  SRC_DEVICE=$DEVICE

  case "$LINE" in
    *'|'*)
      SRC_DEVICE=${LINE##*|}
      SRC_DEVICE=${SRC_DEVICE#"${SRC_DEVICE%%[![:space:]]*}"}
      SRC_DEVICE=${SRC_DEVICE%"${SRC_DEVICE##*[![:space:]]}"}
      LINE=${LINE%|*}
      ;;
  esac

  FILE=${LINE%%:*}
  if [ "$FILE" = "$LINE" ]; then
    DEST=$FILE
  else
    DEST=${LINE#*:}
    DEST=${DEST#"${DEST%%[![:space:]]*}"}
    DEST=${DEST%"${DEST##*[![:space:]]}"}
    [ -z "$DEST" ] && DEST=$FILE
  fi

  FILE=${FILE#"${FILE%%[![:space:]]*}"}
  FILE=${FILE%"${FILE##*[![:space:]]}"}
  [ -z "$FILE" ] && continue

  mkdir -p -- "$BASE/$(dirname -- "$DEST")"

  if [ "x$SETUP" != "x1" ]; then
    if ! fetch_blob "$FILE" "$DEST" "$SRC_DEVICE"; then
      if [ "$DEST" != "$FILE" ] && fetch_blob "$DEST" "$DEST" "$SRC_DEVICE"; then
        :
      else
        echo "warning: failed to extract $FILE from $SRC_DEVICE" >&2
      fi
    fi
  fi
done < "../$DEVICE/proprietary-files.txt"

# Patch camera HAL
CAMERA_HAL="$BASE/lib/hw/camera.vendor.msm8916.so"
if [ "x$SETUP" != "x1" ] && [ -f "$CAMERA_HAL" ]; then
  if ! command -v patchelf >/dev/null 2>&1; then
    echo "error: patchelf is required to retarget $CAMERA_HAL" >&2
    exit 1
  fi

  if patchelf --print-needed "$CAMERA_HAL" | grep -qx 'libqc-opt.so'; then
    patchelf --replace-needed libqc-opt.so libqti-perfd-client.so "$CAMERA_HAL"
    printf "Patched camera.vendor.msm8916.so \n"
  fi
fi

bash setup-makefiles.sh

exit 0