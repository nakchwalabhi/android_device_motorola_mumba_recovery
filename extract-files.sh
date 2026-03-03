#!/bin/bash
#
# Copyright (C) 2016 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

DEVICE=mumba
VENDOR=motorola

# Parse arguments
while [ "${#}" -gt 0 ]; do
    case "${1}" in
        -n | --no-cleanup )
                CLEAN_VENDOR=false
                ;;
        -k | --keep-dump )
                KEEP_DUMP=true
                ;;
        -s | --section )
                SECTION="${2}"; shift
                CLEAN_VENDOR=false
                ;;
        * )
                SRC="${1}"
                ;;
    esac
    shift
done

if [ -z "${SRC}" ]; then
    SRC="adb"
fi

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$MY_DIR" ]]; then MY_DIR="$PWD"; fi

ANDROID_ROOT="${MY_DIR}/../../.."

HELPER="${ANDROID_ROOT}/tools/extract-utils/extract_utils.sh"
if [ ! -f "$HELPER" ]; then
    echo "Unable to find helper script at $HELPER"
    exit 1
fi
source "${HELPER}"

# Default to sanitizing the vendor Makefile
setup_vendor "${DEVICE}" "${VENDOR}" "${ANDROID_ROOT}" false

# Clean the vendor directory
rm -rf "${ANDROID_ROOT}/${OUTDIR:?}/"*

# Extract the blobs
extract "${MY_DIR}/proprietary-files.txt" "${SRC}"

# Generate build files
write_headers
write_makefiles "${MY_DIR}/proprietary-files.txt"

# Finish
write_footers
