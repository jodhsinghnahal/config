polybar-msg cmd quit
# killall -q polybar
if type "xrandr"; then
for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --config=~/.config/polybar/config.ini --reload toph &
  done
else
  polybar --reload --config=~/.config/polybar/config.ini toph &
fi
