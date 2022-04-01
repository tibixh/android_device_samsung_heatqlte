LOCAL_PATH := device/samsung/heatqlte

# Inherit from vendor
$(call inherit-product-if-exists, vendor/samsung/heatqlte/heatqlte-vendor.mk)

# Inherit from common
$(call inherit-product-if-exists, device/samsung/qcom-common/qcom-common.mk)

# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.carrier.rc:root/init.carrier.rc \
    $(LOCAL_PATH)/rootdir/init.qcom.class_core.sh:root/init.qcom.class_core.sh \
    $(LOCAL_PATH)/rootdir/fstab.qcom:root/fstab.qcom \
    $(LOCAL_PATH)/rootdir/init.mdm.sh:root/init.mdm.sh \
    $(LOCAL_PATH)/rootdir/init.environ.rc:root/init.environ.rc \
    $(LOCAL_PATH)/rootdir/init.qcom.early_boot.sh:root/init.qcom.early_boot.sh \
    $(LOCAL_PATH)/rootdir/ueventd.qcom.rc:root/ueventd.qcom.rc \
    $(LOCAL_PATH)/rootdir/init.qcom.usb.sh:root/init.qcom.usb.sh \
    $(LOCAL_PATH)/rootdir/init.class_main.sh:root/init.class_main.sh \
    $(LOCAL_PATH)/rootdir/init.qcom.factory.sh:root/init.qcom.factory.sh \
    $(LOCAL_PATH)/rootdir/init.target.rc:root/init.target.rc \
    $(LOCAL_PATH)/rootdir/init.container.rc:root/init.container.rc \
    $(LOCAL_PATH)/rootdir/init.qcom.usb.rc:root/init.qcom.usb.rc \
    $(LOCAL_PATH)/rootdir/init.qcom.rc:root/init.qcom.rc \
    $(LOCAL_PATH)/rootdir/ueventd.rc:root/ueventd.rc \
    $(LOCAL_PATH)/rootdir/init.qcom.ssr.sh:root/init.qcom.ssr.sh \
    $(LOCAL_PATH)/rootdir/init.trace.rc:root/init.trace.rc \
    $(LOCAL_PATH)/rootdir/init.qcom.sh:root/init.qcom.sh \
    $(LOCAL_PATH)/rootdir/init.usb.rc:root/init.usb.rc \
    $(LOCAL_PATH)/rootdir/init.qcom.syspart_fixup.sh:root/init.qcom.syspart_fixup.sh

# # Init ETC
# PRODUCT_COPY_FILES += \
#     $(LOCAL_PATH)/rootdir/etc/init.qcom.audio.sh:root/etc/init.qcom.audio.sh \
#     $(LOCAL_PATH)/rootdir/etc/init.qcom.rootagent.sh:root/etc/init.qcom.rootagent.sh \
#     $(LOCAL_PATH)/rootdir/etc/init.ath3k.bt.sh:root/etc/init.ath3k.bt.sh \
#     $(LOCAL_PATH)/rootdir/etc/init.qcom.post_boot.sh:root/etc/init.qcom.post_boot.sh \
#     $(LOCAL_PATH)/rootdir/etc/init.crda.sh:root/etc/init.crda.sh \
#     $(LOCAL_PATH)/rootdir/etc/init.qcom.fm.sh:root/etc/init.qcom.fm.sh \
#     $(LOCAL_PATH)/rootdir/etc/init.qcom.sdio.sh:root/etc/init.qcom.sdio.sh \
#     $(LOCAL_PATH)/rootdir/etc/init.qcom.wifi.sh:root/etc/init.qcom.wifi.sh \
#     $(LOCAL_PATH)/rootdir/etc/init.qcom.coex.sh:root/etc/init.qcom.coex.sh \
#     $(LOCAL_PATH)/rootdir/etc/init.qcom.bt.sh:root/etc/init.qcom.bt.sh \
#     $(LOCAL_PATH)/rootdir/etc/init.qcom.uicc.sh:root/etc/init.qcom.uicc.sh \
#     $(LOCAL_PATH)/rootdir/etc/init.qcom.efs.sync.sh:root/etc/init.qcom.efs.sync.sh \
#     $(LOCAL_PATH)/rootdir/etc/init.qcom.modem_links.sh:root/etc/init.qcom.modem_links.sh 

# Resolution
TARGET_SCREEN_WIDTH := 480
TARGET_SCREEN_HEIGHT := 800

# Insecure adb
ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.secure=0 \
    ro.debuggable=1 \
	ro.adb.secure=0 \
	persist.service.adb.enable=1

# Doze
PRODUCT_PACKAGES += \
    SamsungDoze

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers

# Display
PRODUCT_PACKAGES += \
	copybit.msm8916 \
	gralloc.msm8916 \
	hwcomposer.msm8916 \
	libtinyxml \
	memtrack.msm8916

# Keylayout & touch
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl \
	$(LOCAL_PATH)/keylayout/sec_touchscreen.kl:system/usr/keylayout/sec_touchscreen.kl \
	$(LOCAL_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl



# Connectivity Engine support
PRODUCT_PACKAGES += \
	libcnefeatureconfig

# JARS
PRODUCT_PACKAGES += \
	com.google.widevine.software.drm

# Keystore
PRODUCT_PACKAGES += \
	keystore.msm8916

# Lights
PRODUCT_PACKAGES += \
	lights.msm8916

# Power HAL
PRODUCT_PACKAGES += \
	power.qcom

# USB
PRODUCT_PACKAGES += \
	com.android.future.usb.accessory

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

# Bluetooth
PRODUCT_PACKAGES += \
	javax.btobex \
	libbt-vendor

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# WLAN
# PRODUCT_PACKAGES += \
# 	hostapd \
# 	iwconfig \
# 	hostapd_cli \
# 	libQWiFiSoftApCfg \
# 	libqsap_sdk \
# 	libwpa_client \
# 	libwcnss_qmi \
# 	wcnss_service \
# 	wpa_supplicant

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay