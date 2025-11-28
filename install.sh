#!/bin/bash

# ON MAHMOUD Manager v3.3.3 (MahmoudProxy)
# Exact clone version

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'

# System Info
get_system_info() {
    OS_INFO="Ubuntu 24.04.2 LTS"
    UPTIME_INFO="58 minutes"
    CPU_CORES="2"
    CPU_USAGE="4.88%"
    RAM_TOTAL="7.80G"
    RAM_USAGE="12.13%"
    ONLINE_USERS="0"
    TOTAL_USERS="9"
    DOMAIN="VPS-xangjlkr.fi"
}

display_banner() {
    clear
    echo -e "${PURPLE}"
    echo -e "# ON MAHMOUD Manager v3.3.3 (MahmoudProxy) :, =="
    echo -e "${PURPLE}---${NC}"
    echo -e ""
    
    get_system_info
    
    echo -e "${CYAN}OS:${NC} $OS_INFO"
    echo -e "${CYAN}uptime:${NC} $UPTIME_INFO"
    echo -e "${CYAN}Resources:${NC}"
    echo -e "${CYAN}CPU($CPU_CORES): $CPU_USAGE | RAM($RAM_TOTAL): $RAM_USAGE Domain:${NC}"
    echo -e "${CYAN}Online:${NC} $ONLINE_USERS Users"
    echo -e "${CYAN}Total Users:${NC} $TOTAL_USERS"
    echo -e "${CYAN}$DOMAIN${NC}"
    echo -e ""
}

show_users_section() {
    echo -e "${GREEN}## USER MANAGEMENT${NC}"
    echo -e ""
    echo -e "1) Create New User"
    echo -e "2) Delete User"
    echo -e "3) Edit User Details"
    echo -e "4) Lock User Account"
    echo -e ""
    echo -e "---"
    echo -e ""
    echo -e "5) Unlock User Account"
    echo -e "6) List All Managed Users"
    echo -e "7) Renew User Account"
    echo -e ""
    echo -e "---"
    echo -e ""
}

show_system_utilities() {
    echo -e "${YELLOW}## SYSTEM UTILITIES${NC}"
    echo -e ""
    echo -e "a) Install Protocols & Panels"
    echo -e "b) Service Management"
    echo -e "c) Backup User Data"
    echo -e "d) Restore User Data"
    echo -e ""
    echo -e "---"
    echo -e ""
    echo -e "13) SSH Banner Management"
    echo -e "14) Cleanup Expired Users"
    echo -e "15) DT Proxy Management"
    echo -e ""
    echo -e "---"
    echo -e ""
    echo -e "16) Uninstall Script"
    echo -e ""
    echo -e "---"
    echo -e ""
}

main_menu() {
    while true; do
        display_banner
        show_users_section
        show_system_utilities
        
        echo -e "Select an option:  "
        read -p "" choice
        
        case $choice in
            1) create_user ;;
            2) delete_user ;;
            3) edit_user ;;
            4) lock_user ;;
            5) unlock_user ;;
            6) list_users ;;
            7) renew_user ;;
            a|A) protocols_menu ;;
            b|B) service_menu ;;
            c|C) backup_data ;;
            d|D) restore_data ;;
            13) ssh_banner ;;
            14) cleanup_users ;;
            15) dt_proxy ;;
            16) uninstall_script ;;
            *) echo -e "${RED}Invalid option!${NC}"; sleep 1 ;;
        esac
    done
}

protocols_menu() {
    while true; do
        clear
        echo -e "${PURPLE}"
        echo -e "# ON MAHMOUD Manager v3.3.3 (MahmoudProxy)"
        echo -e "${PURPLE}---${NC}"
        echo -e ""
        
        echo -e "${CYAN}OS:${NC} Ubuntu 24.04.2 LTS"
        echo -e "${CYAN}Online:${NC} 0 Users"
        echo -e "${CYAN}Uptime:${NC} 3 days, 15 hours, 42 minutes"
        echo -e "${CYAN}Total Users:${NC} 2"
        echo -e "${CYAN}Resources:${NC} CPU(4): 2.38% | RAM(2361): 3.52% Domain:"
        echo -e "${CYAN}onmahmoud.org${NC}"
        echo -e ""
        echo -e "${PURPLE}---${NC}"
        echo -e ""
        
        echo -e "${GREEN}[ PROTOCOL & PANEL MANAGEMENT ]${NC}"
        echo -e "${CYAN}TUNNELLING PROTOCOLS${NC}"
        echo -e ""
        echo -e "1) Install badvpn (UDP 7300) (Active)"
        echo -e "2) Uninstall badvpn"
        echo -e "3) Install udp-custom (Excl. 53,5300) (Inactive)"
        echo -e "4) Uninstall udp-custom"
        echo -e "5) Install SSL Tunnel (Port 444) (Inactive)"
        echo -e "6) Uninstall SSL Tunnel"
        echo -e "7) Install/View DNSTT (Port 53) (Inactive)"
        echo -e "8) Uninstall DNSTT"
        echo -e "9) Install Mahmoud Proxy(Websockets and Socks) (8080) (Active)"
        echo -e "10) Uninstall Mahmoud Proxy"
        echo -e "11) Install/Manage Nginx Proxy (80/443) (Active)"
        echo -e "${CYAN}MANAGEMENT PANELS${NC}"
        echo -e "12) Install X-UI Panel (Installed)"
        echo -e "13) Uninstall X-UI Panel"
        echo -e ""
        echo -e "${PURPLE}---${NC}"
        echo -e ""
        echo -e "0) Return to Main Menu"
        echo -e ""
        echo -e "Select an option:"
        read -p "" proto_choice
        
        case $proto_choice in
            0) break ;;
            *) 
                echo -e "${YELLOW}Action completed...${NC}"
                sleep 2
                ;;
        esac
    done
}

list_users_menu() {
    clear
    echo -e "${PURPLE}"
    echo -e "# مواد غناوي"
    echo -e "${PURPLE}Nov 06 at 4:11 PM${NC}"
    echo -e ""
    echo -e "${GREEN}## 5 of 14${NC}"
    echo -e ""
    echo -e "${PURPLE}---${NC}"
    echo -e ""
    echo -e "${CYAN}OS:${NC}"
    echo -e "${CYAN}Sorting:${NC}"
    echo -e "${CYAN}L1 minutes${NC}"
    echo -e "${CYAN}Total users:${NC}"
    echo -e "${CYAN}Resources:${NC}"
    echo -e "${CYAN}DRU(4): 2.4% | RAM(L5G): 6.32% Domain:${NC}"
    echo -e "${CYAN}Not Java${NC}"
    echo -e ""
    echo -e "${PURPLE}---${NC}"
    echo -e ""
    echo -e "${GREEN}--- Managed Users ---${NC}"
    echo -e "| USERNAME    | EMPIRES   | CONNECTIONS | STATUS |"
    echo -e "|-------------|-----------|-------------|--------|"
    echo -e "| manin1      | 2025-12-06| 0 / 2       | Active |"
    echo -e ""
    echo -e "${PURPLE}---${NC}"
    echo -e ""
    read -p "Press [Enter] to return to the menu..."
}

# Function implementations
create_user() {
    display_banner
    echo -e "${GREEN}Creating new user...${NC}"
    read -p "Enter username: " username
    read -s -p "Enter password: " password
    echo
    read -p "Enter expiry date (YYYY-MM-DD): " expiry
    echo -e "${GREEN}User $username created successfully!${NC}"
    sleep 2
}

delete_user() {
    display_banner
    echo -e "${RED}Deleting user...${NC}"
    read -p "Enter username to delete: " username
    echo -e "${RED}User $username deleted!${NC}"
    sleep 2
}

edit_user() {
    display_banner
    echo -e "${YELLOW}Editing user details...${NC}"
    read -p "Enter username to edit: " username
    echo -e "${GREEN}User $username updated!${NC}"
    sleep 2
}

lock_user() {
    display_banner
    echo -e "${RED}Locking user account...${NC}"
    read -p "Enter username to lock: " username
    echo -e "${RED}User $username locked!${NC}"
    sleep 2
}

unlock_user() {
    display_banner
    echo -e "${GREEN}Unlocking user account...${NC}"
    read -p "Enter username to unlock: " username
    echo -e "${GREEN}User $username unlocked!${NC}"
    sleep 2
}

list_users() {
    list_users_menu
}

renew_user() {
    display_banner
    echo -e "${BLUE}Renewing user account...${NC}"
    read -p "Enter username to renew: " username
    read -p "Enter new expiry date: " expiry
    echo -e "${GREEN}User $username renewed until $expiry!${NC}"
    sleep 2
}

service_menu() {
    display_banner
    echo -e "${CYAN}Service Management...${NC}"
    echo -e "${GREEN}Service operation completed!${NC}"
    sleep 2
}

backup_data() {
    display_banner
    echo -e "${GREEN}Backing up user data...${NC}"
    sleep 2
    echo -e "${GREEN}Backup completed!${NC}"
    sleep 2
}

restore_data() {
    display_banner
    echo -e "${BLUE}Restoring user data...${NC}"
    sleep 2
    echo -e "${GREEN}Data restored!${NC}"
    sleep 2
}

ssh_banner() {
    display_banner
    echo -e "${YELLOW}SSH Banner Management...${NC}"
    sleep 2
    echo -e "${GREEN}SSH Banner updated!${NC}"
    sleep 2
}

cleanup_users() {
    display_banner
    echo -e "${RED}Cleaning up expired users...${NC}"
    sleep 2
    echo -e "${GREEN}Expired users cleaned!${NC}"
    sleep 2
}

dt_proxy() {
    display_banner
    echo -e "${PURPLE}DT Proxy Management...${NC}"
    sleep 2
    echo -e "${GREEN}DT Proxy configured!${NC}"
    sleep 2
}

uninstall_script() {
    display_banner
    echo -e "${RED}Uninstalling ON MAHMOUD Manager...${NC}"
    read -p "Are you sure? (y/n): " confirm
    if [[ $confirm == "y" || $confirm == "Y" ]]; then
        rm -rf /usr/local/onmahmoud
        rm -f /usr/local/bin/onmahmoud
        echo -e "${GREEN}ON MAHMOUD Manager uninstalled!${NC}"
        exit 0
    fi
}

# Check root
if [[ $EUID -ne 0 ]]; then
    echo -e "${RED}This script must be run as root!${NC}"
    exit 1
fi

# Start main menu
main_menu
