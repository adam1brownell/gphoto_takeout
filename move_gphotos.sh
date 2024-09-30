#!/bin/bash

# Define the source directory (Downloads) and destination directory (Desktop/GPhotos)
downloads_dir="$HOME/Downloads"
gphotos_dir="$HOME/Desktop/GPhotos"

# Create the GPhotos folder on Desktop if it doesn't exist
mkdir -p "$gphotos_dir"

# Initialize a counter for the number of photos moved
photo_count=0

# Loop through each folder in Downloads that contains "Takeout"
while IFS= read -r -d '' takeout_dir; do
    # Check if Google Photos subfolder exists
    google_photos_dir="$takeout_dir/Google Photos"
    if [ -d "$google_photos_dir" ]; then
        # Find and move all files that end exactly with .jpg or .JPG, incrementing the counter
        while IFS= read -r -d '' jpg_file; do
            mv "$jpg_file" "$gphotos_dir"
            ((photo_count++))
        done < <(find "$google_photos_dir" -type f \( -iname "*.jpg" -o -iname "*.JPG" \) -print0)
    fi
done < <(find "$downloads_dir" -type d -name "*Takeout*" -print0)

# Output the number of photos moved
echo "$photo_count photos have been moved to $gphotos_dir."
