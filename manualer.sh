#!/bin/bash

# Sökväg till manualerna
manual_path="$HOME/Documents/Scripts/my_alias/manualer/"

while true; do
    echo -e '\n-----------------------------------'
    echo -e '   SMÅ MANUALER FÖR STORA TING      '
    echo -e '-----------------------------------'
    # Visa meny och låt användaren välja ett alternativ
    PS3=$'\n\033[1m\033[33mVälj ett verktyg: \033[m'
    options=("htop" 
             "sysstat"
             "iftop" 
             "netstat" 
             "sar"
             "dmesg"
             "lsof" 
             "Återgå till menyn" 
             "Avsluta")
    select opt in "${options[@]}"; do
        case $opt in
            "htop"|"sysstat"|"iftop"|"netstat"|"sar"|"dmesg"|"lsof")
                selected_file="$manual_path/$opt.text"
                if [ -f "$selected_file" ]; then
                    cat "$selected_file" | less
                else
                    echo "Kunde inte hitta manualen för $opt."
                fi
                ;;
            "Återgå till menyn")
                break  # Avbryt select loop och återgå till while loop
                ;;
            "Avsluta")
                exit 0
                ;;
            *)
                echo "Ogiltigt val: $REPLY. Vänligen välj ett giltigt alternativ."
                ;;
        esac
    done

    # Om "Återgå till menyn" valdes
    if [ "$opt" = "Återgå till menyn" ]; then
        continue  # Återgå till while loop
    else
        break     # Annars avbryt while loop
    fi
done
