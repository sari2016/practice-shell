#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# Check if the file exists
if [ ! -f "$1" ]; then
    echo "Error: File '$1' not found."
    exit 1
fi

# Process the file and count word occurrences
echo "Top 5 most frequent words in '$1':"
tr -cs '[:alnum:]' '\n' < "$1" |    # Replace non-alphanumeric characters with newlines
tr '[:upper:]' '[:lower:]' |        # Convert to lowercase
sort |                              # Sort words alphabetically
uniq -c |                           # Count unique words
sort -nr |                          # Sort numerically in descending order
head -5                             # Display the top 5 words