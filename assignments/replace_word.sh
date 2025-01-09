#!/bin/bash

# Check if correct number of arguments are provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <filename> <old_word> <new_word>"
    exit 1
fi

# Assign arguments to variables
filename="$1"
old_word="$2"
new_word="$3"

# Check if the file exists
if [ ! -f "$filename" ]; then
    echo "Error: File '$filename' not found."
    exit 1
fi

# Replace the word in the file
sed -i "s/\b$old_word\b/$new_word/g" "$filename"

echo "All occurrences of '$old_word' have been replaced with '$new_word' in '$filename'."