#
# Copyright (C) 2023 Project Mia
#
# SPDX-License-Identifier: Apache-2.0
#

KERNEL_PATH := device/lenovo/halo-kernel

# Kernel
TARGET_FORCE_PREBUILT_KERNEL := true
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_VERSION := 5.10
TARGET_PREBUILT_KERNEL := $(KERNEL_PATH)/Image
BOARD_PREBUILT_DTBOIMAGE := $(KERNEL_PATH)/dtbo.img
BOARD_MKBOOTIMG_ARGS += --dtb $(KERNEL_PATH)/dtb.img

# Kernel modules
BOARD_VENDOR_KERNEL_MODULES_BLOCKLIST_FILE := \
    $(KERNEL_PATH)/modules_vendor_dlkm/modules.blocklist

BOARD_VENDOR_KERNEL_MODULES_LOAD := \
    $(addprefix $(KERNEL_PATH)/modules_vendor_dlkm/, \
    $(notdir $(file < $(KERNEL_PATH)/modules_vendor_dlkm/modules.load)))

BOARD_VENDOR_KERNEL_MODULES := \
    $(wildcard $(KERNEL_PATH)/modules_vendor_dlkm/*.ko)

BOARD_VENDOR_RAMDISK_KERNEL_MODULES_BLOCKLIST_FILE := \
    $(KERNEL_PATH)/modules_vendor_dlkm/modules.blocklist

BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := \
    $(addprefix $(KERNEL_PATH)/modules/, \
    $(notdir $(file < $(KERNEL_PATH)/modules/modules.load)))

BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := \
    $(addprefix $(KERNEL_PATH)/modules/, \
    $(notdir $(file < $(KERNEL_PATH)/modules/modules.load.recovery)))

BOARD_VENDOR_RAMDISK_KERNEL_MODULES := \
    $(wildcard $(KERNEL_PATH)/modules/*.ko)

# Hack to fix build
$(shell mkdir -p $(shell pwd)/out/target/product/halo/obj/KERNEL_OBJ/usr)
