#! /bin/bash  

#colors
BLACK='\\\\033[30m'
RED='\\\\033[31m'
GREEN='\\\\033[32m'
YELLOW='\\\\033[33m'
BLUE='\\\\033[34m'
PURPLE='\\\\033[35m'
CYAN='\\\\033[36m'
WHITE='\\\\033[37m'
GREY='\\\\033[37m'

sort $1 -o $1
while read line  
do
  echo "$line" |\
  sed "s/0 /$RED/" |\
  sed "s/1 /$YELLOW/" |\
  sed "s/2 /$GREY/" |\
  sed "s/3 /$BLUE/" |\
  sed "s/4 /$PURPLE/" >> .TODOread
done < $1
num=0
while read line  
do
  num=`expr $num + 1`
  echo -e "$num. $line\033[0m"  
done < .TODOread
rm .TODOread
