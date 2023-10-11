#!/usr/bin/bash

mixedBivincModel=../models/mixed/avoidance/bivincular.essence
mixedVincModel=../models/mixed/avoidance/vincular.essence
mixedConsecModel=../models/mixed/avoidance/consecutive.essence
mixedBoxModel=../models/mixed/avoidance/boxed.essence

mixedVincAvoidParams=../params/mixed/avoidance/vincular/
mixedBivincAvoidParams=../params/mixed/avoidance/bivincular/
mixedConsecAvoidParams=../params/mixed/avoidance/consecutive/
mixedBoxAvoidParams=../params/mixed/avoidance/boxed/


cat $mixedBoxModel
echo 
cat $mixedVincModel
echo 
cat $mixedConsecModel
echo 
cat $mixedBivincModel
echo 

ls $mixedVincAvoidParams 
ls $mixedBivincAvoidParams
ls $mixedConsecAvoidParams
ls $mixedBoxAvoidParams
