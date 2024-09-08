#!/bin/bash

# Convert Epoch timestamps to human readable.
# jontas@gmx.com in 2017

input_file="$HOME/.xsession-errors"
output_file="$HOME/.local/share/mylogs/xsession-errors.log"

# Loopa igenom varje rad i .xsession-errors
while read -r line; do
    # Hitta Unix-tidsstämplar i raden (om de finns)
    timestamps=$(echo "$line" | grep -oE '[0-9]{10}')

    # Konvertera varje Unix-tidsstämpel till läsbar form
    for timestamp in $timestamps; do
        readable_date=$(date -d "@$timestamp" "+%Y-%m-%d %H:%M:%S")
        line=$(echo "$line" | sed "s/$timestamp/$readable_date/")
    done

    # Skriv den uppdaterade raden till den nya filen
    echo "$line" >> "$output_file"
done < "$input_file"

echo "Konverterade felmeddelanden sparade i $output_file"
