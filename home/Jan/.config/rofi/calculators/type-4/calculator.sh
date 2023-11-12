dir="$HOME/.config/rofi/calculators/type-4"
theme='style-4'

## Run
rofi -show calc\
     -modi calc\
     -no-sort\
     -calc-command\
     -theme ${dir}/${theme}.rasi\
     "echo -n '{result}' | xclip"

