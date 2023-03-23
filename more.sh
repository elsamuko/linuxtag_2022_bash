#!/usr/bin/env bash

mkdir -p tmp

# getopts
while getopts "hn:" ARG; do
    case "$ARG" in
        h)
            echo "Showing --help"
            exit 0
            ;;
        n)
            NAME="${OPTARG}"
            ;;
        ?)
            exit 2
            ;;
    esac
done
echo "name argument: $NAME"
echo

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=logging.sh
source "$SCRIPT_DIR/logging.sh"

# logging
function a_func {
    log_info "Logging from a function"
}

log_info "Starting"
log_debug "Debug info"
log_warning "Just a warning"
log_error "Sth bad happend"
a_func
echo

# networking
log_info "Starting netcat"
nc -u -l 51514& # listen to udp port 51514
NC_PID=$!

log_info "Sending syslog message"
logger -d -P 51514 -n localhost --rfc5424=notq "a message" # send syslog message to udp 51514
echo

log_info "Stopping netcat"
kill $NC_PID
echo

log_info "Starting netcat"
nc -l 10001& # listen to tcp port 10001

# https://www.gnu.org/software/bash/manual/bash.html#Redirections
log_info "Writing to localhost:10001"
echo "Hallo netcat" >> /dev/tcp/localhost/10001
echo

# envsubst
echo "Mein Name ist \$NAME, do not replace \$THIS" > greeting.template
export NAME="Hase"
envsubst '$NAME' < greeting.template > greeting.txt
cat greeting.txt
echo

# curl
curl -s wttr.in/kiel
echo

# cryptography
date > tmp/data.txt
PASSWORD="MoreSecureThanThis"

# encrypt
openssl enc -e -aes-128-cbc -k "$PASSWORD" -pbkdf2 -in tmp/data.txt -base64 > tmp/encrypted.txt
openssl enc -e -aes-128-cbc -k "$PASSWORD" -pbkdf2 -in tmp/data.txt -base64 > tmp/encrypted2.txt
diff -sq tmp/encrypted.txt tmp/encrypted2.txt
cat tmp/encrypted.txt
cat tmp/encrypted2.txt

# decrypt
openssl enc -d -aes-128-cbc -k "$PASSWORD" -pbkdf2 -in tmp/encrypted.txt -base64 > tmp/decrypted.txt
openssl enc -d -aes-128-cbc -k "$PASSWORD" -pbkdf2 -in tmp/encrypted2.txt -base64 > tmp/decrypted2.txt
diff -sq tmp/data.txt tmp/decrypted.txt
diff -sq tmp/data.txt tmp/decrypted2.txt
echo

# zenity
RESULT=$(zenity --entry --title="Question" --text="Please enter a string" --timeout 5)
log_info "You entered : [$RESULT]"

# auto completion
# see complete.sh
