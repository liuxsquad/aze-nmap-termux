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
    echo -e "${GREEN}"
    echo "   ___   ___________    _    _______   __"
    echo "  / _ | /_  __/ __/ |  / |  / /  _/ | / /"
    echo " / __ |  / / / _/  | |/  |/ // //  |/ / "
    echo "/_/ |_| /_/ /___/   |___/|___/___/_/|_/  "
    echo -e "${RESET}"

    echo -e "${CYAN}=========== AZE V3 MENU ===========${RESET}"
    echo -e "${YELLOW}1) Basic Scan${RESET}"
    echo -e "${YELLOW}2) Service Scan (-sV)${RESET}"
    echo -e "${YELLOW}3) Aggressive Scan (-A)${RESET}"
    echo -e "${YELLOW}4) Ping Test${RESET}"
    echo -e "${YELLOW}5) Stealth Scan (-sS)${RESET}"
    echo -e "${YELLOW}6) Port Range Scan${RESET}"
    echo -e "${YELLOW}7) OS Detection (-O)${RESET}"
    echo ""
    echo -e "${BLUE}Komutlar:${RESET}"
    echo -e "${GREEN}!MENU  -> Menuya qayıt${RESET}"
    echo -e "${GREEN}!EXIT  -> Çıxış${RESET}"
    echo ""
}

menu

while true; do
    read -p "AZE-V3 > " choice

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
        "!MENU")
            menu
            ;;
        "!EXIT")
            exit
            ;;
        *)
            echo "Invalid option. !MENU yazaraq menuya qayida bilərsən."
            ;;
    esac
done
