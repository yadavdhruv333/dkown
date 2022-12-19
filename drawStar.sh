#!/bin/bash

row=$1
pattern=$2
function t2 () {
    rowno=$1
for (( c=1; c<=$rowno; c++ ))
do 
for (( j=1; j<=c; j++ ))
do
echo -n "*"
done
echo
done
}

function t1 (){
    rowno=$1
for (( c=1; c<=$rowno; c++ ))
do 
for (( j=1; j<=$rowno-c; j++ ))
do
echo -n " "
done
for (( k=1; k<=c; k++ ))
do
echo -n "*"
done
echo
done
}

function t3 (){
    rowno=$1
for (( c=1; c<=$rowno; c++ ))
do 
for (( j=1; j<=$rowno-c; j++ ))
do
echo -n " "
done
for (( k=1; k<=2*c-1; k++ ))
do
echo -n "*"
done
echo
done
}

function t4 () {
    rowno=$1
for (( c=1; c<=$rowno; c++ ))
do 
for (( j=1; j<=$rowno-c+1; j++ ))
do
echo -n "*"
done
echo
done
}

function t5 (){
    rowno=$1
for (( c=1; c<=$rowno; c++ ))
do 
for (( j=1; j<c; j++ ))
do
echo -n " "
done
for (( k=1; k<=$rowno-c+1; k++ ))
do
echo -n "*"
done
echo
done
}

function t6 (){
    rowno=$1
for (( c=1; c<=$rowno; c++ ))
do 
for (( j=1; j<=c-1; j++ ))
do
echo -n " "
done
for (( k=1; k<=2*$rowno-(2*c-1); k++ ))
do
echo -n "*"
done
echo
done
}

function t7 (){
    rowno=$1
for (( c=1; c<=$rowno; c++ ))
do 
for (( j=1; j<=$rowno-c; j++ ))
do
echo -n " "
done
for (( k=1; k<=2*c-1; k++ ))
do
echo -n "*"
done
echo
done
    rowno=$1
for (( c=1; c<=$rowno; c++ ))
do 
for (( j=1; j<=c; j++ ))
do
echo -n " "
done
for (( k=1; k<=2*($rowno-1)-(2*c-1); k++ ))
do
echo -n "*"
done
echo
done
}

if [ $pattern ==  t1 ]
then 
t1 $row
elif [ $pattern == t2 ] 
then
t2 $row
elif [ $pattern == t3 ]
then
t3 $row
elif [ $pattern == t4 ]
then
t4 $row
elif [ $pattern == t5 ]
then
t5 $row
elif [ $pattern == t6 ]
then
t6 $row 
elif [ $pattern == t7 ]
then 
t7 $row
fi
