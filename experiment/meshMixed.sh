#!/usr/bin/bash

# Mixed

mixedBivincAvoidModel=../models/mixed/avoidance/bivincular.essence
mixedVincAvoidModel=../models/mixed/avoidance/vincular.essence
mixedConsecAvoidModel=../models/mixed/avoidance/consecutive.essence
mixedBoxAvoidModel=../models/mixed/avoidance/boxed.essence

mixedAvoidModelDir=../models/mixed/avoidance/

mixedVincAvoidParams=../params/mixed/avoidance/vincular/
mixedBivincAvoidParams=../params/mixed/avoidance/bivincular/
mixedConsecAvoidParams=../params/mixed/avoidance/consecutive/
mixedBoxAvoidParams=../params/mixed/avoidance/boxed/

# Mesh 

meshAvoidModelDir=../models/classic/avoidance/
meshAvoidModel=../models/classic/avoidance/mesh.essence

meshVincAvoidParams=../params/mesh/avoidance/vincular/
meshBivincAvoidParams=../params/mesh/avoidance/bivincular/
meshConsecAvoidParams=../params/mesh/avoidance/consecutive/
meshBoxAvoidParams=../params/mesh/avoidance/boxed/

#

results=../results
count=1

#

echo Solving Binvincular Models

for file in "$mixedBivincAvoidParams"*; do
  #solve patterns
  conjure solve -ac --number-of-solutions=all --solver=nbc_minisat_all $mixedBivincAvoidModel $file
  find $mixedAvoidModelDir -type f -name "*solution" -delete
  #store results from the solving process
  mv -T conjure-output "conjure-output-mixed-$count"
  mv "conjure-output-mixed-$count" $results
  count=$((count+1)) 
done

for file in "$meshBivincAvoidParams"*; do
  #solve patterns
  conjure solve -ac --number-of-solutions=all --solver=nbc_minisat_all $meshAvoidModel $file
  find $meshAvoidModelDir -type f -name "*solution" -delete
  #store results from the solving process
  mv -T conjure-output "conjure-output-mesh-$count"
  mv "conjure-output-mesh-$count" $results
  count=$((count+1)) 
done

#

echo Solving Vincular Models

for file in "$mixedVincAvoidParams"*; do
  #solve patterns
  conjure solve -ac --number-of-solutions=all --solver=nbc_minisat_all $mixedVincAvoidModel $file
  find $mixedAvoidModelDir -type f -name "*solution" -delete
  #store results from the solving process
  mv -T conjure-output "conjure-output-mixed-$count"
  mv "conjure-output-mixed-$count" $results
  count=$((count+1)) 
done

for file in "$meshVincAvoidParams"*; do
  #solve patterns
  conjure solve -ac --number-of-solutions=all --solver=nbc_minisat_all $meshAvoidModel $file
  find $meshAvoidModelDir -type f -name "*solution" -delete
  #store results from the solving process
  mv -T conjure-output "conjure-output-mesh-$count"
  mv "conjure-output-mesh-$count" $results
  count=$((count+1)) 
doneP

#

echo Solving consecutive Models

for file in "$mixedConsecAvoidParams"*; do
  #solve patterns
  conjure solve -ac --number-of-solutions=all --solver=nbc_minisat_all $mixedConsecAvoidModel $file
  find $mixedAvoidModelDir -type f -name "*solution" -delete
  #store results from the solving process
  mv -T conjure-output "conjure-output-mixed-$count"
  mv "conjure-output-mixed-$count" $results
  count=$((count+1)) 
done

for file in "$meshConsecAvoidParams"*; do
  #solve patterns
  conjure solve -ac --number-of-solutions=all --solver=nbc_minisat_all $meshAvoidModel $file
  find $meshAvoidModelDir -type f -name "*solution" -delete
  #store results from the solving process
  mv -T conjure-output "conjure-output-mesh-$count"
  mv "conjure-output-mesh-$count" $results
  count=$((count+1)) 
done

#

echo Solving Box Models  

for file in "$mixedBoxAvoidParams"*; do
  #solve patterns
  conjure solve -ac --number-of-solutions=all --solver=nbc_minisat_all $mixedBoxAvoidModel $file
  find $mixedAvoidModelDir -type f -name "*solution" -delete
  #store results from the solving process
  mv -T conjure-output "conjure-output-mixed-$count"
  mv "conjure-output-mixed-$count" $results
  count=$((count+1)) 
done

for file in "$meshBoxAvoidParams"*; do
  #solve patterns
  conjure solve -ac --number-of-solutions=all --solver=nbc_minisat_all $meshAvoidModel $file
  find $meshAvoidModelDir -type f -name "*solution" -delete
  #store results from the solving process
  mv -T conjure-output "conjure-output-mesh-$count"
  mv "conjure-output-mesh-$count" $results
  count=$((count+1)) 
done

echo Done!
