#!/bin/sh

# Apply these patches before compilation:

ROM_TREE=$PWD
PATCHER_PATH=$ROM_TREE/patcher
CUSTOM=$PATCHER_PATH/deadman

SECURITY=$ROM_TREE/patcher/security
SECURITY_JAN17=$SECURITY/2017-01-01
SECURITY_FEB17=$SECURITY/2017-02-01

# Clean up first
cd $ROM_TREE/bionic
git clean -f -d && git reset --hard
cd $ROM_TREE/build
git clean -f -d && git reset --hard
cd $ROM_TREE/external/libavc
git clean -f -d && git reset --hard
cd $ROM_TREE/external/libhevc
git clean -f -d && git reset --hard
cd $ROM_TREE/external/libnl
git clean -f -d && git reset --hard
cd $ROM_TREE/external/libopus
git clean -f -d && git reset --hard
cd $ROM_TREE/external/libvpx
git clean -f -d && git reset --hard
cd $ROM_TREE/external/tremolo
git clean -f -d && git reset --hard
cd $ROM_TREE/frameworks/av
git clean -f -d && git reset --hard
cd $ROM_TREE/frameworks/ex
git clean -f -d && git reset --hard
cd $ROM_TREE/frameworks/base
git clean -f -d && git reset --hard
cd $ROM_TREE/frameworks/native
git clean -f -d && git reset --hard
cd $ROM_TREE/hardware/libhardware
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/Bluetooth
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/LockClock
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/Messaging
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/Settings
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/UnifiedEmail
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/services/Telephony
git clean -f -d && git reset --hard
cd $ROM_TREE/system/core
git clean -f -d && git reset --hard
cd $ROM_TREE/vendor/cm
git clean -f -d && git reset --hard

cd $ROM_TREE

### Custom patches
patch -d build					-p1 -s -N --no-backup-if-mismatch < $CUSTOM/build0.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/frameworks-base0.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/frameworks-base1.patch
patch -d packages/apps/LockClock		-p1 -s -N --no-backup-if-mismatch < $CUSTOM/packages-apps-LockClock0.patch
patch -d packages/apps/Settings			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/packages-apps-Settings0.patch
patch -d packages/apps/Settings			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/packages-apps-Settings1.patch
patch -d packages/apps/Settings			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/packages-apps-Settings2.patch
patch -d packages/apps/Settings			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/packages-apps-Settings3.patch
patch -d packages/apps/Settings			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/packages-apps-Settings4.patch

### Security patches
# 2017-01-01
patch -d build					-p1 -s -N --no-backup-if-mismatch < $SECURITY_JAN17/build0.patch
patch -d external/libhevc			-p1 -s -N --no-backup-if-mismatch < $SECURITY_JAN17/external-libhevc0.patch
patch -d external/libnl				-p1 -s -N --no-backup-if-mismatch < $SECURITY_JAN17/external-libnl0.patch
patch -d external/libopus			-p1 -s -N --no-backup-if-mismatch < $SECURITY_JAN17/external-libopus0.patch
patch -d external/libvpx			-p1 -s -N --no-backup-if-mismatch < $SECURITY_JAN17/external-libvpx0.patch
patch -d external/tremolo			-p1 -s -N --no-backup-if-mismatch < $SECURITY_JAN17/external-tremolo0.patch
patch -d frameworks/av				-p1 -s -N --no-backup-if-mismatch < $SECURITY_JAN17/frameworks-av0.patch
patch -d frameworks/av				-p1 -s -N --no-backup-if-mismatch < $SECURITY_JAN17/frameworks-av1.patch
patch -d frameworks/av				-p1 -s -N --no-backup-if-mismatch < $SECURITY_JAN17/frameworks-av2.patch
patch -d frameworks/av				-p1 -s -N --no-backup-if-mismatch < $SECURITY_JAN17/frameworks-av3.patch
patch -d frameworks/av				-p1 -s -N --no-backup-if-mismatch < $SECURITY_JAN17/frameworks-av4.patch
patch -d frameworks/av				-p1 -s -N --no-backup-if-mismatch < $SECURITY_JAN17/frameworks-av5.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $SECURITY_JAN17/frameworks-base0.patch
patch -d frameworks/ex				-p1 -s -N --no-backup-if-mismatch < $SECURITY_JAN17/frameworks-ex0.patch
patch -d frameworks/native			-p1 -s -N --no-backup-if-mismatch < $SECURITY_JAN17/frameworks-native0.patch
patch -d packages/services/Telephony		-p1 -s -N --no-backup-if-mismatch < $SECURITY_JAN17/packages-services-Telephony0.patch

# 2017-02-01
patch -d bionic					-p1 -s -N --no-backup-if-mismatch < $SECURITY_FEB17/bionic0.patch
patch -d build					-p1 -s -N --no-backup-if-mismatch < $SECURITY_FEB17/build0.patch
patch -d frameworks/av				-p1 -s -N --no-backup-if-mismatch < $SECURITY_FEB17/frameworks-av0.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $SECURITY_FEB17/frameworks-base0.patch
patch -d frameworks/native			-p1 -s -N --no-backup-if-mismatch < $SECURITY_FEB17/frameworks-native0.patch
patch -d frameworks/native			-p1 -s -N --no-backup-if-mismatch < $SECURITY_FEB17/frameworks-native1.patch
patch -d hardware/libhardware			-p1 -s -N --no-backup-if-mismatch < $SECURITY_FEB17/hardware-libhardware0.patch
patch -d packages/apps/Bluetooth		-p1 -s -N --no-backup-if-mismatch < $SECURITY_FEB17/packages-apps-Bluetooth0.patch
patch -d packages/apps/Messaging		-p1 -s -N --no-backup-if-mismatch < $SECURITY_FEB17/packages-apps-Messaging0.patch
patch -d packages/apps/Messaging		-p1 -s -N --no-backup-if-mismatch < $SECURITY_FEB17/packages-apps-Messaging1.patch
patch -d packages/apps/Messaging		-p1 -s -N --no-backup-if-mismatch < $SECURITY_FEB17/packages-apps-Messaging2.patch
patch -d packages/apps/UnifiedEmail		-p1 -s -N --no-backup-if-mismatch < $SECURITY_FEB17/packages-apps-UnifiedEmail0.patch
