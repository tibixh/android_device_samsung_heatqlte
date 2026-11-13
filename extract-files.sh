#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set -e

# Required!
export DEVICE=heatqlte
export BOARD_COMMON=msm8916-common
export VENDOR=samsung

export SETUP_DEVICE_DIR=1
export SETUP_DEVICE_COMMON_DIR=0
export SETUP_BOARD_COMMON_DIR=0

MY_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VENDOR_OUT="$MY_DIR/../../../vendor/$VENDOR/$DEVICE/proprietary"

function blob_fixup() {
    case "${1}" in
        lib/hw/camera.vendor.msm8916.so)
            patchelf --replace-needed libqc-opt.so libqti-perfd-client.so "${2}"
            ;;
    esac
    return 0
}

function fixup_blobs() {
    local LINE SPEC DEST
    while read -r LINE; do
        case "$LINE" in
            ''|'#'*) continue ;;
        esac
        SPEC="${LINE%%|*}"
        SPEC="${SPEC#-}"
        case "$SPEC" in
            *:*) DEST="${SPEC#*:}" ;;
            *) DEST="$SPEC" ;;
        esac
        if [ -f "$VENDOR_OUT/$DEST" ]; then
            blob_fixup "$DEST" "$VENDOR_OUT/$DEST"
        fi
    done < "$MY_DIR/proprietary-files.txt"
}

./../../$VENDOR/$BOARD_COMMON/extract-files.sh $@

fixup_blobs
