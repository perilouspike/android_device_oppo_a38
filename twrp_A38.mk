#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from PBRP-common stuff, if building PBRP.
#$(call inherit-product-if-exists, vendor/pb/config/common.mk)

# Inherit from a38 device
$(call inherit-product, device/Oppo/A38/device.mk)

PRODUCT_DEVICE := A38
PRODUCT_NAME := twrp_A38
PRODUCT_BRAND := Oppo
PRODUCT_MODEL := A38
PRODUCT_MANUFACTURER := Oppo

PRODUCT_GMS_CLIENTID_BASE := android-oppo

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="vnd_k69v1_64_k419-user 12 SP1A.210812.016 1733193326975 release-keys"

BUILD_FINGERPRINT := oplus/ossi/ossi:12/SP1A.210812.016/1733193326975:user/release-keys
