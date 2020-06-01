include $(THEOS)/makefiles/common.mk
ARCHS = arm64 arm64e
BUNDLE_NAME = RainbowCCSwitchesPrefs


RainbowCCSwitchesPrefs_FILES = RCCSRootListController.m
RainbowCCSwitchesPrefs_INSTALL_PATH = /Library/PreferenceBundles
RainbowCCSwitchesPrefs_FRAMEWORKS = UIKit
RainbowCCSwitchesPrefs_PRIVATE_FRAMEWORKS = Preferences
RainbowCCSwitchesPrefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/RainbowCCSwitchesPrefs.plist$(ECHO_END)
