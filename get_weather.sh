#!/bin/bash

VADER=$(curl -s "https://wttr.in/Landvetter?M&T&F&lang=sv")
DATUM=$(date +%T)

echo "<html><head><title>Väder</title></head><body><pre>Senast uppdaterad klockan $DATUM: $VADER</pre></body></html>" > ~/.cache/vader.html
echo "${VADER}" > ~/.cache/v.txt