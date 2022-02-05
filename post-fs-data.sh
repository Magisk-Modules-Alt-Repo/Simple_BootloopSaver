MODDIR=${0%/*}
. "$MODDIR/utils.sh"
DISABLE=false

touch "$MODDIR/skip_mount"

for dir in /cache /data/unencrypted /metadata /persist /mnt/vendor/persist; do
if [ -f "$dir/disable_magisk" ]; then
DISABLE=true
rm -rf "$dir/disable_magisk"
fi
done

$DISABLE && disable_modules