# Magisk BootloopSaver

> WARNING: Most of bootloop can be prevented but not completely. The script can be killed by other process, another module or broken Magisk. Magisk should add a function that, when it finds a file created in Custom Recovery (example: /cache/disable_magisk), it fires off all modules.
## About
Protect your system from bootloop caused by Magisk modules. In case the data partition is encrypted and you cannot access `/data/adb/modules`, or you don't want to turn off **force encryption** to protect your private data.

## Requirements
- Magisk 20.4+ is installed

## Installation
It's Magisk module, flash it in **Magisk** app

## Usage

### Auto detect
Usually, bootloop occurs because zygote doesn't start properly or stuck at restarting. The script run in `late_start` mode. It will check Zygote's Process ID 3 times every 15 seconds.  And if Zygote's Process ID doesn't match for 3 times, check the Process ID for next 15 seconds to make sure and if it's different again, the script will disable all modules and reboot the your device.

### Disable from Custom Recovery


You can boot into **TWRP** and create a dummy file named `disable_magisk` in one of these location to tell the script disable all modules and reboot your device (if **Auto detect** is not working):
- /cache
- /data/unencrypted
- /metadata
- /persist
- /mnt/vendor/persist

How to create a file in TWRP? Open Terminal Emulator in TWRP and type:

```
touch /cache/disable_magisk
```

**NOTE: MAKE SURE ALL PARTITIONS ARE MOUNTED**
