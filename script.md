I use this script for `saver.exec`:

```
#!/system/bin/sh
MODDIR=${0%/*}
FILE="$0"; NAME="$1"; VALUE="$2"; MODID="/data/adb/modules/huskydg_bootloopsaver"; VX="$@"
abort(){ echo "$1"; exit 1; }

write_log(){ 
TEXT=$@; echo "[`date +%d%m%y` `date +%T`]: $TEXT" >>/cache/bootloop_saver.log 
}

exit_log(){
write_log "$@"; exit 0;
}

main(){
if [ "$NAME" == "process" ]; then
rm -rf /cache/bootloop_saver.log 2>/dev/null
write_log "bootloop saver started"
MAIN_ZYGOTE_NICENAME=zygote
CPU_ABI=$(getprop ro.product.cpu.api)
[ "$CPU_ABI" = "arm64-v8a" -o "$CPU_ABI" = "x86_64" ] && MAIN_ZYGOTE_NICENAME=zygote64

# Wait for zygote starts
sleep 5

ZYGOTE_PID1=$(pidof "$MAIN_ZYGOTE_NICENAME" | awk '{ print $1 '})
write_log "pid of zygote stage 1: $ZYGOTE_PID1"
sleep 15
ZYGOTE_PID2=$(pidof "$MAIN_ZYGOTE_NICENAME" | awk '{ print $1 '})
write_log "pid of zygote stage 2: $ZYGOTE_PID2"
sleep 15
ZYGOTE_PID3=$(pidof "$MAIN_ZYGOTE_NICENAME" | awk '{ print $1 '})
write_log "pid of zygote stage 3: $ZYGOTE_PID3"

[ "$ZYGOTE_PID1" = "$ZYGOTE_PID2" ] && [ "$ZYGOTE_PID2" = "$ZYGOTE_PID3" ] && exit_log "pid of 3 stage zygote is the same"
write_log "pid of 3 stage zygote is different"
sleep 15
ZYGOTE_PID4=$(pidof "$MAIN_ZYGOTE_NICENAME" | awk '{ print $1 '})
write_log "pid of zygote stage 4: $ZYGOTE_PID4"
[ "$ZYGOTE_PID3" = "$ZYGOTE_PID4" ] && exit_log "pid of zygote stage 3 and 4 is the same."
write_log "zygote keeps restarting in 50s, disable all modules and restart"
list="$(find /data/adb/modules/* -prune -type d)"
IFS=$"
"
for module in $list; do
echo -n >> $module/disable
done
reboot
else
echo "Magisk Bootloop Saver by HuskyDG"
fi
}
[ "$(id -u)" != "0" ] && exec su -p -c "$FILE" "$VX" || main
```
