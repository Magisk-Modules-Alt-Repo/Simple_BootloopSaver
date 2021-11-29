# Magisk BootloopSaver

## About
Protect your system from bootloop caused by Magisk modules. In case the data partition is encrypted and you cannot access `/data/adb/modules`, or you don't want to turn off **force encription** because when your phone with **force encryption** disabled is stolen, thief can copy your `/data` and your private data will be exposed!!! 

## Requirements
- Magisk 20.4+ is installed

## Installation
It's Magisk module, flash it in **Magisk** app

## Usage

After flashing this module, you don't have to do anything else.  This module will do its job: detect if you have a bootloop or not (the zygote keeps rebooting over and over again)

If yes, it will disable all modules and reboot the system.

Without this module, another way to disable all modules is to boot into Safe mode and then reboot!
