# Inherit device configuration for fb0.
$(call inherit-product, device/fih/fb0/fb0.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_fb0
PRODUCT_BRAND := fih
PRODUCT_DEVICE := fb0
PRODUCT_MODEL := FB0
PRODUCT_MANUFACTURER := FIH
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=fb0 BUILD_ID=GRJ22 BUILD_DISPLAY_ID=GRJ90 BUILD_FINGERPRINT=Motorola/Caymus_VRGUS/Triumph/Triumph:2.2.2/FROYO/1010_2_039_110607:user/release-keys PRIVATE_BUILD_DESC="Caymus_VRGUS-user 2.2.2 FROYO 1010_2_039 release-keys"

# Extra fb0 overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/fb0

# Broadcom FM radio
$(call inherit-product, vendor/cyanogen/products/bcm_fm_radio.mk)

#
# Set ro.modversion
#
ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-7-$(shell date +%m%d%Y)-NIGHTLY-fb0
else
    ifdef CYANOGEN_RELEASE
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.1.0-RC1-fb0
    else
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.1.0-RC1-fb0-KANG
    endif
endif

#
# Copy passion specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip
