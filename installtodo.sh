#!/bin/bash
if [ ! -e ~/.TODO ]
then
  touch ~/.TODO
  echo -e "# Ajouté par le script todo\ntodo" >> ~/.bashrc
  echo -e "# Ajouté par le script todo" >> ~/.bash_aliases
  cat todo >> ~/.bash_aliases
fi
