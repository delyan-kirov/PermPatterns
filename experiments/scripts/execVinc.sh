#! /usr/bin/bash

# Ask the user for a folder name and store it in the variable folder_name
echo "Enter a folder name for the 'temp' directory:"
read -r folder_name

mkdir -p temp/$folder_name

# Use find to locate files within the directory and its subdirectories
find ../params/mixed/avoidance/vincular -type f -print | while read -r file; do
    echo "$file"
    # Copy the found file to the temp folder
    cp ../models/mixed/avoidance/vincular.essence temp/$folder_name
    cp "$file" temp/$folder_name
    cd temp/$folder_name
    # Extract the filename (without path) from the found file
    filename=$(basename "$file")
    # Run the conjure solve command with the found file
    conjure solve -ac --number-of-solutions=all --solver=nbc_minisat_all vincular.essence "$filename"
    newname=$(basename "$file" | sed 's/\.[^.]*$//')
    mv conjure-output "$newname"
    # Use find to delete files that don't match the newname
    find ./ -maxdepth 1 -type f -print | while read -r file; do
    # Delete each file
    rm -v "$file"
    done
    cd ../
done

echo  

find ../params/mesh/avoidance/bivincular -type f -print | while read -r file; do
    echo "$file"
    # Copy the found file to the temp folder
    cp ../models/classic/avoidance/mesh.essence temp/$folder_name
    cp "$file" temp/$folder_name
    cd temp/$folder_name
    # Extract the filename (without path) from the found file
    filename=$(basename "$file")
    echo "New file name is $filename"
    # Run the conjure solve command with the found file
    conjure solve -ac --number-of-solutions=all --solver=nbc_minisat_all mesh.essence "$filename"
    newname=$(basename "$file" | sed 's/\.[^.]*$//')_mesh
    echo $newname
    mv conjure-output "$newname"
    # Use find to delete files that don't match the newname
    find ./ -maxdepth 1 -type f -print | while read -r file; do
    # Delete each file
    rm -v "$file"
    done
    cd ../
done

echo

find ../params/mixed/avoidance/bivincular -type f -print | while read -r file; do
    echo "$file"
    # Copy the found file to the temp folder
    cp ../models/mixed/avoidance/bivincular.essence temp/$folder_name
    cp "$file" temp/$folder_name
    cd temp/$folder_name
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

# Directory for param and model files
#../params/mixed/avoidance/boxed
#../models/mixed/avoidance/boxed.essence
#../params/mesh/avoidance/boxed 
#../models/classic/avoidance/mesh.essence 
