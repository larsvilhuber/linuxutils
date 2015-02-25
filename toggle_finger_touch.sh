#!/bin/bash
if [[ -z $1 ]]
then
echo "Toggle touchscreen on/off/toggle"
exit 2
fi

device=11
prop=275
on=1
off=0
arg=$1

state=$(xinput list-props $device  | grep $prop | awk '{ print $5 }')
toggle=$(( 1- $state ))

	       
xinput set-prop $device $prop ${!arg}

