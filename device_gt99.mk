$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/cubot/gt99/gt99-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/cubot/gt99/overlay

# Set usb type
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.sys.usb.config=mass_storage,adb \
    persist.service.adb.enable=1

LOCAL_PATH := device/cubot/gt99
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)


PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_gt99
PRODUCT_DEVICE := gt99
DEVICE_RESOLUTION := 720x1280
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1280
