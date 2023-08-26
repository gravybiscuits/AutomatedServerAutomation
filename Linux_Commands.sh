#!/bin/bash

# Ensure the script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root."
    exit 1
fi

# Ensure the script exits on any command failure
set -e

commands=(
    "ls: Lists the files in the current directory."
    "pwd: Prints the path of the current directory."
    "df: Shows disk usage of file systems."
    "top: Displays a dynamic real-time view of the running system."
    "ps: Reports a snapshot of the current processes."
    "netstat: Shows network connections, routing tables, interface statistics, etc."
    "free: Displays the amount of free and used memory in the system."
    "who: Shows who is logged on the system."
    "uptime: Tells how long the system has been running."
    "du: Estimates file and directory space usage."
    "ipconfig: Displays network interface configurations."
    "lsof: Lists open files and the processes that opened them."
    "uname: Shows system information."
    "dmesg: Prints the message buffer of the kernel."
    "vmstat: Reports virtual memory statistics."
    "mkdir: Create a new directory."
    "touch: Create a new file."
    "chmod: Change file permissions."
    "exit: Exit this script."
)

while true; do
    echo "Choose a command to learn about and execute:"
    for i in "${!commands[@]}"; do
        echo "$((i+1))). ${commands[$i]}"
    done

    read -p "Enter your choice (number): " choice
    case $choice in
        1) echo "${commands[0]}"; ls;;
        2) echo "${commands[1]}"; pwd;;
        3) echo "${commands[2]}"; df;;
        4) echo "${commands[3]}"; top;;
        5) echo "${commands[4]}"; ps;;
        6) echo "${commands[5]}"; netstat;;
        7) echo "${commands[6]}"; free;;
        8) echo "${commands[7]}"; who;;
        9) echo "${commands[8]}"; uptime;;
        10) echo "${commands[9]}"; du;;
        11) echo "${commands[10]}"; ipconfig;;
        12) echo "${commands[11]}"; lsof;;
        13) echo "${commands[12]}"; uname -a;;
        14) echo "${commands[13]}"; dmesg;;
        15) echo "${commands[14]}"; vmstat;;
        16) 
            echo "${commands[15]}"
            read -p "Enter directory name to create: " dir_name
            mkdir $dir_name
            echo "Directory '$dir_name' created!"
            ;;
        17) 
            echo "${commands[16]}"
            read -p "Enter file name (e.g., myfile.txt or script.sh): " file_name
            touch $file_name
            echo "File '$file_name' created!"
            ;;
        18) 
            echo "${commands[17]}"
            read -p "Enter the file/directory you want to modify permissions for: " file_dir
            read -p "Enter the desired permissions in numeric format (e.g., 755): " perm
            chmod $perm $file_dir
            echo "Permissions for '$file_dir' changed to $perm!"
            ;;
        19) echo "Exiting..."; exit 0;;
        *) echo "Invalid choice!";;
    esac
done
