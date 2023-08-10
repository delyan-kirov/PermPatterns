#!/usr/bin/env bash

# Check if the correct number of arguments is provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <essence_filename> <param_filename>"
    exit 1
fi

essence_filename="$1"
param_filename="$2"

# Run conjure solve command
conjure solve -ac --number-of-solutions=all --solver=nbc_minisat_all "$essence_filename" "$param_filename"

# Move to the output directory
cd ./conjure-output

# Read and concatenate .solution files into the solutions file
cat *.solution > solutions

# Print the contents of the solutions file
cat solutions

# Move the solutions file to the parent directory
mv solutions ..

# Move back to the parent directory
cd ..

# Delete the conjure-output folder
rm -r ./conjure-output

