# Input Device Configuration for ILITEK TDDI touchscreen (mumba)
#
# The ilitek_v4_mmi driver registers the input device as "ILITEK-TDDI_1".
# Declaring deviceType = touchScreen ensures that TWRP and the Android input
# system treat it as a primary touchscreen.
#
touch.deviceType = touchScreen
touch.orientationAware = 1
