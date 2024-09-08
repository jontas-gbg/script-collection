#!/usr/bin/env python3

import os


my_input = "Ange ditt val: "
my_line = "===================================="
my_choise = "    systemd - timers och services?"

# Funktion för att visa menyn
def show_menu():
    os.system("clear")
    print(my_line)
    print("\033[1m" + my_choise + "\033[m")
    print(my_line)
    options = ["Reload deamons",
               "Reload deamons (user)",
               "Visa alla timers",
               "Visa alla timers (user)",
               "Visa aktiva timers",
               "Visa aktiva timers (user)",
               "Visa alla services",
               "Visa aktiva services",
               "Visa alla unit files",
               "Visa alla unit files (user)",
               "Avsluta"]

    while True:
        for i, opt in enumerate(options, start=1):
            print(f"{i}. {opt}")

        choice = input("\033[1m\033[33m" + my_input + "\033[m")

        if choice.isdigit() and 1 <= int(choice) <= 7:
            choice = int(choice)
            if choice == 1:
                os.system("sudo systemctl daemon-reload")
            elif choice == 2:
                os.system("systemctl --user daemon-reload")
            elif choice == 3:
                os.system("systemctl list-timers --all")
            elif choice == 4:
                os.system("systemctl --user list-timers --all")
            elif choice == 5:
                os.system("systemctl list-timers")
            elif choice == 6:
                os.system("systemctl --user list-timers")
            elif choice == 7:
                os.system("systemctl list-units --type=service")
            elif choice == 8:
                os.system("systemctl list-units --type=service --state=running")
            elif choice == 9:
                os.system("systemctl list-units-files")
            elif choice == 10:
                os.system("systemctl --user list-units-files")
            elif choice == 11:
                exit(1)
        else:
            print("Ogiltigt val. Ange en siffra mellan 1 och 11.")

# Visa menyn
show_menu()

