dir="$HOME/.config/rofi/clipboards/type-4"
theme='style-4'

## Run
rofi \
    -modi "clipboard:greenclip print" \
    -show clipboard \
    -run-command '{cmd}' \
    -theme ${dir}/${theme}.rasi
