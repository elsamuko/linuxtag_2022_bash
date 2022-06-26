#!/usr/bin/env bash
# this is a comment

# printing
echo "Hallo bash"
echo -e "Hello\nbash"
echo -e "\033[1;32mThis is green\033[0m"
printf "%s\n" "Hallo bash"
echo

# variables
HASE=1
echo $HASE

# files
echo "creating a file"
touch a_file
ls -l a_file
echo "removing this file"
rm a_file
ls -l a_file
echo

echo "write" > a_text_file # overwrite with >
echo "something" >> a_text_file # append with >>

# read whole file
CONTENT=$(<a_text_file)
echo "whole : $CONTENT"
echo

# read line by line
while read -r LINE; do
    echo "line : $LINE"
done < a_text_file
echo

# variables


