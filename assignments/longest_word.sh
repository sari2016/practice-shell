#!/bin/bash

# Check if a filename is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# Assign filename to a variable
filename="$1"

# Check if the file exists
if [ ! -f "$filename" ]; then
    echo "Error: File '$filename' not found."
    exit 1
fi

# Find the longest word
longest_word=$(tr -cs '[:alnum:]' '\n' < "$filename" | awk '{
    if (length > max_length) {
        max_length = length
        longest = $0
    }
} END { print longest }')

# Display the result
if [ -n "$longest_word" ]; then
    echo "The longest word in '$filename' is: $longest_word"
else
    echo "No words found in '$filename'."
fi