LOCAL_PATH := device/samsung/heatqlte

# Inherit from vendor
-include vendor/samsung/heatqlte/BoardConfigVendor.mk

# Include board config fragments
include $(LOCAL_PATH)/board/*.mk

# Asserts
TARGET_OTA_ASSERT_DEVICE := heatqlte,heatqltexx,g357fz,sm-g357fz







