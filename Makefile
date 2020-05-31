ARCHS = arm64 arm64e
TARGET = iphone:clang:11.2:11.2

INSTALL_TARGET_PROCESSES = SpringBoard
THEOS_DEVICE_IP = 192.168.0.59

include $(THEOS)/makefiles/common.mk

export TWEAK_NAME = RainbowCCSwitches

$(TWEAK_NAME)_FILES = Tweak/Tweak.x
$(TWEAK_NAME)_CFLAGS = -fobjc-arc
$(TWEAK_NAME)_FRAMEWORKS = UIKit
$(TWEAK_NAME)_EXTRA_FRAMEWORKS += Cephei

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += rainbowccswitchesprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
