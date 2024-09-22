#!/bin/sh

# Fetch all xrdb values once and store them
xrdb_output=$(xrdb -query)

# Function to fetch color from .Xresources using xrdb, with a fallback default value
xrdb_color() {
  color=$(echo "$xrdb_output" | grep -w "$1" | awk '{print $2}')
  if [ -z "$color" ]; then
    echo "$2" # Use fallback value if not found
  else
    echo "$color"
  fi
}

# Fetch colors from .Xresources with fallbacks
background=$(xrdb_color "*background" "#282a36")
foreground=$(xrdb_color "*foreground" "#f8f8f2")

# Fetch normal colors
color0=$(xrdb_color "*.color0" "#000000")
color1=$(xrdb_color "*.color1" "#ff5555")
color2=$(xrdb_color "*.color2" "#50fa7b")
color3=$(xrdb_color "*.color3" "#f1fa8c")
color4=$(xrdb_color "*.color4" "#bd93f9")
color5=$(xrdb_color "*.color5" "#ff79c6")
color6=$(xrdb_color "*.color6" "#8be9fd")
color7=$(xrdb_color "*.color7" "#bfbfbf")

# Fetch bright colors
color8=$(xrdb_color "*.color8" "#4d4d4d")
color9=$(xrdb_color "*.color9" "#ff6e67")
color10=$(xrdb_color "*.color10" "#5af78e")
color11=$(xrdb_color "*.color11" "#f4f99d")
color12=$(xrdb_color "*.color12" "#caa9fa")
color13=$(xrdb_color "*.color13" "#ff92d0")
color14=$(xrdb_color "*.color14" "#9aedfe")
color15=$(xrdb_color "*.color15" "#e6e6e6")

# Define the path to the Alacritty config
ALACRITTY_CONFIG="$HOME/.config/alacritty/alacritty.toml"

# Create the Alacritty config using the colors from .Xresources
cat >"$ALACRITTY_CONFIG" <<EOL
[colors.bright]
black = "$color8"
red = "$color9"
green = "$color10"
yellow = "$color11"
blue = "$color12"
magenta = "$color13"
cyan = "$color14"
white = "$color15"

[colors.normal]
black = "$color0"
red = "$color1"
green = "$color2"
yellow = "$color3"
blue = "$color4"
magenta = "$color5"
cyan = "$color6"
white = "$color7"

[colors.primary]
background = "$background"
foreground = "$foreground"

[font.bold_italic]
family = "JetBrains Mono Nerd Font"
style = "Bold Italic"

[font.italic]
family = "JetBrains Mono Nerd Font"
style = "Italic"

[font.normal]
family = "JetBrains Mono NF"
style = "Regular"

[window]
decorations = "none"
opacity = 0.85
EOL

echo "Alacritty config updated successfully at $ALACRITTY_CONFIG"
