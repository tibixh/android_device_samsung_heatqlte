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

# Keylayout & touch
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl \
	$(LOCAL_PATH)/configs/keylayout/sec_touchscreen.kl:system/usr/keylayout/sec_touchscreen.kl \
	$(LOCAL_PATH)/configs/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

# Lights
PRODUCT_PACKAGES += \
	lights.msm8916

# NFC
PRODUCT_PACKAGES += \
	com.android.nfc_extras \
	libnfc_nci \
	libnfc_nci_jni \
	NfcNci \
	Tag

PRODUCT_COPY_FILES += \
	frameworks/base/nfc-extras/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
	frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
	frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/nfc/libnfc-sec-hal.conf:system/etc/libnfc-sec-hal.conf \
	$(LOCAL_PATH)/configs/nfc/libnfc-sec.conf:system/etc/libnfc-brcm.conf \
	$(LOCAL_PATH)/configs/nfc/nfcee_access.xml:system/etc/nfcee_access.xml \
	frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
	packages/apps/Nfc/migrate_nfc.txt:system/etc/updatecmds/migrate_nfc.txt

# Overlay
DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay $(DEVICE_PACKAGE_OVERLAYS)