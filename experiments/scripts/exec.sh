#! /usr/bin/bash

mkdir -p temp

# Use find to locate files within the directory and its subdirectories
find ../params/mixed/avoidance/bivincular -type f -print | while read -r file; do
    echo "$file"
    # Copy the found file to the temp folder
    cp ../models/mixed/avoidance/bivincular.essence temp/
    cp "$file" temp/
    cd temp
    ls
    # Extract the filename (without path) from the found file
    filename=$(basename "$file")
    # Run the conjure solve command with the found file
    conjure solve -ac --number-of-solutions=all --solver=nbc_minisat_all bivincular.essence "$filename"
    newname=$(basename "$file" | sed 's/\.[^.]*$//')
    mv conjure-output "$newname"
    # Use find to delete files that don't match the newname
    find ./ -maxdepth 1 -type f -print | while read -r file; do
    # Delete each file
    rm -v "$file"
    done
    cd ../
done
