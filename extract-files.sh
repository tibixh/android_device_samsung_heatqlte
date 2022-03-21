#!/bin/sh

DUMP=~/android/heatqlte/system_dump/dump
BASE=../../../vendor/samsung/heatqlte/proprietary

echo "Pulling vendor files..."
for FILE in `cat proprietary-files.txt | grep -v ^# | grep -v ^$`; do
    DIR=`dirname $FILE`
    if [ ! -d $BASE/$DIR ]; then
        mkdir -p $BASE/$DIR
    fi
    cp $DUMP/$FILE $BASE/$FILE
done

./setup-makefiles.sh