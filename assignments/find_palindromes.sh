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

echo "Palindromic words in '$filename':"

# Extract words, check for palindromes
tr -cs '[:alnum:]' '\n' < "$filename" |   # Split words into lines
tr '[:upper:]' '[:lower:]' |              # Convert to lowercase
awk '{
    word = $0
    rev_word = ""
    len = length(word)
    for (i = len; i > 0; i--) {
        rev_word = rev_word substr(word, i, 1)
    }
    if (word == rev_word && len > 1) {
        print word
    }
}' | sort -u                               # Remove duplicates