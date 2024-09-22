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

# Function to convert hex to RGB
hex_to_rgb() {
  hex=$1
  # Ensure the hex color is valid (7 characters including '#')
  if [ "${#hex}" -eq 7 ]; then
    r=$(printf '%d' 0x${hex:1:2})
    g=$(printf '%d' 0x${hex:3:2})
    b=$(printf '%d' 0x${hex:5:2})
    echo "$r,$g,$b"
  else
    echo "0,0,0" # Default to black if the hex code is invalid
  fi
}

# Fetch colors from .Xresources with fallbacks
background=$(xrdb_color "*background") 
foreground=$(xrdb_color "*foreground")
color0=$(xrdb_color "*.color0")
color1=$(xrdb_color "*.color1")
color3=$(xrdb_color "*.color3")
color4=$(xrdb_color "*.color4")
color5=$(xrdb_color "*.color5")
color8=$(xrdb_color "*.color8")


# Define the path to the Zathura config
ZATHURA_CONFIG="$HOME/.config/zathura/zathurarc"

# Create the Zathura config using the colors from .Xresources
cat >"$ZATHURA_CONFIG" <<EOL
### Settings from original zathurarc ###
set synctex true
set synctex-editor-command "nvim --remote-silent +%{line} %{input}"
set highlight-transparency .1
set zoom-center "true"
set selection-clipboard clipboard
set render-loading "false"
set window-width 960
set window-height 700
map <Space> toggle_index
map K zoom in
map J zoom out
map p print
map k 5k
map j 5k
set render-loading true

### zathura-xresources ###
# Allow recolor
set recolor 'true'

# Don't allow original hue when recoloring
set recolor-keephue 'false'

# Don't keep original image colors while recoloring
set recolor-reverse-video 'false'

# Command line completion entries
set completion-fg '$foreground'
set completion-bg '$background'

# Command line completion group elements
set completion-group-fg '$color4'
set completion-group-bg '$background'

# Current command line completion element
set completion-highlight-fg '$background'
set completion-highlight-bg '$foreground'

# Default foreground/background color
set default-bg rgba($(hex_to_rgb $background),0.80)

# Input bar
set inputbar-fg '$foreground'
set inputbar-bg '$background'

# Notification
set notification-fg '$foreground'
set notification-bg '$background'

# Error notification
set notification-error-fg '$foreground'
set notification-error-bg '$color5'

# Warning notification
set notification-warning-fg '$foreground'
set notification-warning-bg '$color3'

# Status bar
set statusbar-fg '$foreground'
set statusbar-bg '$color0'

# Highlighting parts of the document (e.g., show search results)
set highlight-color rgba($(hex_to_rgb $color4),0.50)

# Represent light/dark colors in recoloring mode
set recolor-lightcolor rgba(255,255,255,0)
set recolor-darkcolor rgba($(hex_to_rgb $foreground),0.85)

# 'Loading...' text
set render-loading-fg '$foreground'
set render-loading-bg '$color0'

# Index mode
set index-fg '$foreground'
set index-bg '$color0'

# Selected element in index mode
set index-active-fg '$color0'
set index-active-bg '$foreground'
EOL

echo "Zathura config updated successfully at $ZATHURA_CONFIG"
