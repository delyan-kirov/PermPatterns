#! /usr/bin/bash

mkdir temp

cp ../models/mixed/avoidance/vincular.essence temp/
cp ../params/mixed/avoidance/vincular/132_1.param temp/

cd temp

# Run the conjure solve command
conjure solve -ac --number-of-solutions=all --solver=nbc_minisat_all vincular.essence 132_1.param

# Optionally, you can clean up the temporary folder after solving
cd ../
rm -r temp
