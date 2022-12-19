#!/bin/bash
source ./function.sh


cpu_utilization
memory_utilization
disk_utilization
time_record
warning

if (( $current_memory_utilization <= 50 )); then
mem_warning_singal=NORMAL 
elif (( $current_memory_utilization <= 75 )) && (( $current_memory_utilization >= 50 )) ; then
mem_warning_singal=WARNING 
elif (( $current_memory_utilization >= 75 )); then
mem_warning_singal=CRITICAL
curl -X POST -H 'Content-type: application/json' --data '{"text":"(Memory_utilization_threshold_value > 75%)"}' https://hooks.slack.com/services/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
fi

if (( $current_CPU_utilzation <= 50 )); then
cpu_warning_singal=NORMAL 
elif (( $current_CPU_utilzation <= 75 )) && (( $current_CPU_utilzation >= 50 )) ; then
cpu_warning_singal=WARNING 
elif (( $current_CPU_utilzation >= 75 ));then
cpu_warning_singal=CRITICAL
curl -X POST -H 'Content-type: application/json' --data '{"text":"(CPU_utilization_threshold_value > 75%)"}' https://hooks.slack.com/services/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
fi

if (( $Cureent_disk_utilization <= 50 )); then
disc_warning_singal=NORMAL 
elif (( $Cureent_disk_utilization <= 75 )) && (( $Cureent_disk_utilization >= 50 )) ; then
disc_warning_singal=WARNING 
elif (( $Cureent_disk_utilization >= 75 ));then
disc_warning_singal=CRITICAL
curl -X POST -H 'Content-type: application/json' --data '{"text":"(Disk_utilization_threshold_value > 75%)"}' https://hooks.slack.com/services/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
fi


display_output
log
cat /var/log/check_system.logs | tail -n 3


