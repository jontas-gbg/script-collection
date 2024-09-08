#!/bin/bash

if [ $# -eq 0 ]; then
    zenity --error --text="Specify countdown time.\nSomething like:\n     st 3m\nto set a timer for 3 minutes"
    exit 1
fi

(sleep $1 && zenity --info --text="Time is up!") &
