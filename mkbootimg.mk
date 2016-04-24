LOCAL_PATH := $(call my-dir)

KERNEL_PATH := $(LOCAL_PATH)/kernel
DTBTOOL := $(KERNEL_PATH)/dtbTool
KERNEL := $(KERNEL_PATH)/kernel
DT_IMG := $(KERNEL_PATH)/dt.img

INSTALLED_BOOTIMAGE_TARGET := $(PRODUCT_OUT)/boot.img
INSTALLED_RECOVERYIMAGE_TARGET := $(PRODUCT_OUT)/recovery.img

## Overload bootimg generation: Same as the original, + --dt arg
$(INSTALLED_BOOTIMAGE_TARGET): $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES)
	@echo ----- Made boot image -------- $@
	$(hide) $(DTBTOOL) --kernel $(KERNEL) --ramdisk $(PRODUCT_OUT)/ramdisk.img --cmdline "$(BOARD_KERNEL_CMDLINE)" --base $(BOARD_KERNEL_BASE) --dt $(DT_IMG) --pagesize $(BOARD_KERNEL_PAGESIZE) -o $(INSTALLED_BOOTIMAGE_TARGET)
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE),raw)
	@echo ----- Added DTB ------------------ $@

$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) \
	$(recovery_ramdisk) \
	$(recovery_kernel)
	@echo ----- Made recovery image -------- $@
	$(hide) $(DTBTOOL) --kernel $(KERNEL) --ramdisk $(PRODUCT_OUT)/ramdisk-recovery.img --cmdline "$(BOARD_KERNEL_CMDLINE)" --base $(BOARD_KERNEL_BASE) --dt $(DT_IMG) --pagesize $(BOARD_KERNEL_PAGESIZE) -o $(INSTALLED_RECOVERYIMAGE_TARGET)
	@echo ----- Added DTB ------------------ $@
