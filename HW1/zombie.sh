#!/bin/bash 




copy_zombie(){
    touch zombie.sh
    cp e5.sh zombie.sh
    chmod +x zombie.sh
    ./zombie.sh
}

trap "echo You typed Ctrl-C; copy_zombie" 2 # Signal 2 is Ctrl-C 

while [ 1 ]
do 
    echo I am in a zombie
    sleep 5 
done