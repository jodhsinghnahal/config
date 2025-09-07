#!/usr/bin/env zsh
export DISPLAY=:0
export XAUTHORITY="$HOME/.Xauthority"
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"

# notified=0
#
# while true; do
#     battery_level=$(cat /sys/class/power_supply/BAT0/capacity)
#
#     if [ "$battery_level" -le 10 ]; then
#         if [ "$notified" -eq 0 ]; then
#             notify-send "LOW BATTERY: $battery_level%"
#             notified=1
#         fi
#     else
#         notified=0
#     fi
#
#     sleep 5
# done

while true; do
    battery_level=$(cat /sys/class/power_supply/BAT0/capacity)

    if [ "$battery_level" -le 4 ]; then
        notify-send "LOW BATTERY: $battery_level%"
    fi

    sleep 15
done
