#!/bin/bash
BATT=$(ls /sys/class/power_supply/ | grep -m1 BAT)
THRESHOLD=15
NOTIFIED=0

while true; do
    CAP=$(cat /sys/class/power_supply/"$BATT"/capacity)
    STATUS=$(cat /sys/class/power_supply/"$BATT"/status)

    if [ "$STATUS" = "Discharging" ] && [ "$CAP" -le "$THRESHOLD" ]; then
        if [ "$NOTIFIED" -eq 0 ]; then
            notify-send -u critical "Baterai Lemah" "Sisa ${CAP}%, segera colok charger!"
            NOTIFIED=1
        fi
    else
        NOTIFIED=0
    fi
    sleep 60
done
