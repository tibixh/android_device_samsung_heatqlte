# Inherit from vendor
$(call inherit-product-if-exists, vendor/samsung/heatqlte/heatqlte-vendor.mk)

# Inherit from common
$(call inherit-product, device/samsung/qcom-common/qcom-common.mk)

LOCAL_PATH := device/samsung/heatqlte

# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.carrier.rc:root/init.carrier.rc \
    $(LOCAL_PATH)/rootdir/init.qcom.class_core.sh:root/init.qcom.class_core.sh \
    $(LOCAL_PATH)/rootdir/fstab.qcom:root/fstab.qcom \
    $(LOCAL_PATH)/rootdir/init.mdm.sh:root/init.mdm.sh \
    $(LOCAL_PATH)/rootdir/init.qcom.early_boot.sh:root/init.qcom.early_boot.sh \
    $(LOCAL_PATH)/rootdir/ueventd.qcom.rc:root/ueventd.qcom.rc \
    $(LOCAL_PATH)/rootdir/init.qcom.usb.sh:root/init.qcom.usb.sh \
    $(LOCAL_PATH)/rootdir/init.class_main.sh:root/init.class_main.sh \
    $(LOCAL_PATH)/rootdir/init.qcom.factory.sh:root/init.qcom.factory.sh \
    $(LOCAL_PATH)/rootdir/init.target.rc:root/init.target.rc \
    $(LOCAL_PATH)/rootdir/init.container.rc:root/init.container.rc \
    $(LOCAL_PATH)/rootdir/init.qcom.usb.rc:root/init.qcom.usb.rc \
    $(LOCAL_PATH)/rootdir/init.qcom.rc:root/init.qcom.rc \
    $(LOCAL_PATH)/rootdir/init.samsung.rc:root/init.samsung.rc \
    $(LOCAL_PATH)/rootdir/ueventd.rc:root/ueventd.rc \
    $(LOCAL_PATH)/rootdir/init.qcom.ssr.sh:root/init.qcom.ssr.sh \
    $(LOCAL_PATH)/rootdir/init.trace.rc:root/init.trace.rc \
    $(LOCAL_PATH)/rootdir/init.qcom.sh:root/init.qcom.sh \
    $(LOCAL_PATH)/rootdir/init.usb.rc:root/init.usb.rc \
    $(LOCAL_PATH)/rootdir/init.qcom.syspart_fixup.sh:root/init.qcom.syspart_fixup.sh

# Init ETC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.audio.sh:system/etc/init.qcom.audio.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.rootagent.sh:system/etc/init.qcom.rootagent.sh \
    $(LOCAL_PATH)/rootdir/etc/init.ath3k.bt.sh:system/etc/init.ath3k.bt.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
    $(LOCAL_PATH)/rootdir/etc/init.crda.sh:system/etc/init.crda.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.fm.sh:system/etc/init.qcom.fm.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.sdio.sh:system/etc/init.qcom.sdio.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.wifi.sh:system/etc/init.qcom.wifi.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.coex.sh:system/etc/init.qcom.coex.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.uicc.sh:system/etc/init.qcom.uicc.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.efs.sync.sh:system/etc/init.qcom.efs.sync.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.modem_links.sh:system/etc/init.qcom.modem_links.sh 

# Resolution
TARGET_SCREEN_WIDTH := 480
TARGET_SCREEN_HEIGHT := 800

# Support for Browser's saved page feature. This allows
# for pages saved on previous versions of the OS to be
# viewed on the current OS.
PRODUCT_PACKAGES += \
    libskia_legacy

# Insecure adb
ifneq ($(TARGET_BUILD_VARIANT),eng)
    ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.secure=0 \
	ro.adb.secure=0 \
	ro.debuggable=1 \
	persist.service.adb.enable=1 \
	persist.vendor.radio.adb_log_on=1
endif

# ANT+
PRODUCT_PACKAGES += \
    AntHalService \
    com.dsi.ant.antradio_library \
    libantradio

# Audio
PRODUCT_PACKAGES += \
    audiod \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    audio.primary.msm8916 \
    audio_policy.msm8916 \
    libaudio-resampler \
    tinymix \
    libtinycompress \
    libaudioroute

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_effects.conf:system/etc/audio_effects.conf \
    $(LOCAL_PATH)/configs/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/audio/mixer_paths.xml:system/etc/mixer_paths.xml

# Filesystem
PRODUCT_PACKAGES += \
    e2fsck \
    make_ext4fs

PRODUCT_BOOT_JARS += \
    qcmediaplayer

# Configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/sec_config:system/etc/sec_config

# Doze
PRODUCT_PACKAGES += \
    SamsungDoze

# Hardware specific features
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
	frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.software.print.xml:system/etc/permissions/android.software.print.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

# Display
PRODUCT_PACKAGES += \
    copybit.msm8916 \
    gralloc.msm8916 \
    hwcomposer.msm8916 \
    memtrack.msm8916 \
    libtinyxml

# Keylayout & touch
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl \
	$(LOCAL_PATH)/keylayout/sec_touchscreen.kl:system/usr/keylayout/sec_touchscreen.kl \
	$(LOCAL_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

# Connectivity Engine support
PRODUCT_PACKAGES += \
	libcnefeatureconfig

# CRDA
PRODUCT_PACKAGES += \
    crda \
    linville.key.pub.pem \
    regdbdump \
    regulatory.bin

# Ebtables
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes \
    libebtc

# RIL
PRODUCT_PACKAGES += \
	libxml2

# Lights
PRODUCT_PACKAGES += \
	lights.msm8916

# Power HAL
PRODUCT_PACKAGES += \
	power.msm8916

# USB
PRODUCT_PACKAGES += \
	com.android.future.usb.accessory

# Bluetooth
PRODUCT_PACKAGES += \
	javax.btobex \
	libbt-vendor

# Wifi
PRODUCT_PACKAGES += \
    libqsap_sdk \
    libQWiFiSoftApCfg \
    libwpa_client \
    hostapd \
    wpa_supplicant \
    libwcnss_qmi \
    wcnss_service

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/wifi/cred.conf:system/etc/wifi/cred.conf \
	$(LOCAL_PATH)/configs/wifi/hostapd.accept:system/etc/hostapd/hostapd.accept \
	$(LOCAL_PATH)/configs/wifi/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \
	$(LOCAL_PATH)/configs/wifi/hostapd.deny:system/etc/hostapd/hostapd.deny \
	$(LOCAL_PATH)/configs/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
	$(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
	$(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
	$(LOCAL_PATH)/configs/wifi/WCNSS_qcom_cfg.ini:system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini \
	$(LOCAL_PATH)/configs/wifi/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin \
    kernel/samsung/heatqlte/drivers/staging/prima/firmware_bin/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay
