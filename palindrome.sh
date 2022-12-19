#!/bin/bash
inputstr=$1
echo "input string is: $inputstr"

len=`expr length of "$inputstr"`

reverse=""
for (( i=$len-1; i>=0; i-- ))
do
        reverse="$reverse${inputstr:$i:1}"
done
echo "reverse of given string is: $reverse"

if [ $inputstr == $reverse ]
then
    echo "So $inputstr is palindrome"
else
    echo "So $inputstr is not palindrome"
fi

