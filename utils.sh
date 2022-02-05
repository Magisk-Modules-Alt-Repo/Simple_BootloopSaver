FILE="$0"; NAME="$1"; VALUE="$2"; MODID="/data/adb/modules/huskydg_bootloopsaver"; VX="$@"

MODDIR=${0%/*}

abort(){ echo "$1"; exit 1; }


write_log(){ 
TEXT=$@; echo "[`date +%d%m%y` `date +%T`]: $TEXT" >>/cache/bootloop_saver.log 
}

exit_log(){
write_log "$@"; exit 0;
}

mod_prop(){
NAME=$1; VARPROP=$2; FILE="$3"; [ ! "$FILE" ] && FILE="/tool_files/system.prop"
if [ "$NAME" ] && [ ! "$NAME" == "=" ]; then
touch "$FILE" 2>$no
echo "$NAME=$VARPROP" | while read prop; do export newprop=$(echo ${prop} | cut -d '=' -f1); sed -i "/${newprop}/d" "$FILE"; cat="$(cat "$FILE")"; echo $prop > "$FILE"; echo -n "$cat" >>"$FILE"; done 2>$no
else
echo "Change property of a file\nusage: mod_prop NAME VALUE FILE"
fi
}


disable_modules(){
COUNT=0
list="$(find /data/adb/modules/* -prune -type d)"
IFS=$"
"
for module in $list; do
COUNT="$(($COUNT+1))"
echo -n >> $module/disable
done

## Disable all modules except itself

rm -rf "$MODDIR/disable"
COUNT="$(($COUNT-1))"
sed -Ei "s/^description=(\[.*][[:space:]]*)?/description=[ Disabled $COUNT modules at `date +%d.%m.%y` `date +%T` ] /g" "$MODDIR/module.prop"
reboot
exit
}


