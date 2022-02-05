# Magisk BootloopSaver

## About
Protect your system from bootloop caused by Magisk modules. In case the data partition is encrypted and you cannot access `/data/adb/modules`, or you don't want to turn off **force encription** because when your phone with **force encryption** disabled is stolen, thief can copy your `/data` and your private data will be exposed!!! 

## Requirements
- Magisk 20.4+ is installed

## Installation
It's Magisk module, flash it in **Magisk** app

## Usage

- Usually, bootloop occurs because zygote doesn't start properly or stuck at restarting. The script run in `late_start` mode. It will check Zygote's Process ID 3 times every 15 seconds.  And if Zygote's Process ID doesn't match for 3 times, check the Process ID for next 15 seconds to make sure and if it's different again, the script will disable all modules and reboot the phone  your.
