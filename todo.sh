#!/bin/bash

if [ $# == 0 ]
then
  if [ -s $PWD/.TODO ]
  then
    DIR=$(dirname "$(readlink -f "$0")")
    bash $DIR/colored.sh $PWD/.TODO 2> /dev/null
  fi
else
  case "$1" in
    "-r")
      sed -i "$2d" $PWD/.TODO
      ;;
    "-g")
      if [ -z "$2" ]; then
        DIR=$(dirname "$(readlink -f "$0")")
        bash $DIR/colored.sh ~/.TODO 2> /dev/null
      else
        case "$2" in
        "-F") 
          echo "$*" | sed "s/-g /Lucie/" | sed "s/-F /4 /" >> ~/.TODO
        ;;
        "-f") 
          echo "$*" | sed "s/-g //" | sed "s/-f /3 /" >> ~/.TODO
          ;;
        "-i") 
          echo "$*" | sed "s/-g //" | sed "s/-i /1 /" >> ~/.TODO
          ;;
        "-I") 
          echo "$*" | sed "s/-g //" | sed "s/-I /0 /" >> ~/.TODO
          ;;
        *)
          echo "2 $*" | sed "s/-g //" >> ~/.TODO
          ;;
        esac
      fi
      ;;
    "-F") 
      echo "$*" | sed "s/-F /4 /" >> .TODO
      ;;
    "-f") 
      echo "$*" | sed "s/-f /3 /" >> .TODO
      ;;
    "-i") 
      echo "$*" | sed "s/-i /1 /" >> .TODO
      ;;
    "-I") 
      echo "$*" | sed "s/-I /0 /" >> .TODO
      ;;
    "-gF") 
      echo "$*" | sed "s/-gF /4 /" >> ~/.TODO
      ;;
    "-gf") 
      echo "$*" | sed "s/-gf /3 /" >> ~/.TODO
      ;;
    "-gi") 
      echo "$*" | sed "s/-gi /1 /" >> ~/.TODO
      ;;
    "-gI") 
      echo "$*" | sed "s/-gI /0 /" >> ~/.TODO
      ;;
    *)
      echo "2 $*" >> .TODO
      ;;
  esac
fi
