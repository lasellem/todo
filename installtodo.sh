#!/bin/bash

if [ ! -f ~/.TODO ]; then
  touch ~/.TODO
  echo -e "\n# Ajouté par le script todo" >> ~/.bashrc
  echo "todo; echo -e \"\n\"" >> ~/.bashrc
fi

mkdir -p ~/bin

if [ "$1" == "-f" ] || [ "$2" == "-f" ]; then
  rm ~/bin/todo
fi

if [ -f ~/bin/todo ]; then
  echo "Erreur : un fichier ~/bin/todo existe déjà !"
  exit 1
fi

if [ "$1" == "-l" ] || [ "$2" == "-l" ]; then
  chmod 0744 $PWD/todo.sh
  ln -s $PWD/todo.sh ~/bin/todo
else
  cat todo.sh >> ~/bin/todo
  chmod 0744 ~/bin/todo
fi
