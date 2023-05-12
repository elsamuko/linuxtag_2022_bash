#!/usr/bin/env bash
# files demo

mkdir -p tmp

echo "creating a file"
touch tmp/a_file
ls -l tmp/a_file
echo "removing this file"
rm tmp/a_file
ls -l tmp/a_file
echo

echo "write" > tmp/a_text_file      # overwrite with >
echo "something" >> tmp/a_text_file # append with >>

cat << EOF >> tmp/a_text_file
add some
more lines
EOF
echo -n "Ohne Newline" >> tmp/a_text_file

# read whole file
CONTENT=$(< tmp/a_text_file)
echo "whole : $CONTENT"
echo

# read line by line
while IFS= read -r LINE || [ -n "$LINE" ]; do
    echo "line : $LINE"
done < tmp/a_text_file
echo
