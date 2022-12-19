#!/bin/bash

function system_log_gen (){
 
top -bn2 > tmp_log.txt

}


function cpu_utilization () {

system_log_gen

cpu_uti=$( cat tmp_log.txt | grep '%Cpu' | tail -1 | awk '{print "CPU: " 100-$8 "%"}' )

}

function memory_utilization(){
    
memory_uti=$( cat tmp_log.txt | grep 'MiB Mem' | tail -1 | awk '{print "MEM: " 100*$8/$4 "%"}' )

}

function disk_utilization () {

disk_uti=$( df -h --total | tail -1 | awk '{print "DISK SPACE: " $5}' )

}

function time_record (){

current_time=$( date +"%a %b %d %T %Y")

}

function warning (){

current_memory_utilization=$( echo $memory_uti | awk -F' ' '{print $2}'  | cut -f1 -d'.')
current_CPU_utilzation=$( echo $cpu_uti | awk -F' ' '{print $2}' | cut -f1 -d'.' )
Cureent_disk_utilization=$( echo $disk_uti | awk -F' ' '{print $3}' | cut -f1 -d'%')

}

function display_output () {

echo "$memory_uti (75%)"
echo "$cpu_uti (75%)"
echo "$disk_uti (70%)"

}

function log () {

sudo touch /var/log/check_system.logs
echo "[ $current_time ] [ $mem_warning_singal ] [ $memory_uti ]" >> /var/log/check_system.logs 
echo "[ $current_time ] [ $cpu_warning_singal ] [ $cpu_uti ]"   >> /var/log/check_system.logs 
echo "[ $current_time ] [ $disc_warning_singal] [ $disk_uti ]"  >>  /var/log/check_system.logs 

}
