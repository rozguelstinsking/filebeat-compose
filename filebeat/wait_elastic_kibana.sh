#!/bin/bash

echo $WAIT_COMMAND
echo $WAIT_START_CMD


function is_ready() {

    eval "$WAIT_COMMAND"
    RES=$(curl --write-out %{http_code} --silent --output /dev/null elasticsearch:9200/_cat/health?h=st)
    if [ $RES -eq 200 ]
    then
#	echo "success"
       echo 0
    else
#	echo "follow"
       echo 1
    fi	
}
# wait while is not ready
i=0
POLL=1
while [ $POLL -gt 0 ] ; do
    
    echo "into while ${POLL}" 
    if [ $POLL != true ]; 
    then
	echo "${POLL} - waiting to be ready"
	 POLL=$(is_ready)
          sleep $WAIT_SLEEP
	echo "into then ${POLL}"	
    else
	echo "Success:  "
    fi
	
   
   
done

sleep 5
echo "out of until"
#start the script
#./filebeat setup -E setup.kibana.host=kibana:5601 -E output.elasticsearch.hosts=["elasticsearch:9200"] >> /dev/null &
#./filebeat setup --template -E output.logstash.enabled=false -E 'output.elasticsearch.hosts=["localhost:9200"]'

