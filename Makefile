THEOS_DEVICE_IP = 192.168.12.16
THEOS_DEVICE_PORT = 22
THEOS_DEVICE_USER = mobile
ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:15.0
# export SSH_ASKPASS = ./ssh-askpass
THEOS_PACKAGE_SCHEME=rootless

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = LookinLoaderRootless
# THEOS_PACKAGE_SCHEME=roothide
THEOS_PACKAGE_SCHEME=rootless


$(TWEAK_NAME)_FILES = Tweak.x
$(TWEAK_NAME)_FRAMEWORKS = UIKit
$(TWEAK_NAME)_CFLAGS = -fobjc-arc -Wdeprecated-declarations -Wno-deprecated-declarations

include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/tool.mk

after-install::
	install.exec "killall -9 SpringBoard"
