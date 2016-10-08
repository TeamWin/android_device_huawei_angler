# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8994
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := msm8994
TARGET_BOARD_PLATFORM_GPU := qcom-adreno430

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_SMP := true

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic

BOARD_KERNEL_CMDLINE := androidboot.hardware=angler androidboot.console=ttyHSL0 msm_rtb.filter=0x37 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 boot_cpus=0-5

BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x02000000 --tags_offset 0x01e00000

# prebuilt kernel
TARGET_PREBUILT_KERNEL := device/huawei/angler/kernel
# else uncomment below to build from sauce
# TARGET_KERNEL_SOURCE := kernel/huawei/angler
# TARGET_KERNEL_CONFIG := angler_defconfig

BOARD_BOOTIMAGE_PARTITION_SIZE := 41943040
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 41943040
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1073741824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2147483648
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

#TW_THEME := portrait_hdpi
DEVICE_RESOLUTION := 1440x2560
RECOVERY_GRAPHICS_USE_LINELENGTH := true
BOARD_SUPPRESS_SECURE_ERASE := true
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_INCLUDE_CRYPTO := true
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TARGET_RECOVERY_QCOM_RTC_FIX := true

# MultiROM config.
TARGET_RECOVERY_IS_MULTIROM := true
MR_INPUT_TYPE := type_b
MR_INIT_DEVICES := device/huawei/angler/multirom/mr_init_devices.c
MR_DPI := xhdpi
MR_DPI_FONT := 435
MR_FSTAB := device/huawei/angler/recovery.fstab
MR_USE_MROM_FSTAB := false
MR_KEXEC_MEM_MIN := 0x0
MR_DEVICE_HOOKS := device/huawei/angler/multirom/mr_hooks.c
MR_DEVICE_HOOKS_VER := 6
MR_PIXEL_FORMAT := "RGBX_8888"
MR_ENCRYPTION := true
MR_ENCRYPTION_SETUP_SCRIPT := device/huawei/angler/multirom/mr_cp_crypto.sh
MR_ENCRYPTION_FAKE_PROPERTIES := true
MR_USE_QCOM_OVERLAY := true
MR_QCOM_OVERLAY_HEADER := device/huawei/angler/multirom/mr_qcom_overlay.h
MR_QCOM_OVERLAY_CUSTOM_PIXEL_FORMAT := MDP_RGBX_8888
