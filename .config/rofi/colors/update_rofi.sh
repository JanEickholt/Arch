#!/bin/bash

# File to write the output to
output_file="$HOME/.config/rofi/colors/dynamic.rasi"

# Ensure the directory exists
mkdir -p "$(dirname "$output_file")"

# Function to get color from xrdb and add FF for full opacity
get_color() {
    xrdb -query | grep "$1:" | awk '{print $2}' | sed 's/^#//' | tr -d '\n'
}

# Generate the dynamic.rasi file
cat > "$output_file" << EOF
* {
    background:     #$(get_color background)80;
    background-alt: #$(get_color color8)80;
    foreground:     #$(get_color foreground)FF;
    selected:       #$(get_color color10)80;
    active:         #$(get_color color2)80;
    urgent:         #$(get_color color1)FF;
}
EOF

echo "Dynamic config updated successfully at $output_file"

