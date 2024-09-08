#!/usr/bin/env python3

import os


my_input = "Ange ditt val: "
my_line = "=========================================="
my_choise = "   journalctl - vad vill du granska?"

# Funktion för att visa menyn
def show_menu():
    os.system("clear")
    print(my_line)
    print("\033[1m" + my_choise + "\033[m")
    print(my_line)
    options = ["Alla entries",
               "Live log",
               "Dagens händelser",
               "Kernel errors sen uppstart",
               "Service för väder",
               "Service för clean",
               "Service för backup",
               "Service för speedtest",
               "Reload alla user Daemons",
               "Reload alla Daemons",
               "Avsluta"]
 
    while True:
        for i, opt in enumerate(options, start=1):
            print(f"{i}. {opt}")

        choice = input("\033[1m\033[33m" + my_input + "\033[m")

        if choice.isdigit() and 1 <= int(choice) <= 13:
            choice = int(choice)
            if choice == 1:
                os.system("journalctl -r | less")
            elif choice == 2:
                os.system("clear && journalctl -f")
            elif choice == 3:
                os.system("journalctl --since today -r -p 0..3")
            elif choice == 4:
                os.system("echo -e '\n' && journalctl -k -b -p err && echo -e '\n'")
            elif choice == 5:
                os.system("echo -e '\n --- VISAR 15 SENASTE HÄMTNINGAR VÄDER ---\n' && journalctl --user -u weather.service -r -n 15")
            elif choice == 6:
                os.system("echo -e '\n --- VISAR 15 SENASTE CLEAN UP AV BACKUPER  ---\n' && journalctl --user -u clean.service -r -n 15")
            elif choice == 7:
                os.system("echo -e '\n --- VISAR 15 SENASTE BACKUPERNA ---\n' && journalctl --user -u backup.service -r -n 15")
            elif choice == 8:
                os.system("echo -e '\n --- SPEEDTEST++ KÖRS VARJE HALVTIMME ---\n' && journalctl --user -u speedtest.service -r")
            elif choice == 9:
                os.system("systemctl --user daemon-reload")
            elif choice == 10:
                os.system("sudo systemctl daemon-reload")
            elif choice == 11:
                exit(1)
        else:
            print("Ogiltigt val. Ange en siffra mellan 1 och 11.")

# Visa menyn
show_menu()
