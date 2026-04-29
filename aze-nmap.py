import subprocess
import os
import sys

# Colors for Windows (ANSI support)
if os.name == 'nt':
    os.system('color')  # Enable ANSI colors in newer Windows

RED = '\033[1;31m'
GREEN = '\033[1;32m'
YELLOW = '\033[1;33m'
BLUE = '\033[1;34m'
CYAN = '\033[1;36m'
RESET = '\033[0m'

def clear():
    os.system('cls' if os.name == 'nt' else 'clear')

def banner():
    clear()
    print(GREEN + """
.___    .__                                                    .___        ____ 
|    |   |__| ____  __ _____  ___  ______________ _______     __| _/ ___  _/_   |
|    |   |  |/    \|  |  \  \/  / /  ___/ ____/  |  \__  \   / __ |  \  \/ /|   |
|    |___|  |   |  \  |  />    <  \___ < <_|  |  |  // __ \_/ /_/ |   \   / |   |
|_______ \__|___|  /____//__/\_ \/____  >__   |____/(____  /\____ |    \_/  |___|
        \/       \/            \/     \/   |__|          \/      \/               
    """ + RESET)
    print(CYAN + "=============== AZE V3 MENU ===============" + RESET)
    print(YELLOW + "1) Basic Scan" + RESET)
    print(YELLOW + "2) Service Scan (-sV)" + RESET)
    print(YELLOW + "3) Aggressive Scan (-A)" + RESET)
    print(YELLOW + "4) Ping Test" + RESET)
    print(YELLOW + "5) Stealth Scan (-sS)" + RESET)
    print(YELLOW + "6) Port Range Scan" + RESET)
    print(YELLOW + "7) OS Detection (-O)" + RESET)
    print(YELLOW + "8) !HELP (All Commands Guide)" + RESET)
    print("")
    print(BLUE + "Komutlar:" + RESET)
    print(GREEN + "!MENU  -> Menuya qayıt" + RESET)
    print(GREEN + "!EXIT  -> Çıxış" + RESET)
    print("")

def run_command(cmd):
    try:
        result = subprocess.run(cmd, shell=True, capture_output=False, text=True)
        # Nmap artıq rəngli çıxış verir, əlavə emal etmirik
    except Exception as e:
        print(RED + f"Səhv: {e}" + RESET)

def menu():
    banner()
    while True:
        choice = input(CYAN + "linuxsquad V1 > " + RESET).strip()

        if choice == "1":
            ip = input("Enter IP: ")
            run_command(f"nmap {ip}")
        elif choice == "2":
            ip = input("Enter IP: ")
            run_command(f"nmap -sV {ip}")
        elif choice == "3":
            ip = input("Enter IP: ")
            run_command(f"nmap -A {ip}")
        elif choice == "4":
            target = input("Enter site/IP: ")
            run_command(f"ping {target}")
        elif choice == "5":
            ip = input("Enter IP: ")
            run_command(f"nmap -sS {ip}")
        elif choice == "6":
            ip = input("Enter IP: ")
            port_range = input("Enter Port Range (example 1-1000): ")
            run_command(f"nmap -p {port_range} {ip}")
        elif choice == "7":
            ip = input("Enter IP: ")
            run_command(f"nmap -O {ip}")
        elif choice == "8":
            clear()
            print(CYAN + "========== NMAP HELP GUIDE ==========" + RESET)
            print("""
1) nmap <ip>
2) nmap -sV <ip>
3) nmap -A <ip>
4) nmap -sS <ip>
5) nmap -O <ip>
6) nmap -p 1-1000 <ip>
7) nmap -F <ip>
8) nmap -Pn <ip>
9) nmap -sU <ip>
10) nmap --script vuln <ip>
            """)
            print(GREEN + "Menuya qayıtmaq üçün: !MENU" + RESET)
            input("Press Enter to continue...")
            banner()
        elif choice.upper() == "!MENU":
            banner()
        elif choice.upper() == "!EXIT":
            print(GREEN + "Çıxılır... Sağ ol!" + RESET)
            sys.exit(0)
        else:
            print(RED + "Invalid option! !MENU yazaraq geri qayıda bilərsən." + RESET)

if __name__ == "__main__":
    try:
        menu()
    except KeyboardInterrupt:
        print("\n" + GREEN + "Çıxılır..." + RESET)
