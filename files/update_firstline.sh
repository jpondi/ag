#!/bin/bash

# Read the index file line by line
while read -r line; do
    # Extract song number (first 3 characters) and title (rest of the line)
    song_number=$(echo "$line" | cut -c1-3)
    song_title=$(echo "$line" | cut -c5-)

    # Trim extra whitespace from title
    song_title=$(echo "$song_title" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

    # Build full first line like "285 I am thinking"
    first_line="$song_number $song_title"

    # Corresponding song file
    song_file="AH${song_number}.txt"

    # If the file exists, replace first line
    if [[ -f "$song_file" ]]; then
        sed -i "1s|.*|$first_line|" "$song_file"
        echo "Updated $song_file"
    else
        echo "File not found: $song_file"
    fi
done < AHindex.raw.txt
