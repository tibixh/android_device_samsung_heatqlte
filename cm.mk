#
# Copyright (C) 2017 The LineageOS project.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

PRODUCT_RELEASE_NAME := Samsung Galaxy Ace 4

$(call inherit-product, device/samsung/heatqlte/device.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := heatqlte
PRODUCT_NAME := cm_heatqlte
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-G357FZ
PRODUCT_MANUFACTURER := samsung
PRODUCT_CHARACTERISTICS := phone

PRODUCT_GMS_CLIENTID_BASE := android-samsung
