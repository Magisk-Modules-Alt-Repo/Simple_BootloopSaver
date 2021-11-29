# Magisk BootloopSaver
## About
Protect your system from bootloop caused by Magisk modules. In case the data partition is encrypted and you cannot access `/data/adb/modules`, or you don't want to turn off **force encription** because when your phone with **force encryption** disabled is stolen, thief can copy your `/data` and your private data will be exposed!!! 

## Requirements
- Magisk 20.4+ is installed

## Installation
It's Magisk module, flash it in **Magisk** app

## Usage

Automatically detect if you got bootloop (zygote keep restart)

Disable all modules and restart the system if zygote keep restarting in 50s

Without this module, you can also do this manually by booting into Safe mode then reboot back!
