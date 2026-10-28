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

  if [ -z "$LDIR" ]; then
    adb pull "/system/$SRC" "$BASE/$DST"
  else
    cp -- "$LDIR/system/$SRC" "$BASE/$DST"
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
    if ! fetch_blob "$FILE" "$DEST"; then
      if [ "$DEST" != "$FILE" ] && fetch_blob "$DEST" "$DEST"; then
        :
      else
        echo "warning: failed to extract $FILE" >&2
      fi
    fi
  fi
done < "../$DEVICE/proprietary-files.txt"

bash setup-makefiles.sh

exit 0