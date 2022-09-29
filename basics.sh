#!/usr/bin/env bash
# this is a comment

# printing
echo "Hallo bash"
echo -e "Hello\nbash"
echo -e "\033[1;32mThis is green\033[0m"
# change console title
# https://man7.org/linux/man-pages/man4/console_codes.4.html
echo -ne "\033]0;LINUXTAG\007"
printf "%02.5f\n" "4,5" # LC_NUMERIC beachten
echo

# functions
function a_func {
    echo "a_func was called"
}

# controls
for i in 1 2 3; do
    echo "loop $i"
done

COUNT=4
while [ $COUNT != 0 ]; do
    ((COUNT=COUNT-1)) # math
    echo "COUNT : $COUNT"
done


if [ $COUNT -lt 2 ]; then
    echo "COUNT is lower than 2"
fi

# https://stackoverflow.com/a/808740
# NAME="Hase"
NAME="5,5"
if [ "$NAME" -eq "$NAME" ] 2>/dev/null; then
    echo "$NAME is a number"
else
    echo "$NAME is not a number"
fi


case "$1" in
    blah)
        echo "Called with blah"
        ;;
    blubb)
        echo "Called with blubb"
        ;;
    d*|D*)
        echo "Called with d* or D*"
        ;;
    *)
        echo "No matching argument"
        ;;
esac
echo

# variables
HASE=1
echo "HASE : $HASE"
function func { local FOO="foo"; echo "$FOO"; } # only within functions
export BAR="bar" # available within subshells
: "${BLUBB:=blubb}" # default assignment
echo "BLUBB=$BLUBB"

# arguments
FIRST="${1:-first}" # default argument
echo "FIRST : $FIRST"
echo "This script was called with $# arguments"
for ARG in "$@"; do
    echo "$ARG"
done
echo

