MAGISKTMP="$(magisk --path)"
. /data/adb/magisk/util_functions.sh
get_flags
find_boot_image
( if [ ! -z "$BOOTIMAGE" ]; then
    mkdir -p "$TMPDIR/boot"
    dd if=$BOOTIMAGE of="$TMPDIR/boot/boot.img""
    cd "$TMPDIR/boot" || exit 1
    /data/adb/magisk/magiskboot unpack boot.img"
     /data/adb/magisk/magiskboot cpio ramdisk.cpio \
"rm overlay.d/safemode.rc" \
"rm overlay.d/sbin/safemode.sh"
     /data/adb/magisk/magiskboot repack boot.img
     dd of=$BOOTIMAGE if="$TMPDIR/boot/new-boot.img"
fi )
