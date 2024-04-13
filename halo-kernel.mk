#
# Copyright (C) 2023 Project Mia
#
# SPDX-License-Identifier: Apache-2.0
#

KERNEL_PATH := device/lenovo/halo-kernel

# Kernel
PRODUCT_COPY_FILES += \
    $(KERNEL_PATH)/dtb.img:$(PRODUCT_OUT)/dtb.img
