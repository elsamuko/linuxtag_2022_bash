#!/usr/bin/env bash

# pipes
# shellcheck disable=SC2009
ps aux | grep 'bash ./'
lsb_release -r | awk '{print $2}'
true | false
echo "PIPESTATUS : ${PIPESTATUS[0]} ${PIPESTATUS[1]}"
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
mv request.txt bad_foldeR_name/request.txt > out.log 2>&1
echo "out.log:"
cat out.log | sed 's/^/    /'
echo

# trap
function on_exit {
    echo
    echo -e "\033[1;31mI'm called when exiting, so I can clean up\033[0m"
}

# should be at the beginning of the script
trap on_exit EXIT
echo "Still doing sth here"
echo

# variables
# http://www.gnu.org/software/bash/manual/bash.html#Bash-Variables
echo $RANDOM
echo ${BASH_SOURCE[0]}
echo
