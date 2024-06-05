ARCHS = arm64
TARGET = iphone:clang:latest:11.0
DEBUG = 0
PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = YourTweakName
YourTweakName_FILES = Tweak.xm
YourTweakName_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"