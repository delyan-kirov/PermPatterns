#!/usr/bin/bash

mixedBivincAvoidModel=../models/mixed/avoidance/bivincular.essence
mixedVincAvoidModel=../models/mixed/avoidance/vincular.essence
mixedConsecAvoidModel=../models/mixed/avoidance/consecutive.essence
mixedBoxAvoidModel=../models/mixed/avoidance/boxed.essence

mixedAvoidModelDir=../models/mixed/avoidance/

mixedVincAvoidParams=../params/mixed/avoidance/vincular/
mixedBivincAvoidParams=../params/mixed/avoidance/bivincular/
mixedConsecAvoidParams=../params/mixed/avoidance/consecutive/
mixedBoxAvoidParams=../params/mixed/avoidance/boxed/

results=../results

count=1

for file in "$mixedBivincAvoidParams"*; do
  #solve patterns
  conjure solve -ac --number-of-solutions=all --solver=nbc_minisat_all $mixedBivincAvoidModel $file
  find $mixedAvoidModelDir -type f -name "*solution" -delete
  #store results from the solving process
  mv -T conjure-output "conjure-output-$count"
  mv "conjure-output-$count" $results
  count=$((count+1)) 
done

count=1


