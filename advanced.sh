#!/usr/bin/env bash

# pipes
ps aux | grep 'bash ./'
lsb_release -r | awk '{print $2}'

# subshells
MY_IP=$(hostname -I | awk '{print $1}')
echo "MY_IP : $MY_IP"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# sourcing
source "$SCRIPT_DIR/functions.sh"
