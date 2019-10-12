INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = goAwayBlurryCircles

goAwayBlurryCircles_FILES = Tweak.x
goAwayBlurryCircles_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += gabcprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
