#!/bin/bash
direction=$1
rotation=$2
device[1]="Wacom ISDv4 E6 Finger touch"
rotate_property[1]="Wacom Rotation"
device[2]="Wacom ISDv4 E6 Pen stylus"
rotate_property[2]="Wacom Rotation"
device[3]="Wacom ISDv4 E6 Pen eraser"
rotate_property[3]="Wacom Rotation"
num_devices=3

if [[ -z $rotation ]]
then
case $direction in
	left|2)
 	direction=left
	rotation=2
	;;
	right|1)
	direction=right
	rotation=1
	;;
	normal|0)
	direction=normal
	rotation=0
	;;
	inverted|3)
	direction=inverted
	rotation=3
	;;
	*)
	echo " $0 left|right|normal|inverted"
	exit 2
esac
fi

xrandr -o $direction 
for (( i=1; i<= $num_devices; i++ ))
do 
xinput --set-prop "${device[$i]}" "${rotate_property[$i]}" $rotation
done
