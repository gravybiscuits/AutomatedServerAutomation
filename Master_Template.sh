#!/bin/bash

# Ensure the script is being run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root."
    exit
fi

# Ensure the script exits on any command failure
set -e

echo "Server Configuration Control Center"
echo "==================================="

# Display options for the user
OPTIONS=(
"Setup non-root user"
"Update and upgrade server"
"Configure iptables"
"Set up swap space"
"Exit"
)

# Infinite loop to keep showing the menu until the user exits
while true; do
    PS3="Please select an option (1-${#OPTIONS[@]}): "
    select opt in "${OPTIONS[@]}"; do
        case $opt in
            "Setup non-root user")
                ./user_setup.sh
                break
                ;;
            "Update and upgrade server")
                ./server_update.sh
                break
                ;;
            "Configure iptables")
                ./iptables_config.sh
                break
                ;;
            "Set up swap space")
                ./swap_setup.sh
                break
                ;;
            "Exit")
                echo "Exiting..."
                exit 0
                ;;
            *) echo "Invalid option $REPLY";;
        esac
    done
done
