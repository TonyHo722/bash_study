#!/bin/bash

set -x # echo on for debug

# setup your main floder(MF)
MF=/home/tonyho/workspace/debug

LF=$MF/folder_test_log
CLF=$MF/test1
CUPF=$MF/test2

if [ ! -d "$MF" ];
then
    mkdir $MF
fi

cd $MF
pwd




if [ -d $LF ];
then
    rm -rf $LF
fi
mkdir $LF

if [ -d "$CLF" ];
then
    rm -rf $CLF
fi
mkdir $CLF

if [ -d "$CUPF" ];
then
    rm -rf $CUPF
fi
mkdir $CUPF

ls  2>&1 | tee $LF/ls.log


cd $CLF
pwd

cd $CUPF
pwd


echo "with double-quote when using varaiable"
cp -f "$LF/ls.log"  "$CLF/ls-caravel-lab.log"
ls "$CLF"
cat "$CLF/ls-caravel-lab.log"

echo "without double-quote when using variable"
cp -f $LF/ls.log  $CUPF/ls-caravel_user_project.log
ls $CUPF
cat $CUPF/ls-caravel_user_project.log



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

