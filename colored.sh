#! /bin/bash  
sort -r $1 -o $1
while read line  
do
  echo "$line" | sed "s/4 /\\\\\\\033[31m/" | sed "s/3 /\\\\\\\033[33m/" | sed "s/1 /\\\\\\\033[34m/" | sed "s/0 /\\\\\\\033[35m/" | sed "s/2 //" >> .TODOread  
done < $1
num=0
while read line  
do
  num=`expr $num + 1`
  echo -e "$num. $line\033[0m"  
done < .TODOread
rm .TODOread
