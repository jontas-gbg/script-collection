#!/bin/bash

# systemd timer/service
# Runs every 2 hours to track download speed
# jontas@gmx.com in 2023

/usr/bin/speedtest++ --download > /home/jontas/.cache/spd.txt
exit 0