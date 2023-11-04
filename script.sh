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
  autossh -M 0 -o "ServerAliveInterval 30" -o "ServerAliveCountMax 3" -o "ExitOnForwardFailure yes" -o "StrictHostKeyChecking no" -t "$1" 'screen -R'
}