LOCAL_PATH := device/samsung/heatqlte

# Inherit from vendor
$(call inherit-product-if-exists, vendor/samsung/heatqlte/heatqlte-vendor.mk)

# Inherit from common
$(call inherit-product-if-exists, device/samsung/qcom-common/qcom-common.mk)

# Include package config fragments
include $(LOCAL_PATH)/product/*.mk

# Resolution
TARGET_SCREEN_WIDTH := 480
TARGET_SCREEN_HEIGHT := 800

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Insecure adb
ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.secure=0 \
	ro.debuggable=1 \
	ro.adb.secure=0 \
	persist.service.adb.enable=1

# Doze
PRODUCT_PACKAGES += \
    SamsungDoze

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay