#
# Copyright (C) 2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from the TWRP common config (provided by the TWRP build manifest)
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit device-specific configuration
$(call inherit-product, device/motorola/mumba/device.mk)

PRODUCT_NAME := twrp_mumba
PRODUCT_DEVICE := mumba
PRODUCT_BRAND := motorola
PRODUCT_MODEL := Moto G57 Power
PRODUCT_MANUFACTURER := motorola
