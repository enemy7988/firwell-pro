#!/bin/bash

# ============================================================
#  MAHMOUD FIR WELL  -  Base Manager Script (Safe Version)
#  Author : MAHMOUD
#  Compatible with: Ubuntu / Debian / Termius
# ============================================================

clear

# ====== Colors ======
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
MAGENTA="\e[35m"
CYAN="\e[36m"
RESET="\e[0m"

# ====== Header ======
echo -e "${CYAN}"
echo "============================================="
echo "      MAHMOUD FIR WELL - SERVER MANAGER      "
echo "============================================="
echo -e "${RESET}"

sleep 1

# ====== Random Domain Generator ======
generate_random_domain() {
    RANDOM_STRING=$(head /dev/urandom | tr -dc a-z0-9 | head -c 8)
    echo "${RANDOM_STRING}.example.com"
}

# ====== Main Menu ======
while true; do
    clear
    echo -e "${GREEN}MAHMOUD FIR WELL MANAGER${RESET}"
    echo "--------------------------------------"
    echo "1) إنشاء دومين عشوائي"
    echo "2) فحص النظام (آمن)"
    echo "3) معلومات السيرفر"
    echo "0) خروج"
    echo "--------------------------------------"
    read -p "اختر خيار: " choice

    case $choice in
        1)
            echo -e "${YELLOW}جاري إنشاء دومين عشوائي...${RESET}"
            RANDOM_DOMAIN=$(generate_random_domain)
            echo -e "${GREEN}✓ الدومين العشوائي:${RESET} $RANDOM_DOMAIN"
            read -p "اضغط Enter للعودة..."
        ;;
        2)
            echo -e "${CYAN}جاري فحص النظام...${RESET}"
            uname -a
            df -h
            free -m
            read -p "اضغط Enter للعودة..."
        ;;
        3)
            echo -e "${MAGENTA}معلومات السيرفر:${RESET}"
            echo "النظام: $(lsb_release -d 2>/dev/null | awk -F ':' '{print $2}')"
            echo "النواة: $(uname -r)"
            echo "الآيبى: $(hostname -I | awk '{print $1}')"
            read -p "اضغط Enter للعودة..."
        ;;
        0)
            echo -e "${RED}تم الخروج.${RESET}"
            exit 0
        ;;
        *)
            echo -e "${RED}خيار غير صحيح!${RESET}"
            sleep 1
        ;;
    esac
done
