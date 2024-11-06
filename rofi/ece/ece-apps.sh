#!/usr/bin/env bash

dir="$HOME/.config/rofi/ece/"
theme='style'

cmd_output=$(ls ~/Desktop/ECE/apps)

echo $cmd_output

IFS=' ' read -r -a array <<< "$cmd_output"

for index in "${!array[@]}"
do
    echo "$index ${array[index]}"
done



## Run
# ls ~/Desktop/ECE/apps | rofi -dmenu -theme ${dir}/${theme}.rasi -show-icons

echo -en "${array[0]}\0icon\x1f/home/crtvhlx/Desktop/ECE/icons/ArduioIDE.png" | rofi -dmenu -theme ${dir}/${theme}.rasi -show-icons

# echo -en "aap\0icon\x1f/home/crtvhlx/wallpapers/astolfo.jpg"       ## To show icons of apps
