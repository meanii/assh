#!/bin/bash 
# This script is used to connect to a remote server via SSH and start a screen session.
# it will also reconnect if the connection is lost.

# Usage: assh <hostname>
# Example: assh root@meanii.dev
# Requirements: autossh, screen


function assh() {
  if [ -z "$1" ]; then
    echo "Error: Please provide a hostname."
    return 1
  fi

  echo "Alright, hang tight! Connecting to $1 :> 🇩🇪"
    AUTOSSH_GATETIME=5 autossh -M 0 -- -o "ServerAliveInterval 5" -o "ServerAliveCountMax 1" -t "$@" $'bash -c \'tmpScreenConfig=$(mktemp); echo "termcapinfo xterm* ti@:te" >> $tmpScreenConfig; echo "altscreen on" >> $tmpScreenConfig; echo "maptimeout 0" >> $tmpScreenConfig; echo "startup_message off" >> $tmpScreenConfig; echo "msgwait 0" >> $tmpScreenConfig; exec screen -c $tmpScreenConfig -S "autosession-'$RANDOM$RANDOM$RANDOM$RANDOM$'" -RD\''
}