#!/bin/zsh

if [ "$DESKTOP_SESSION" = "xfce" ]; then 
    echo "Restarting systemd-resolved: $(date +'%Y-%m-%d %H:%M:%S')" >> /home/jontas/.logs/nordvpn_start.log
    sudo systemctl restart systemd-resolved.service >> /home/jontas/.logs/nordvpn_start.log 2>&1
    sleep 5
    nordvpn c se >> /home/jontas/.logs/nordvpn_start.log 2>&1
    echo "-----------------------------------" >> /home/jontas/.logs/nordvpn_start.log
    exit 0
fi
