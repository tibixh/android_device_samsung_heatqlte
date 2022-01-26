# Inherit from common
include device/samsung/msm8916-common/BoardConfigCommon.mk

LOCAL_PATH := device/samsung/heatqlte

# Assert
TARGET_OTA_ASSERT_DEVICE := gprimeltexx,fortunafz,grandprimelte,grandprimeltexx

# Kernel
TARGET_KERNEL_VARIANT_CONFIG := msm8916_sec_fortuna_eur_defconfig

# Partition sizes
BOARD_BOOTIMAGE_PARTITION_SIZE := 13631488
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 15728640
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1572864000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5509201920
BOARD_CACHEIMAGE_PARTITION_SIZE := 524288000

# Properties
TARGET_SYSTEM_PROP += $(LOCAL_PATH)/system.prop