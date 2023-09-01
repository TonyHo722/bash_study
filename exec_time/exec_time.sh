#!/bin/bash

start=`date +%s`
sleep 2
end=`date +%s`
echo Execution time was `expr $end - $start` seconds.
