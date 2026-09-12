LOCAL_PATH := device/Oppo/A38

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Virtual A/B System Configuration
ENABLE_VIRTUAL_AB := true
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Fastbootd Daemon Architecture 
PRODUCT_PACKAGES += \
    fastbootd

# Modern AIDL Boot Control HAL (Ensures flawless slot switching on Android 14)
PRODUCT_PACKAGES += \
    android.hardware.boot-service.default \
    android.hardware.boot-service.default.recovery \
    bootctrl

# MediaTek Preloader Path Utilities (Ensures Slot Switching Visibility)
PRODUCT_PACKAGES += \
    mtk_plpath_utils \
    mtk_plpath_utils.recovery

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/system/etc/cgroups.json:$(TARGET_RECOVERY_ROOT_OUT)/system/etc/cgroups.json \
    $(LOCAL_PATH)/recovery/root/system/etc/task_profiles.json:$(TARGET_RECOVERY_ROOT_OUT)/system/etc/task_profiles.json