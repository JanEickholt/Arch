#
# ~/.zprofile
#

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  startx
fi
