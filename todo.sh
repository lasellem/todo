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
        "-ff") 
          echo "$*" | sed "s/-g //" | sed "s/-F /0 /" >> ~/.TODO
        ;;
        "-f") 
          echo "$*" | sed "s/-g //" | sed "s/-f /1 /" >> ~/.TODO
          ;;
        "-i") 
          echo "$*" | sed "s/-g //" | sed "s/-i /3 /" >> ~/.TODO
          ;;
        "-ii") 
          echo "$*" | sed "s/-g //" | sed "s/-I /4 /" >> ~/.TODO
          ;;
        *)
          echo "2 $*" | sed "s/-g //" >> ~/.TODO
          ;;
        esac
      fi
      ;;
    "-F") 
      echo "$*" | sed "s/-F /0 /" >> .TODO
      ;;
    "-f") 
      echo "$*" | sed "s/-f /1 /" >> .TODO
      ;;
    "-i") 
      echo "$*" | sed "s/-i /3 /" >> .TODO
      ;;
    "-I") 
      echo "$*" | sed "s/-I /4 /" >> .TODO
      ;;
    "-gF") 
      echo "$*" | sed "s/-gF /0 /" >> ~/.TODO
      ;;
    "-gf") 
      echo "$*" | sed "s/-gf /1 /" >> ~/.TODO
      ;;
    "-gi") 
      echo "$*" | sed "s/-gi /3 /" >> ~/.TODO
      ;;
    "-gI") 
      echo "$*" | sed "s/-gI /4 /" >> ~/.TODO
      ;;
    *)
      echo "2 $*" >> .TODO
      ;;
  esac
fi
