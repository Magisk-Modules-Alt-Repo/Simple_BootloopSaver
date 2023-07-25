# Simple BootloopSaver


## About
Protect your system from bootloop caused by Magisk modules.
In case the data partition is encrypted and you cannot access `/data/adb/modules`, or you don't want to turn off **force encryption** to protect your private data.


## Requirements
- Magisk 20.4+ is installed


## Installation
It's Magisk module, flash it in **Magisk** app


## Usage

### Auto detect
Usually, bootloop occurs because zygote doesn't start properly or is stuck restarting.
The script runs in `late_start` mode. It will check Zygote's Process ID 3 times every 15 seconds.
And if Zygote's Process ID doesn't match for 3 times, check the Process ID for next 15 seconds to make sure, and if it's different again, the script will disable all modules and reboot the your device.


## Attribution
Module originally made by [HuskyDG](https://github.com/HuskyDG), but I didn't like how large it was for something that looked like it could be done in less code, so I forked it and made it into just one script.
This involved removing the custom recovery parts, but for me the AutoDetect has worked.
