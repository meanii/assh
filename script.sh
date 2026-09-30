#!/usr/bin/env bash

# This script is used to connect to a remote server via SSH and start a screen session.
# it will also reconnect if the connection is lost.

# Usage: assh <ssh-connection-string>
# Example: assh root@meanii.dev
# Requirements: autossh (local), screen (remote)


function assh() {
  if [ -z "$1" ]; then
    echo "Error: Please provide a hostname." >&2
    echo "Usage: assh <ssh-connection-string>" >&2
    return 1
  fi

  # the session name is generated once, so every reconnect re-attaches to the same screen session
  local session_name="autosession-$RANDOM$RANDOM$RANDOM$RANDOM"

  # runs on the remote host: write a minimal screen config and attach (or create) the session
  local remote_command="bash -c 'tmpScreenConfig=\$(mktemp); printf \"%s\\n\" \"termcapinfo xterm* ti@:te@\" \"altscreen on\" \"maptimeout 0\" \"startup_message off\" \"msgwait 0\" > \"\$tmpScreenConfig\"; exec screen -c \"\$tmpScreenConfig\" -S \"$session_name\" -RD'"

  echo "Alright, hang tight! Connecting to $* :> 🇩🇪"
  AUTOSSH_GATETIME=5 autossh -M 0 -- -o "ServerAliveInterval 5" -o "ServerAliveCountMax 1" -t "$@" "$remote_command"
}

assh "$@"
