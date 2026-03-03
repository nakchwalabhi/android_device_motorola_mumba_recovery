#
# Copyright (C) 2026 The LineageOS Project
#

# Inherit from mumba device
$(call inherit-product, device/motorola/mumba/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_mumba
PRODUCT_DEVICE := mumba
PRODUCT_BRAND := motorola
PRODUCT_MODEL := Moto G57 Power
PRODUCT_MANUFACTURER := motorola

BUILD_FINGERPRINT := motorola/mumba_g/msi:16/W1WAA36M.48-12-ST12.1/14fbc:user/release-keys

# Force Shipping API Level to 36 (Android 16) to ensure VINTF checks run against modern matrix
PRODUCT_SHIPPING_API_LEVEL := 36
