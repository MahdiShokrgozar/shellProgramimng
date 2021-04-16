#!/bin/bash

echo Hello, enter your username:
read -p 'username:' name
DIR="/home"
if [ -d "$DIR/$name" ]; then
  ### Take action if $DIR exists ###
  echo "${name} is exist! good luck :-)"
else
  ###  Control will jump here if $DIR does NOT exists ###
  echo "Error: unfortunately ${name} not found!:-|"
fi
echo It\'s nice to meet you $name 