# Input Device Configuration for ChipOne TDDI touchscreen (mumba)
#
# The chipone_tddi_v3_mmi driver registers the input device as "Chipone-TDDI".
# Declaring deviceType = touchScreen ensures that TWRP and the Android input
# system treat it as a primary touchscreen.
#
touch.deviceType = touchScreen
touch.orientationAware = 1
