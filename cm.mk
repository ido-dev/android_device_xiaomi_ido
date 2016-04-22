#
# Copyright (C) 2015 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, device/xiaomi/ido/full_ido.mk)

# Inherit some common CM stuff
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_NAME := cm_ido
BOARD_VENDOR := xiaomi
TARGET_VENDOR := xiaomi
PRODUCT_DEVICE := ido

# Use the latest approved GMS identifiers
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=ido \
    BUILD_FINGERPRINT=Xiaomi/ido/ido:5.1.1/LMY47V/6.4.21:user/release-keys \
    PRIVATE_BUILD_DESC="ido-user 5.1.1 LMY47V 6.4.21 release-keys"
