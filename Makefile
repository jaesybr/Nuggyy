TARGET = iphone:clang:latest:latest
ARCHS = arm64

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Nuggyy
Nuggyy_FILES = Tweak.xm
Nuggyy_CFLAGS = -fobjc-arc

# Adjust the filter plist file name here
Nuggyy_FILTER = Nuggyy.plist

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
    install.exec "killall -9 SpringBoard"
