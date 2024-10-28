#!/usr/bin/env bash

# Current Theme
dir="$HOME/.config/rofi/powermenu/"
theme='style'

# CMDs
lastlogin="`last $USER | head -n1 | tr -s ' ' | cut -d' ' -f5,6,7`"
uptime="`uptime -p | sed -e 's/up //g'`"
host=`hostname`

# Options
shutdown=''
reboot=''
lock=''
logout=''

# Rofi CMD
rofi_cmd() {
	rofi -dmenu -p " $USER@$host" -mesg " Last Login: $lastlogin |  Uptime: $uptime" -theme ${dir}/${theme}.rasi
}

# Confirmation CMD
confirm_cmd() {
	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 350px;}' \
		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-theme ${dir}/${theme}.rasi
}

# Ask for confirmation
confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$lock\n$logout\n$reboot\n$shutdown" | rofi_cmd
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $shutdown)
		shutdown now
        ;;
    $reboot)
		reboot
        ;;
    $lock)
        hyprlock
        ;;
    $logout)
		hyprctl dispatch exit
        ;;
esac
