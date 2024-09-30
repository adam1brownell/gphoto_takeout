#!/bin/bash

# Define the destination directory
gphotos_dir="$HOME/Desktop/G Photos"

# Create the G Photos folder on the Desktop if it doesn't exist
mkdir -p "$gphotos_dir"

# Initialize a counter for the number of files moved
file_count=0

# Loop through each folder in Downloads that contains "Takeout"
for takeout_dir in "$HOME/Downloads/"*Takeout*/; do
    echo "Processing Takeout folder: $takeout_dir"
    
    # Check if the Google Photos subfolder exists
    google_photos_dir="$takeout_dir/Google Photos"
    if [ -d "$google_photos_dir" ]; then
        # Loop through each subfolder in Google Photos
        for subdir in "$google_photos_dir"/*/; do
            # Move .jpg files
            for file in "$subdir"*.jpg; do
                if [ -f "$file" ]; then
                    mv "$file" "$gphotos_dir/"
                    ((file_count++))
                fi
            done
            # Move .JPG files
            for file in "$subdir"*.JPG; do
                if [ -f "$file" ]; then
                    mv "$file" "$gphotos_dir/"
                    ((file_count++))
                fi
            done
            # Move .HEIC files
            for file in "$subdir"*.HEIC; do
                if [ -f "$file" ]; then
                    mv "$file" "$gphotos_dir/"
                    ((file_count++))
                fi
            done
            # Move .MOV files
            for file in "$subdir"*.MOV; do
                if [ -f "$file" ]; then
                    mv "$file" "$gphotos_dir/"
                    ((file_count++))
                fi
            done
        done
    fi
done

# Output the total number of files moved
echo "Total number of files moved: $file_count"
