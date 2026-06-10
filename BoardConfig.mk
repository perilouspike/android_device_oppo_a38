#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/Oppo/A38

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Android 14 Specific Flags
# Network
BUILD_BROKEN_USES_NETWORK := true
BUILD_BROKEN_MISSING_REQUIRED_MODULES := true
BUILD_BROKEN_CLANG_PROPERTY_DICTIONARY_CHECKS := true

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    vendor \
    odm \
    vbmeta_vendor \
    system \
    vbmeta_system \
    product \
    boot \
    dtbo \
    lk \
    preloader \
    my_product \
    my_engineering \
    my_company \
    my_carrier \
    my_region \
    my_heytap \
    my_stock \
    my_preload \
    my_bigball \
    my_manifest

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a75

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := k69v1_64_k419
TARGET_NO_BOOTLOADER := true

# Assert
TARGET_OTA_ASSERT_DEVICE := CPH2579,cph2579,CPH2581,cph2581

# Display
TARGET_SCREEN_DENSITY := 480

# Kernel Architecture Constraints
TARGET_KERNEL_ARCH := $(TARGET_ARCH)
TARGET_KERNEL_HEADER_ARCH := $(TARGET_ARCH)
BOARD_KERNEL_IMAGE_NAME := kernel

# Kernel - prebuilt
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img

# Memory Layout
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_PAGE_SIZE := 2048
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_TAGS_OFFSET := 0x0bc08000
BOARD_SECOND_OFFSET := 0xbff88000
BOARD_RAMDISK_OFFSET := 0x07c08000

# Kernel Execution Parameters
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 buildvariant=user androidboot.selinux=permissive

# MKBOOTIMG Arguments
# Note: --base, --pagesize, --ramdisk_offset, and --header_version are handled automatically by the Manifest 14 core build scripts.
BOARD_MKBOOTIMG_ARGS += \
    --kernel $(TARGET_PREBUILT_KERNEL) \
    --dtb $(TARGET_PREBUILT_DTB) \
    --kernel_offset $(BOARD_KERNEL_OFFSET) \
    --second_offset $(BOARD_SECOND_OFFSET) \
    --tags_offset $(BOARD_TAGS_OFFSET) \
    --board ""

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_COPY_OUT_VENDOR := vendor
BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value

# Dynamic Partitions Config
BOARD_SUPER_PARTITION_GROUPS := main
BOARD_MAIN_PARTITION_LIST := system vendor product odm my_product my_engineering my_company my_carrier my_region my_heytap my_stock my_preload my_bigball my_manifest
BOARD_MAIN_SIZE := 9122611200

# Platform
PRODUCT_PLATFORM := mt6768
TARGET_BOARD_PLATFORM := $(PRODUCT_PLATFORM)

# Recovery
TARGET_NO_RECOVERY := true
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab

# File System Types Configuration
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# System Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

# Cryptographic Signatures for Unified boot.img (Bypasses empty chained sub-images)
BOARD_AVB_BOOT_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_BOOT_ALGORITHM := SHA256_RSA2048
BOARD_AVB_BOOT_ROLLBACK_INDEX := 1
BOARD_AVB_BOOT_ROLLBACK_INDEX_LOCATION := $(BOARD_AVB_BOOT_ROLLBACK_INDEX)
BOARD_AVB_BOOT_ADD_HASH_FOOTER_ARGS := --partition_size $(BOARD_BOOTIMAGE_PARTITION_SIZE) # Android 14 Explicit padding constraint requirement

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
BOOT_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)

# Crypto Configuration for File-Based Encryption (FBE)
#TW_INCLUDE_CRYPTO := true
#TW_INCLUDE_CRYPTO_FBE := true
#TW_INCLUDE_FBE_METADATA_DECRYPT := true
#TW_USE_FSCRYPT_POLICY := 2
#BOARD_USES_METADATA_PARTITION := true

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
TW_INCLUDE_REPACKTOOLS := true

# Storage System Operations and File Systems Compatibility
RECOVERY_SDCARD_ON_DATA := true
TARGET_USES_MKE2FS := true
TW_INCLUDE_FUSE_EXFAT := true
TW_INCLUDE_FUSE_NTFS := true
TW_INCLUDE_NTFS_3G := true
TW_NO_FASTBOOT_BOOT := true
TW_EXCLUDE_TWRP_APP := true

# Debug and Logging Modules
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true

# Maintainer/Version
TW_DEVICE_VERSION := perilouspike-beta

# Graphics and Display Configuration
TW_FRAMERATE := 90

# Display Backlight Controls (Corrected for MediaTek mt6769 Kernel Layout)
TW_MAX_BRIGHTNESS := 2047
TW_DEFAULT_BRIGHTNESS := 1024
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"

# Binary Executables Inclusion Configurations
TW_INCLUDE_BASH := true

# Peripheral Control Overrides
TW_EXCLUDE_DEFAULT_USB_INIT := true