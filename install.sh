#!/usr/bin/env bash

ASSH_SCRIPT_URL="https://raw.githubusercontent.com/meanii/assh/main/script.sh"

# check if script is run as root
if [ "$EUID" -ne 0 ]
  then echo "please run as root or with sudo privileges to install assh"
  exit 1
fi

# function to check if a command is available
function check_command() {
    if ! command -v $1 &> /dev/null
    then
        echo "$1 could not be found"
        exit 1
    fi
}

# checking all commands are available
check_command "autossh"
check_command "screen"
check_command "ssh"
check_command "mktemp"
check_command "curl"

# download script
curl -s $ASSH_SCRIPT_URL > /usr/local/bin/assh

# make script executable
chmod +x /usr/local/bin/assh

# print usage
echo "Usage: assh <hostname>"