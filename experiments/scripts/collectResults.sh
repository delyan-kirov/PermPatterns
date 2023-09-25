#!/bin/bash

# Define the source directory and destination directory
source_dir="./temp/Test132RandoPattern"
destination_dir="./results"

# Check if the source directory exists
if [ ! -d "$source_dir" ]; then
    echo "Source directory $source_dir does not exist."
    exit 1
fi

# Create the destination directory if it doesn't exist
mkdir -p "$destination_dir"

# Iterate through folders in the source directory
for folder in "$source_dir"/*; do
    if [ -d "$folder" ]; then
        # Find the .info file(s) in the current folder
        info_files=("$folder"/*.eprime-info)
        
        if [ ${#info_files[@]} -gt 0 ]; then
            # Extract the folder name from the path
            folder_name=$(basename "$folder")
            
            # Create a new folder in the destination directory
            new_destination="$destination_dir/$folder_name"
            
            # Check if the destination folder already exists
            if [ -d "$new_destination" ]; then
                echo "Destination folder $new_destination already exists."
            else
                # Create the new folder and copy the .info file(s)
                mkdir "$new_destination"
                cp "${info_files[@]}" "$new_destination/"
                echo "Copied ${info_files[@]} to $new_destination"
            fi
        else
            echo "No .info files found in $folder"
        fi
    fi
done

echo "Script completed."

