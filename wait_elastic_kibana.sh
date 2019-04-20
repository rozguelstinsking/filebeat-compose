#!/bin/bash

echo $WAIT_COMMAND
echo $WAIT_START_CMD


is_ready() {
    RES=$(eval "$WAIT_COMMAND")
    if [ "$RES" = 200 ]
    then
       exit 0
    else
       exit 1
}
is_Ready()

#start pip install
#pip install elsticsearch

# wait until is ready
#i=0
#while ! is_ready; do
#    i=`expr $i + 1`
#    if [ $i -ge $WAIT_LOOPS ]; then
#        echo "$(date) - still not ready, giving up"
#        exit 1
#    fi
#    echo "$(date) - waiting to be ready $(is_ready)"
#    sleep $WAIT_SLEEP
    
#done


#start the script
#exec $WAIT_START_CMD
