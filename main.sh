#!/bin/bash

# Rənglər
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
RESET='\033[0m'

clear
echo -e "${GREEN}.__  .__                                                    .___        ____ "
echo -e "${GREEN}|  | |__| ____  __ _____  ___  ______________ _______     __| _/ ___  _/_   |"
echo -e "${GREEN}|  | |  |/    \|  |  \  \/  / /  ___/ ____/  |  \__  \   / __ |  \  \/ /|   |"
echo -e "${GREEN}|  |_|  |   |  \  |  />    <  \___ < <_|  |  |  // __ \_/ /_/ |   \   / |   |"
echo -e "${GREEN}|____/__|___|  /____//__/\_ \/____  >__   |____/(____  /\____ |    \_/  |___|"
echo -e "${GREEN}             \/            \/     \/   |__|          \/      \/               ${RESET}"

echo ""
echo -e "${CYAN}========= AZE V1 =========${RESET}"
echo -e "${YELLOW}1) Scan IP${RESET}"
echo -e "${YELLOW}2) Service Scan${RESET}"
echo -e "${YELLOW}3) Aggressive Scan${RESET}"
echo -e "${YELLOW}4) Ping Test${RESET}"
echo -e "${RED}5) Exit${RESET}"
echo ""

read -p "$(echo -e ${BLUE}Select option: ${RESET})" choice

if [ "$choice" = "1" ]; then
    read -p "$(echo -e ${CYAN}Enter IP: ${RESET})" ip
    nmap $ip
elif [ "$choice" = "2" ]; then
    read -p "$(echo -e ${CYAN}Enter IP: ${RESET})" ip
    nmap -sV $ip
elif [ "$choice" = "3" ]; then
    read -p "$(echo -e ${CYAN}Enter IP: ${RESET})" ip
    nmap -A $ip
elif [ "$choice" = "4" ]; then
    read -p "$(echo -e ${CYAN}Enter site/IP: ${RESET})" target
    ping $target
elif [ "$choice" = "5" ]; then
    exit
else
    echo -e "${RED}Invalid option!${RESET}"
fi
