ui_print "- Set up module..."
unzip -o "$ZIPFILE" "saver.exec" -d "$MODPATH" &>/dev/null
chmod 750 "$MODPATH/saver.exec"