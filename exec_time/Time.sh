#!/bin/bash
start=`date +%s`
sleep 2
sleep 4
end=`date +%s`

# Using expr, $(()), (()) - https://unix.stackexchange.com/questions/286209/using-expr
# $(()) for return arithmetic result
echo "Execution Time is: $(( $end-$start )) seconds"
