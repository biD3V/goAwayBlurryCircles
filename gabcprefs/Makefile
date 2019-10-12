ARCHS = arm64 arm64e
TARGET = iphone:clang:11.2:11.2

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = GABCPrefs

GABCPrefs_FILES = GABCRootListController.m
GABCPrefs_INSTALL_PATH = /Library/PreferenceBundles
GABCPrefs_FRAMEWORKS = UIKit
GABCPrefs_PRIVATE_FRAMEWORKS = Preferences
GABCPrefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/GABCPrefs.plist$(ECHO_END)
