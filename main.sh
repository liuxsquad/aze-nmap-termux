#!/bin/bash

# Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
RESET='\033[0m'

function menu() {
    clear
    # Banner - sənin göndərdiyin
    echo -e "${GREEN}"
    echo ".___    .__                                                    .___        ____ "
    echo "|    |   |__| ____  __ _____  ___  ______________ _______     __| _/ ___  _/_   |"
    echo "|    |   |  |/    \|  |  \  \/  / /  ___/ ____/  |  \__  \   / __ |  \  \/ /|   |"
    echo "|    |___|  |   |  \  |  />    <  \___ < <_|  |  |  // __ \_/ /_/ |   \   / |   |"
    echo "|_______ \__|___|  /____//__/\_ \/____  >__   |____/(____  /\____ |    \_/  |___|"
    echo "        \/       \/            \/     \/   |__|          \/      \/               "
    echo -e "${RESET}"

    echo -e "${CYAN}=============== AZE V3 MENU ===============${RESET}"
    echo -e "${YELLOW}1) Basic Scan${RESET}"
    echo -e "${YELLOW}2) Service Scan (-sV)${RESET}"
    echo -e "${YELLOW}3) Aggressive Scan (-A)${RESET}"
    echo -e "${YELLOW}4) Ping Test${RESET}"
    echo -e "${YELLOW}5) Stealth Scan (-sS)${RESET}"
    echo -e "${YELLOW}6) Port Range Scan${RESET}"
    echo -e "${YELLOW}7) OS Detection (-O)${RESET}"
    echo -e "${YELLOW}8) !HELP (All Commands Guide)${RESET}"
    echo ""
    echo -e "${BLUE}Komutlar:${RESET}"
    echo -e "${GREEN}!MENU  -> Menuya qayıt${RESET}"
    echo -e "${GREEN}!EXIT  -> Çıxış${RESET}"
    echo ""
}

# Əsas menu göstər
menu

while true; do
    read -p "linuxsquad V1 > " choice

    case $choice in
        1)
            read -p "Enter IP: " ip
            nmap $ip
            ;;
        2)
            read -p "Enter IP: " ip
            nmap -sV $ip
            ;;
        3)
            read -p "Enter IP: " ip
            nmap -A $ip
            ;;
        4)
            read -p "Enter site/IP: " target
            ping $target
            ;;
        5)
            read -p "Enter IP: " ip
            nmap -sS $ip
            ;;
        6)
            read -p "Enter IP: " ip
            read -p "Enter Port Range (example 1-1000): " range
            nmap -p $range $ip
            ;;
        7)
            read -p "Enter IP: " ip
            nmap -O $ip
            ;;
        8)
            clear
            echo -e "${CYAN}========== NMAP HELP GUIDE ==========${RESET}"
            echo ""
            echo "1) nmap <ip>"
            echo "2) nmap -sV <ip>"
            echo "3) nmap -A <ip>"
            echo "4) nmap -sS <ip>"
            echo "5) nmap -O <ip>"
            echo "6) nmap -p 1-1000 <ip>"
            echo "7) nmap -F <ip>"
            echo "8) nmap -Pn <ip>"
            echo "9) nmap -sU <ip>"
            echo "10) nmap --script vuln <ip>"
            echo ""
            echo "Menuya qayıtmaq üçün: !MENU"
            read -p "Press Enter to continue..."
            ;;
        "!MENU")
            menu
            ;;
        "!EXIT")
            exit
            ;;
        *)
            echo -e "${RED}Invalid option! !MENU yazaraq geri qayıda bilərsən.${RESET}"
            ;;
    esac
done
