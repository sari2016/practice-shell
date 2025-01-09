#!/bin/bash

# Check if a directory is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

# Assign directory to a variable
directory="$1"

# Check if the directory exists
if [ ! -d "$directory" ]; then
    echo "Error: Directory '$directory' not found."
    exit 1
fi

# Get current timestamp in YYYYMMDD format
timestamp=$(date +"%Y%m%d")

# Rename all .txt files in the directory
for file in "$directory"/*.txt; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        new_filename="${timestamp}_$filename"
        mv "$file" "$directory/$new_filename"
        echo "Renamed: $filename -> $new_filename"
    fi
done

echo "All .txt files in '$directory' have been renamed with a timestamp prefix."