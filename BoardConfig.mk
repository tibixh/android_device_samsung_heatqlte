# Inherit from common
include device/samsung/msm8916-common/BoardConfigCommon.mk

# Includes from vendor
-include vendor/samsung/heatqlte/BoardConfigVendor.mk

LOCAL_PATH := device/samsung/heatqlte

# Asserts
TARGET_OTA_ASSERT_DEVICE := heatqlte,heatqltexx,g357fz,sm-g357fz

# Kernel
TARGET_KERNEL_VARIANT_CONFIG := msm8916_sec_heatqlte_defconfig
BOARD_KERNEL_CMDLINE += \
	androidboot.selinux=permissive

# Partitions
BOARD_CACHEIMAGE_PARTITION_SIZE := 524288000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1572864000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5509201920

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# RIL
BOARD_MODEM_TYPE := xmm7260

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# Properties
TARGET_SYSTEM_PROP += $(LOCAL_PATH)/system.prop
