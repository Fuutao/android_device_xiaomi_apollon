#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm8250-common
$(call inherit-product, device/xiaomi/sm8250-common/kona.mk)

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Audio configs
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/audio/,$(TARGET_COPY_OUT_VENDOR)/etc)

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# Camera
PRODUCT_PACKAGES += \
    libpiex_shim

# MIUI Camera
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/default-permissions/miuicamera-permissions.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/default-permissions/miuicamera-permissions.xml \
    $(LOCAL_PATH)/configs/permissions/privapp-permissions-miui.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-miui.xml \
    $(LOCAL_PATH)/configs/public.libraries-xiaomi.txt:$(TARGET_COPY_OUT_SYSTEM)/etc/public.libraries-xiaomi.txt \
    $(LOCAL_PATH)/configs/sysconfig/miuicamera-hiddenapi-package-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/miuicamera-hiddenapi-package-whitelist.xml

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# QDCM
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/qdcm/,$(TARGET_COPY_OUT_VENDOR)/etc)

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 29

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit from vendor blobs
$(call inherit-product, vendor/xiaomi/apollon/apollon-vendor.mk)
