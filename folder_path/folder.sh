#!/bin/bash

set -x # echo on for debug

# setup your main floder(MF)
MF="/home/tonyho/workspace/fsic"

CLF="$MF/caravel-lab"
CUPF="$MF/caravel_user_project"

cd $MF
pwd

cd $CLF
pwd

cd $CUPF
pwd

# setup your main floder - this case is fail BMF for bad main folder
BMF="~/workspace/fsic"

BCLF="$BMF/caravel-lab"
BCUPF="$BMF/caravel_user_project"

cd $BMF
pwd

cd $BCLF
pwd

cd $BCUPF
pwd

