#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

BOARD_VENDOR := alldocube
DEVICE_PATH := device/alldocube/T811M

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo300

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a75

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := T811M 

# Display
TARGET_SCREEN_DENSITY := 213

# Boot image
BOARD_BOOT_HEADER_VERSION := 4
BOARD_USES_GENERIC_KERNEL_IMAGE := true
BOARD_RAMDISK_USE_LZ4 := true
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

BOARD_KERNEL_CMDLINE += bootopt=64S3,32N2,64N2 androidboot.selinux=permissive

BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_BASE := 0x3fff8000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x26f08000
BOARD_KERNEL_TAGS_OFFSET := 0x07c88000
BOARD_DTB_OFFSET := 0x07c88000

BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)

# Kernel
# Kill lineage kernel build task while preserving kernel
TARGET_NO_KERNEL_OVERRIDE := true

# Workaround to make lineage's soong generator work
TARGET_KERNEL_SOURCE := $(KERNEL_PATH)/kernel-headers

LOCAL_KERNEL := $(KERNEL_PATH)/Image.gz
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# DTB
BOARD_PREBUILT_DTBOIMAGE := $(KERNEL_PATH)/dtbo.img
BOARD_PREBUILT_DTBIMAGE_DIR := $(KERNEL_PATH)/dtb

# Kernel modules for vendor ramdisk (normal boot)
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(KERNEL_PATH)/modules-ramdisk/modules.load))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(addprefix $(KERNEL_PATH)/modules-ramdisk/, $(BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD))

# Recovery kernel modules (recovery boot)
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(strip $(shell cat $(KERNEL_PATH)/modules-ramdisk/modules.load.recovery))
RECOVERY_MODULES := $(addprefix $(KERNEL_PATH)/modules-ramdisk/, $(BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD))

# Prevent duplicated entries (to solve duplicated build rules problem)
BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(sort $(BOARD_VENDOR_RAMDISK_KERNEL_MODULES) $(RECOVERY_MODULES))

# Vendor modules (installed to vendor_dlkm)
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(KERNEL_PATH)/modules-dlkm/modules.load))
BOARD_VENDOR_KERNEL_MODULES := $(addprefix $(KERNEL_PATH)/modules-dlkm/, $(BOARD_VENDOR_KERNEL_MODULES_LOAD))

# Metadata
BOARD_USES_METADATA_PARTITION := true

# OTA Updates
TARGET_OTA_ASSERT_DEVICE := T811M

# Plaform
BOARD_HAS_MTK_HARDWARE := true
TARGET_BOARD_PLATFORM := mt6789

# Security patch level
VENDOR_SECURITY_PATCH := 2023-11-05

# Treble
BOARD_VNDK_VERSION := current
