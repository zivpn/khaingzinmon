#!/bin/bash

# ==========================================
# Colors & Styles
# ==========================================
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
MAGENTA='\033[1;35m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m'

# Branding Line
BRANDING="${CYAN}Os Reinstall Autoscript မောင်သုည${NC}"

# Function to draw a separator
draw_line() {
    echo -e "${BLUE}=====================================================${NC}"
}

# Step 1: Menu Uninstall
show_uninstall_menu() {
    clear
    echo -e "${CYAN}╔═══════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║${NC}${WHITE}             < = [ MENU UNINSTALL ] = >            ${NC}${CYAN}║${NC}"
    echo -e "${CYAN}╚═══════════════════════════════════════════════════╝${NC}"
    echo -e "  ${YELLOW}[01]${NC} Uninstall Script / Reinstall OS"
    echo -e "  ${YELLOW}[02]${NC} Back To Default Menu"
    draw_line
    echo -e "  ${RED}>> Press CTRL + C To Exit <<${NC}"
    draw_line
    echo -e "  ${BRANDING}"
    echo -e ""
    read -p "  Input Option: " main_opt

    case $main_opt in
        1|01) show_data_confirmation ;;
        2|02) echo "Returning to menu..."; exit 0 ;;
        *) show_uninstall_menu ;;
    esac
}

# Step 2: Data Confirmation
show_data_confirmation() {
    clear
    echo -e "${MAGENTA}╔═══════════════════════════════════════════════════╗${NC}"
    echo -e "${MAGENTA}║${NC}${WHITE}             [ NEW DATA YOUR VPS ]                 ${NC}${MAGENTA}║${NC}"
    echo -e "${MAGENTA}╚═══════════════════════════════════════════════════╝${NC}"
    echo -e "  ${CYAN}Username :${NC} ${GREEN}root${NC}"
    echo -e "  ${CYAN}Password :${NC} ${GREEN}123@@@${NC}"
    draw_line
    echo -e "  ${YELLOW}[00] Back to Previous Menu${NC}"
    draw_line
    echo -e "  ${RED}WARNING: ALL DATA WILL BE WIPED OUT!${NC}"
    echo -e "  ${YELLOW}Please save your important data before continuing.${NC}"
    draw_line
    echo -en "  ${WHITE}Continue (y/n/00): ${NC}"
    read confirm_y

    if [[ "$confirm_y" == "00" ]]; then
        show_uninstall_menu
    elif [[ "$confirm_y" == "y" || "$confirm_y" == "Y" ]]; then
        show_os_list
    else
        show_uninstall_menu
    fi
}

# Step 3: Select New OS
show_os_list() {
    clear
    echo -e "${YELLOW}╔═══════════════════════════════════════════════════╗${NC}"
    echo -e "${YELLOW}║${NC}${WHITE}             < = [ SELECT NEW OS ] = >             ${NC}${YELLOW}║${NC}"
    echo -e "${YELLOW}╚═══════════════════════════════════════════════════╝${NC}"
    echo -e "  ${CYAN}01.${NC} Rocky         ${CYAN}02.${NC} Alpine"
    echo -e "  ${CYAN}03.${NC} Anolis        ${CYAN}04.${NC} Debian"
    echo -e "  ${CYAN}05.${NC} Ubuntu        ${CYAN}06.${NC} RedHat"
    echo -e "  ${CYAN}07.${NC} CentOS        ${CYAN}08.${NC} AlmaLinux"
    echo -e "  ${CYAN}09.${NC} OpenEuler     ${CYAN}10.${NC} OpenSUSE"
    echo -e "  ${CYAN}11.${NC} Arch Linux    ${CYAN}12.${NC} NixOS Linux"
    echo -e "  ${CYAN}13.${NC} Oracle Linux  ${CYAN}14.${NC} Fedora Linux"
    echo -e "  ${CYAN}15.${NC} Gentoo Linux  ${CYAN}16.${NC} Open Cloud OS"
    echo -e "  ${CYAN}17.${NC} Kali Linux"
    draw_line
    echo -e "  ${YELLOW}[00] Back to Previous Menu${NC}"
    draw_line
    echo -e "  ${RED}Press CTRL + C to Exit${NC}"
    draw_line
    echo -e "  ${BRANDING}"
    echo -e ""
    read -p "  Input Options: " os_choice

    case $os_choice in
        00) show_data_confirmation ;;
        5|05) select_ubuntu_ver ;;
        4|04) select_debian_ver ;;
        *) echo -e "${RED}Invalid choice or OS not yet supported.${NC}"; sleep 2; show_os_list ;;
    esac
}

# Ubuntu Version Sub-menu
select_ubuntu_ver() {
    clear
    echo -e "${GREEN}╔═══════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║${NC}${WHITE}               <= UBUNTU LINUX =>                  ${NC}${GREEN}║${NC}"
    echo -e "${GREEN}╚═══════════════════════════════════════════════════╝${NC}"
    echo -e "  ${CYAN}1.${NC} Ubuntu 16.04"
    echo -e "  ${CYAN}2.${NC} Ubuntu 18.04"
    echo -e "  ${CYAN}3.${NC} Ubuntu 20.04"
    echo -e "  ${CYAN}4.${NC} Ubuntu 22.04"
    echo -e "  ${CYAN}5.${NC} Ubuntu 24.04"
    draw_line
    echo -e "  ${YELLOW}[0] Back to OS Selection${NC}"
    draw_line
    read -p "  Input Option: " ver_opt
    
    case $ver_opt in
        0) show_os_list ;;
        1) OS="ubuntu"; VER="16.04" ;;
        2) OS="ubuntu"; VER="18.04" ;;
        3) OS="ubuntu"; VER="20.04" ;;
        4) OS="ubuntu"; VER="22.04" ;;
        5) OS="ubuntu"; VER="24.04" ;;
        *) select_ubuntu_ver ;;
    esac
    start_reinstall "$OS" "$VER"
}

# Debian Version Sub-menu
select_debian_ver() {
    clear
    echo -e "${GREEN}╔═══════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║${NC}${WHITE}               <= DEBIAN LINUX =>                  ${NC}${GREEN}║${NC}"
    echo -e "${GREEN}╚═══════════════════════════════════════════════════╝${NC}"
    echo -e "  ${CYAN}1.${NC} Debian 10"
    echo -e "  ${CYAN}2.${NC} Debian 11"
    echo -e "  ${CYAN}3.${NC} Debian 12"
    draw_line
    echo -e "  ${YELLOW}[0] Back to OS Selection${NC}"
    draw_line
    read -p "  Input Option: " ver_opt
    
    case $ver_opt in
        0) show_os_list ;;
        1) OS="debian"; VER="10" ;;
        2) OS="debian"; VER="11" ;;
        3) OS="debian"; VER="12" ;;
        *) select_debian_ver ;;
    esac
    start_reinstall "$OS" "$VER"
}

# Final Execution
start_reinstall() {
    local S_OS=$1
    local S_VER=$2
    
    echo -e "\n${YELLOW}Preparing system dependencies...${NC}"
    apt update -y &> /dev/null
    apt install wget curl gawk tar -y &> /dev/null
    
    # Download Engine
    wget -qO execution.sh https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh
    
    clear
    echo -e "${BLUE}*****************************************************${NC}"
    echo -e "${WHITE}             ***** PROMPT PASSWORD ***** ${NC}"
    echo -e "${BLUE}*****************************************************${NC}"
    echo -e "${WHITE}  >> SET NEW ROOT PASSWORD BELOW <<${NC}"
    echo -e "${YELLOW}  >> (Default: Random password if empty)${NC}"
    echo -e "${BLUE}*****************************************************${NC}"
    echo -e ""
    
    # Run Engine
    bash execution.sh $S_OS $S_VER
    
    # Force INSTANT reboot
    echo -e "\n${GREEN}OS REINSTALL INITIALIZED!${NC}"
    echo -e "${RED}INSTANT REBOOTING IN 30 SECOND...${NC}"
    echo -e "${BRANDING}"
    sleep 1

    # Magic SysRq
    echo 1 > /proc/sys/kernel/sysrq      # enable
    echo b > /proc/sysrq-trigger         # interface
}

# Start Script
show_uninstall_menu
