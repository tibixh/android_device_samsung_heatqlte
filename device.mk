# Inherit from vendor
$(call inherit-product-if-exists, vendor/samsung/heatqlte/heatqlte-vendor.mk)

# Inherit from common
$(call inherit-product, device/samsung/msm8916-common/msm8916.mk)

# Inhert dalvik heap values from aosp
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

LOCAL_PATH := device/samsung/heatqlte

# Insecure adb
ifeq ($(TARGET_BUILD_VARIANT),userdebug)
    ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.secure=0 \
	ro.root=1 \
	ro.adb.secure=0 \
	ro.debuggable=1 \
	persist.service.adb.enable=1 \
	persist.vendor.radio.adb_log_on=1
endif

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/mixer_paths.xml:system/etc/mixer_paths.xml

# Media configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/media_profiles.xml:system/etc/media_profiles.xml

# Lights
PRODUCT_PACKAGES += \
	lights.msm8916

# RIL
PRODUCT_PACKAGES += \
	libril_shim

# Overlay
DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay $(DEVICE_PACKAGE_OVERLAYS)
