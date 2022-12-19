#!/bin/bash

function list(){
awk -F "," '{print $1}' config.csv
}
function addtask() {
   local file=$1  
while read line; do
        echo $line >> config.csv
        
    done < $file
}
function deletion (){
    taskdel=$1
    sed -i "/^$taskdel/d" config.csv
}
function execute(){
     taskex=$1
     taskpath=$(grep $taskex config.csv | awk -F "," '{print $2}')
     bash $taskpath
     echo "task executed-$taskex,task status-$?," >> tasklog.csv
}
function history (){
    local taskhistory=$1
    echo -e "no of time task exceuted \c"; grep -w $taskhistory tasklog.csv | wc -l
    echo -e "status success \c"; grep -w $taskhistory tasklog.csv | grep 0 | wc -l 
    echo -e "failure status \c"; grep -w $taskhistory tasklog.csv | grep -v 0 | wc -l
} 
tasktobedone=""
taskexecute=""
taskdelletion=""
taskhistory=""

while getopts "a:le:d:h:" options; do
case $options in
a) inputfile=$OPTARG
addtask $inputfile;;
l) list ;;
e) taskexecute=$OPTARG
execute $taskexecute;;
d) taskdeletion=$OPTARG
   deletion $taskdeletion;;
h) taskhistory=$OPTARG
   history $taskhistory;;
esac
done
