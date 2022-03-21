LOCAL_PATH := device/samsung/heatqlte

# Inherit from vendor
$(call inherit-product-if-exists, vendor/samsung/heatqlte/heatqlte-vendor.mk)

# Inherit from common
$(call inherit-product-if-exists, device/samsung/qcom-common/qcom-common.mk)

PRODUCT_PACKAGES += libtime_genoff

# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.carrier.rc:root/init.carrier.rc \
    $(LOCAL_PATH)/rootdir/init.qcom.class_core.sh:root/init.qcom.class_core.sh \
    $(LOCAL_PATH)/rootdir/fstab.qcom:root/fstab.qcom \
    $(LOCAL_PATH)/rootdir/init.mdm.sh:root/init.mdm.sh \
    $(LOCAL_PATH)/rootdir/init.environ.rc:root/init.environ.rc \
    $(LOCAL_PATH)/rootdir/init.rc:root/init.rc \
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

# Init ETC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.audio.sh:root/etc/init.qcom.audio.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.rootagent.sh:root/etc/init.qcom.rootagent.sh \
    $(LOCAL_PATH)/rootdir/etc/init.ath3k.bt.sh:root/etc/init.ath3k.bt.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.post_boot.sh:root/etc/init.qcom.post_boot.sh \
    $(LOCAL_PATH)/rootdir/etc/init.crda.sh:root/etc/init.crda.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.fm.sh:root/etc/init.qcom.fm.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.sdio.sh:root/etc/init.qcom.sdio.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.wifi.sh:root/etc/init.qcom.wifi.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.coex.sh:root/etc/init.qcom.coex.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.bt.sh:root/etc/init.qcom.bt.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.uicc.sh:root/etc/init.qcom.uicc.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.efs.sync.sh:root/etc/init.qcom.efs.sync.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.modem_links.sh:root/etc/init.qcom.modem_links.sh 

ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.debuggable=1 \
	ro.adb.secure=0 \
	persist.service.adb.enable=1

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay