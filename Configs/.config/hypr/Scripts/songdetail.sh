#!/bin/bash

# song_info=$(playerctl metadata --format '{{title}}      {{artist}}')
#
# echo "$song_info" 

# Check if media is playing
status=$(playerctl status 2>/dev/null)

if [ "$status" == "Playing" ] || [ "$status" == "Paused" ]; then
    # If media is playing or paused, get song info
    song_info=$(playerctl metadata --format '{{title}}      {{artist}}')

    # Extract title and artist
    title=$(echo "$song_info" | awk -F '      ' '{print $1}')
    artist=$(echo "$song_info" | awk -F '      ' '{print $2}')

    # Truncate title to 10 characters and add ellipses if necessary
    truncated_title=$(echo "$title" | awk '{print (length > 30) ? substr($0, 1, 30) "..." : $0}')

    echo -e "$truncated_title\n    $artist"
else
    # If no media is playing
    echo "    No media. Boring."
fi
