#!/usr/bin/env python3

import os


my_input = "Ange ditt val: "
my_line = "===================================="
my_choise = "   pacman - vad vill du utföra?"

# Funktion för att visa menyn
def show_menu():
    os.system("clear")
    print(my_line)
    print("\033[1m" + my_choise + "\033[m")
    print(my_line)
    options = ["Uppdatera allt", 
               "Uppdatera mirrorlist",
               "Sök nytt",
               "Visa installerat",
               "Skriv installerat till textfil",
               "Visa explicit installerade pkg",
               "Visa systemets installerade pkg",
               "Visa alla inst. i storleksord.",
               "Bläddra installerat med beskr.",
               "Ta bort orphans",
               "Meny",
               "Avsluta"]

    while True:
        for i, opt in enumerate(options, start=1):
            print(f"{i}. {opt}")

        choice = input("\033[1m\033[33m" + my_input + "\033[m")

        if choice.isdigit() and 1 <= int(choice) <= 12:
            choice = int(choice)
            if choice == 1:
                os.system("sudo pacman -Syu --noconfirm")
            elif choice == 2:
                os.system("sudo reflector --verbose -c SE --age 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist")
            elif choice == 3:
                os.system("pacman -Ss")
            elif choice == 4:
                os.system("pacman -Qe | less")
            elif choice == 5:
                os.system("pacman -Qqe > pkglist.txt")
            elif choice == 6:
                os.system("pacman -Qm | less")
            elif choice == 7:
                os.system("pacman -Qn | less")
            elif choice == 8:
                os.system("pacman -Qi | awk '/^Name/{name=$3} /^Installed Size/{print $4$5, name}' | LC_ALL=C.UTF-8 sort -h -r | less")
            elif choice == 9:
                os.system("pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'")
            elif choice == 10:
                os.system("sudo pacman -Qqtd")
            elif choice == 11:
                show_menu()
            elif choice == 12:
                exit(1)
        else:
            print("Ogiltigt val. Ange en siffra mellan 1 och 12.")

# Visa menyn
show_menu()
