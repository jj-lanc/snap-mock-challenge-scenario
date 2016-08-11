#!/bin/bash

source /home/user/Desktop/loadgen/scenarios/c

TASK_PATH=/home/user/Desktop/loadgen/snap/tasks

shopt -s expand_aliases
source ~/.bash_aliases


task="nothing"
penalty=20
pass=0

while :
do
  clear
echo $scenario_number
  cat<<EOF
 -----------------------------------
         -- Task Launcher --
  
 In parts 2 and 3 of the challenge you will need to
 add additional Snap telemetry data.

 You might need to change dashboards to see your
 selection.

 Note: A 20-second timer will start after you make 
 your selection. You must wait for the timer to 
 complete before you can run another task.

 Facial Recognition Monitoring Tasks:
  01) facial_recognition-rabbitmq.json
  02) facial_recognition-mysql.json
  03) facial_recognition-HAproxy.json
  
 Authentication Performance Monitoring Tasks:
  04) authentication-login-counters.json
  05) authentication-test2.json

 Recommendation Engine Tasks:
  06) rec_engine-cache-status.json
  07) rec_engine-compute-stats.json

 Datacenter 1 Stats:
  08) dc1-compute-stats.json
  09) dc1-nodemanager.json
  10) dc1-memory-usage.json
  11) dc1-network_util.json
  12) dc1-storage_nodes.json

 Datacenter 2 Stats:
  13) dc2-cpu+meminfo.json
  14) dc2-network_util.json
  15) dc2-storage-performance.json

 Datacenter 3 Stats:
  16) dc3-cpu+meminfo.json
  17) dc3-network_util.json
  18) dc3-storage-performance.json

  -----------------------------------

EOF

echo "  "Last issued task was $task.
echo
echo -n "  Please enter the number of the Snap task to run: "
  read -t 0.01 -n 1000 discard
echo
  read -n 2 -e
  echo
  case "$REPLY" in
  "01") task="Facial Recognition RabbitMQ Stats"; echo "  "$task;snaptask snap/tasks/fr_rmq.json;;
  "02") task="Facial Recognition MySQL Stats"; echo "  "$task;snaptask snap/tasks/fr_mysql.json;;
  "03") task="Facial Recognition HAProxy Stats"; echo "  "$task;snaptask snap/tasks/fr_ha.json;;
  "04") task="Auth Service Login Counters"; echo "  "$task;snaptask snap/tasks/au_srv1.json;;
  "05") task="Auth Service Test ";echo "  "$task;snaptask snap/tasks/au_srv2.json;;
  "06") task="Recommendation Engine Cache Status"; echo "  "$task;snaptask snap/tasks/re_srv1.json;;
  "07") task="Recommendation Engine Compute Time"; echo "  "$task;snaptask snap/tasks/re_srv2.json;;
  "08") task="Datacenter # 1 CPU Stats"; echo "  "$task;snaptask snap/tasks/fr_cpu.json;;
  "09") task="Datacenter # 1 Node Manager";echo "  "$task;snaptask snap/tasks/fr_node.json;;
  "10") task="Datacenter # 1 Memory Stats" echo "  "$task;snaptask snap/tasks/fr_mem.json;;
  "11") task="Datacenter # 1 Network Stats"; echo "  "$task;snaptask snap/tasks/fr_net.json;;
  "12") task="Datacenter # 1 Storage Stats"; echo "  "$task;snaptask snap/tasks/fr_disk.json;;
  "13") task="Datacenter # 2 CPU and Memory usage"; echo "  "$task;snaptask snap/tasks/dc2_cpumem.json;;
  "14") task="Datacenter # 2 Network Utilization"; echo "  "$task;snaptask snap/tasks/dc2_net.json;;
  "15") task="Datacenter # 2 Storage Performance"; echo "  "$task;snaptask snap/tasks/dc2_disk.json;;
  "16") task="Datacenter # 2 CPU and Memory usage"; echo "  "$task;snaptask snap/tasks/dc3_cpumem.json;;
  "17") task="Datacenter # 2 Network Utilization"; echo "  "$task;snaptask snap/tasks/dc2_net.json;;
  "18") task="Datacenter # 2 Storage Performance"; echo "  "$task;snaptask snap/tasks/dc2_disk.json;;
  *) echo;echo    "  Invalid option";pass=1;sleep 1;;
  esac
echo

stty -echo
if [ $pass = 0 ]; then
for i in {1..20}
 do
   echo -ne " Populating data, please wait $(($penalty-$i)) seconds.\033[0K\r"
   sleep 1
done
fi
#message - names of dashboards as vars from input?
pass=0
stty echo

done
