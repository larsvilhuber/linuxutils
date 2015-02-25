#!/bin/bash
# get Wacom IDS
[[ -z $1 ]] && undo= || undo=yes
WACOM_IDS=$(xinput --list | grep "Wacom"  | awk -F= '{ print $2 } ' | awk ' { print $1 } ')
# get device
INTERNAL=LVDS1
for arg in $WACOM_IDS
do
  xinput --map-to-output $arg $INTERNAL
done
[[ "$undo" = "yes" ]] && exit
# now the same for the Dell monitor
DELL_IDS=$(xinput --list | grep "CoolTouch"  | awk -F= '{ print $2 } ' | awk ' { print $1 } ')
# get device
DELL=$(xrandr | grep "1920x1080" | awk '{ print $1 } ')
for arg in $DELL_IDS
do
  xinput --map-to-output $arg $DELL
done

