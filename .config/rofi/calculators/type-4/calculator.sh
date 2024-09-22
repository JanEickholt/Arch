#!/usr/bin/env bash

dir="$HOME/.config/rofi/calculators/type-4"
theme='style-4'

# Run rofi with updated calc-command to copy result to clipboard
rofi -show calc \
     -modi calc \
     -no-sort \
     -calc-command "echo -n '{result}' | xclip -selection clipboard" \
     -theme ${dir}/${theme}.rasi \
     -normal-window

