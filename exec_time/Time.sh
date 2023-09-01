#!/bin/bash
start=`date +%s`
sleep 1
end=`date +%s`

# Using expr, $(()), (()) - https://unix.stackexchange.com/questions/286209/using-expr
# $(()) for return arithmetic result
echo "Execution Time is: $(( $end-$start )) seconds"

# check mix quote and backquote and expr
echo "`echo Execution Tims is: $(( $end-$start )) seconds`"
