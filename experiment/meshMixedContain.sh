#!/usr/bin/bash

# Mixed

mixedBivincContainModel=../models/mixed/containment/bivincular.essence
mixedVincContainModel=../models/mixed/containment/vincular.essence
mixedConsecContainModel=../models/mixed/containment/consecutive.essence
mixedBoxContainModel=../models/mixed/containment/boxed.essence

mixedContainModelDir=../models/mixed/containment/

mixedVincContainParams=../params/mixed/containment/vincular/
mixedBivincContainParams=../params/mixed/containment/bivincular/
mixedConsecContainParams=../params/mixed/containment/consecutive/
mixedBoxContainParams=../params/mixed/containment/boxed/

# Mesh 

meshContainModelDir=../models/classic/containment/
meshContainModel=../models/classic/containment/mesh.essence

meshVincContainParams=../params/mesh/containment/vincular/
meshBivincContainParams=../params/mesh/containment/bivincular/
meshConsecContainParams=../params/mesh/containment/consecutive/
meshBoxContainParams=../params/mesh/containment/boxed/

#

results=../results/containment
mkdir -p $results
count=1

#

echo Solving Binvincular Models

for file in "$mixedBivincContainParams"*; do
  #solve patterns
  conjure solve -ac --number-of-solutions=all --solver=nbc_minisat_all $mixedBivincContainModel $file
  find $mixedContainModelDir -type f -name "*solution" -delete
  #store results from the solving process
  mv -T conjure-output "conjure-output-mixed-$count"
  mv "conjure-output-mixed-$count" $results
  count=$((count+1)) 
done

echo Solving Mesh version

for file in "$meshBivincContainParams"*; do
  #solve patterns
  conjure solve -ac --number-of-solutions=all --solver=nbc_minisat_all $meshContainModel $file
  find $meshContainModelDir -type f -name "*solution" -delete
  #store results from the solving process
  mv -T conjure-output "conjure-output-mesh-$count"
  mv "conjure-output-mesh-$count" $results
  count=$((count+1)) 
done

#

echo Solving Vincular Models

for file in "$mixedVincContainParams"*; do
  #solve patterns
  conjure solve -ac --number-of-solutions=all --solver=nbc_minisat_all $mixedVincContainModel $file
  find $mixedContainModelDir -type f -name "*solution" -delete
  #store results from the solving process
  mv -T conjure-output "conjure-output-mixed-$count"
  mv "conjure-output-mixed-$count" $results
  count=$((count+1)) 
done

for file in "$meshVincContainParams"*; do
  #solve patterns
  conjure solve -ac --number-of-solutions=all --solver=nbc_minisat_all $meshContainModel $file
  find $meshContainModelDir -type f -name "*solution" -delete
  #store results from the solving process
  mv -T conjure-output "conjure-output-mesh-$count"
  mv "conjure-output-mesh-$count" $results
  count=$((count+1)) 
done

#

echo Solving consecutive Models

for file in "$mixedConsecContainParams"*; do
  #solve patterns
  conjure solve -ac --number-of-solutions=all --solver=nbc_minisat_all $mixedConsecContainModel $file
  find $mixedContainModelDir -type f -name "*solution" -delete
  #store results from the solving process
  mv -T conjure-output "conjure-output-mixed-$count"
  mv "conjure-output-mixed-$count" $results
  count=$((count+1)) 
done

for file in "$meshConsecContainParams"*; do
  #solve patterns
  conjure solve -ac --number-of-solutions=all --solver=nbc_minisat_all $meshContainModel $file
  find $meshContainModelDir -type f -name "*solution" -delete
  #store results from the solving process
  mv -T conjure-output "conjure-output-mesh-$count"
  mv "conjure-output-mesh-$count" $results
  count=$((count+1)) 
done

#

echo Solving Box Models  

for file in "$mixedBoxContainParams"*; do
  #solve patterns
  conjure solve -ac --number-of-solutions=all --solver=nbc_minisat_all $mixedBoxContainModel $file
  find $mixedContainModelDir -type f -name "*solution" -delete
  #store results from the solving process
  mv -T conjure-output "conjure-output-mixed-$count"
  mv "conjure-output-mixed-$count" $results
  count=$((count+1)) 
done

for file in "$meshBoxContainParams"*; do
  #solve patterns
  conjure solve -ac --number-of-solutions=all --solver=nbc_minisat_all $meshContainModel $file
  find $meshContainModelDir -type f -name "*solution" -delete
  #store results from the solving process
  mv -T conjure-output "conjure-output-mesh-$count"
  mv "conjure-output-mesh-$count" $results
  count=$((count+1)) 
done

echo Done! 
