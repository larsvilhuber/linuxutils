#!/bin/bash
if [[ -z $1 ]]
then
cat << EOF
	$0 CW|go

	will rotate CW
EOF
exit 2
fi

rot_dir=$1

# get state from one of the WACOM properties
state=$(xinput --list-props "Wacom ISDv4 E6 Pen eraser" | grep "Wacom Rotation" | awk -F: ' { print $2 } ' | awk ' { print $1 } ')

# rotate
case $state in
    0)
	next_state=$((2+$state))
	;;
    1)  
	next_state=$((${state}-1))
	;;
    2)
	next_state=$((${state}+1))
	;;
    3)
	next_state=1
	;;
esac
echo "Current state: $state"
echo $HOME/bin/rotate_monitor.sh $next_state  
$HOME/bin/rotate_monitor.sh $next_state  
