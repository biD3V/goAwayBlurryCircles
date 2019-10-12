INSTALL_TARGET_PROCESSES = SpringBoard
PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)

ARCHS = arm64 arm64e
TARGET = iphone:clang:11.2:11.2

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = goAwayBlurryCircles

goAwayBlurryCircles_FILES = Tweak.x
goAwayBlurryCircles_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += gabcprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
