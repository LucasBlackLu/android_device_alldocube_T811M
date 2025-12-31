#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from iPlay_50_mini_Pro device
$(call inherit-product, device/alldocube/iPlay_50_mini_Pro/device.mk)

PRODUCT_DEVICE := iPlay_50_mini_Pro
PRODUCT_NAME := lineage_iPlay_50_mini_Pro
PRODUCT_BRAND := Alldocube
PRODUCT_MODEL := iPlay 50 mini Pro
PRODUCT_MANUFACTURER := alldocube

PRODUCT_GMS_CLIENTID_BASE := android-skythtek

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="iPlay_50_mini_Pro-user 13 TP1A.220624.014 1687767888 release-keys"

BUILD_FINGERPRINT := Alldocube/iPlay_50_mini_Pro/iPlay_50_mini_Pro:13/TP1A.220624.014/1687767888:user/release-keys
