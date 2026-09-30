#!/usr/bin/env bash

ASSH_SCRIPT_URL="https://raw.githubusercontent.com/meanii/assh/main/script.sh"
ASSH_INSTALL_PATH="/usr/local/bin/assh"

# check if script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "please run as root or with sudo privileges to install assh" >&2
  exit 1
fi

# function to check if a command is available
function check_command() {
  if ! command -v "$1" &> /dev/null; then
    echo "$1 could not be found, please install it first" >&2
    exit 1
  fi
}

# checking all local commands are available
# (screen is only needed on the remote server, not on this machine)
check_command "autossh"
check_command "ssh"
check_command "curl"

# download script to a temporary file first, so a failed download never leaves a broken assh behind
tmp_file="$(mktemp)"
trap 'rm -f "$tmp_file"' EXIT

if ! curl -fsSL "$ASSH_SCRIPT_URL" -o "$tmp_file"; then
  echo "failed to download assh from $ASSH_SCRIPT_URL" >&2
  exit 1
fi

# install script and make it executable
install -m 755 "$tmp_file" "$ASSH_INSTALL_PATH"

# print success message
echo "assh was successfully installed to $ASSH_INSTALL_PATH!"

# print usage
echo "Usage: assh <ssh-connection-string>"
