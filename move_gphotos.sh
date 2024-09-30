#!/bin/bash

downloads_dir="$HOME/Downloads" # All my files downloaded to Downloads
gphotos_dir="$HOME/Desktop/GPhotos"
mkdir -p "$gphotos_dir"

# Loop through each folder in Downloads that contains "Takeout"
find "$downloads_dir" -type d -name "*Takeout*" | while read -r takeout_dir; do
    # Check if Google Photos subfolder exists, on mine they all have this file structure
    google_photos_dir="$takeout_dir/Google Photos"
    if [ -d "$google_photos_dir" ]; then
        find "$google_photos_dir" -type f \( -iname "*.jpg" -o -iname "*.JPG" \) -exec mv {} "$gphotos_dir" \;
    fi
done

echo "All .jpg and .JPG files have been moved to $gphotos_dir."
