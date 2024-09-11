#!/bin/bash

# A simple timer called from an alias named 'st' like "st 3m" 
# or "st 1h"
# jontas@gmx.com in 2022, updated in 2024 using Zenity for dialog box.

if [ $# -eq 0 ]; then
    zenity --error --text="Specify countdown time.\nSomething like:\n     st 3m\nto set a timer for 3 minutes"
    exit 1
fi

(sleep $1 && zenity --info --text="Time is up!") &
