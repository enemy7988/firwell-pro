#!/bin/bash
# ============================================================
#  ON MAHMOUD FIREWELL MANAGER - Safe Full Version
#  Author : MAHMOUD
#  Compatible with Ubuntu / Debian / Termius
# ============================================================

clear

# ===== Colors =====
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
MAGENTA="\e[35m"
CYAN="\e[36m"
RESET="\e[0m"

# ===== Header =====
echo -e "${CYAN}"
echo "========================================================"
echo "         ON MAHMOUD FIREWELL - SERVER MANAGER           "
echo "========================================================"
echo -e "${RESET}"
sleep 1

# ===== Generate Random Domain =====
generate_random_domain() {
    RANDOM_STRING=$(head /dev/urandom | tr -dc a-z0-9 | head -c 8)
    echo "${RANDOM_STRING}.example.com"
}

# ===== Main Menu =====
while true; do
    clear
    echo -e "${GREEN}========= ON MAHMOUD FIREWELL MANAGER =========${RESET}"
    echo "1) تثبيت الحزم الأساسية"
    echo "2) إنشاء دومين عشوائي"
    echo "3) فحص معلومات النظام"
    echo "4) فحص المنافذ المفتوحة"
    echo "5) إدارة الجدار الناري UFW"
    echo "0) خروج"
    echo "----------------------------------------------"
    read -p "اختر خيار: " choice

    case $choice in
    1)
        echo -e "${YELLOW}... يتم تثبيت الحزم الأساسية ...${RESET}"
        apt update && apt install -y curl wget ufw nano
        echo -e "${GREEN}✓ تم تثبيت الحزم بنجاح${RESET}"
        read -p "اضغط Enter للمتابعة..."
        ;;

    2)
        DOMAIN=$(generate_random_domain)
        echo -e "${GREEN}✓ الدومين العشوائي الخاص بك:${RESET} $DOMAIN"
        read -p "اضغط Enter للمتابعة..."
        ;;

    3)
        echo -e "${CYAN}... معلومات النظام ...${RESET}"
        echo "النظام: $(lsb_release -d 2>/dev/null | awk -F ':' '{print $2}')"
        echo "النواة: $(uname -r)"
        echo "المضيف: $(hostname -I | awk '{print $1}')"
        echo "الذاكرة:"
        free -h
        read -p "اضغط Enter للمتابعة..."
        ;;

    4)
        echo -e "${MAGENTA}... فحص المنافذ المفتوحة ...${RESET}"
        ss -tulnp
        read -p "اضغط Enter للمتابعة..."
        ;;

    5)
        while true; do
            clear
            echo -e "${BLUE}==== إدارة الجدار الناري UFW ==== ${RESET}"
            echo "1) تفعيل الجدار الناري"
            echo "2) تعطيل الجدار الناري"
            echo "3) السماح بمنفذ"
            echo "4) حظر منفذ"
            echo "0) رجوع"
            read -p "اختر: " ufw_choice

            case $ufw_choice in
                1) ufw enable ;;
                2) ufw disable ;;
                3) read -p "اكتب رقم المنفذ: " port; ufw allow $port ;;
                4) read -p "اكتب رقم المنفذ: " port; ufw deny $port ;;
                0) break ;;
            esac
        done
        ;;

    0)
        echo -e "${RED}تم الخروج.${RESET}"
        exit
        ;;

    *)
        echo -e "${RED}خيار غير صحيح!${RESET}"
        sleep 1
        ;;
    esac
done
