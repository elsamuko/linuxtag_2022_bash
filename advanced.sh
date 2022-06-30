#!/usr/bin/env bash

# pipes
# shellcheck disable=SC2009
ps aux | grep 'bash ./'
lsb_release -r | awk '{print $2}'
echo

# subshells
MY_IP=$(hostname -I | awk '{print $1}')
echo "MY_IP : $MY_IP"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo

# sourcing
# shellcheck source=functions.sh
source "$SCRIPT_DIR/functions.sh"
hello_from_functions ":)"
echo

# arrays
ANIMALS=("hase" "huhn" "kroko dil")
for ANIMAL in "${ANIMALS[@]}"; do
    echo "ANIMAL : $ANIMAL"
done
echo

# maps
declare -A COLORS
COLORS["GREEN"]="\033[1;32m"
COLORS["RED"]="\033[1;31m"
COLORS["CYAN"]="\033[1;34m"
COLORS["NEUTRAL"]="\033[0m"

for COLOR in "${!COLORS[@]}"; do
    echo -e "${COLORS[$COLOR]}$COLOR${COLORS['NEUTRAL']}"
done
echo

# output
curl -vs "https://icanhazip.com" 2> request.txt 1> IP.txt
cat IP.txt
cat request.txt | grep "< date:"


