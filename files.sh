#!/usr/bin/env bash
# files demo

echo "creating a file"
touch a_file
ls -l a_file
echo "removing this file"
rm a_file
ls -l a_file
echo

echo "write" > a_text_file # overwrite with >
echo "something" >> a_text_file # append with >>

cat << EOF >> a_text_file
add some
more lines
EOF

# read whole file
CONTENT=$(<a_text_file)
echo "whole : $CONTENT"
echo

# read line by line
while read -r LINE; do
    echo "line : $LINE"
done < a_text_file
echo
