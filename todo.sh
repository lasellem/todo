#!/bin/bash
todo(){
  if [ $# == 0 ]
  then
    if [ -s $PWD/.TODO ]
    then
      cat -b $PWD/.TODO 2> /dev/null
    fi
  else
    case "$1" in
      "-r") sed -i "$2d" $PWD/.TODO;;
      "-g") if [ -z "$2" ]
            then cat -b ~/.TODO 2> /dev/null;
            else echo "$*" | sed "s/-g //" >> ~/.TODO
            fi;;
      *) echo "$*" >> .TODO;;
    esac
  fi
}

todo
