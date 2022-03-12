LOCAL_PATH := device/samsung/heatqlte

#Inherit from vendor
$(call inherit-product-if-exists, vendor/samsung/heatqlte/heatqlte-vendor.mk)

# Inherit from common
$(call inherit-product-if-exists, device/samsung/qcom-common/qcom-common.mk)

PRODUCT_PACKAGES += libtime_genoff

# Init
PRODUCT_PACKAGES += \
    init.qcom.rc \
    init.qcom.power.rc \
    init.qcom.usb.rc \
    init.recovery.qcom.rc \
	init.crda.sh \
    init.qcom.bt.sh \
    init.qcom.coex.sh \
    ueventd.qcom.rc

PRODUCT_PACKAGES += \
    services-ext \
    init.cne.rc

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	ro.adb.secure=0 \
	ro.debuggable=1

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay