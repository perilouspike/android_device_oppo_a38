$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Inherit TWRP Core Products
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

PRODUCT_BUILD_VENDOR_BOOT_IMAGE := true
# Fix TWRP ramdisk copy error

# Debugging tools
PRODUCT_PACKAGES += \
    logd \
    logcat

