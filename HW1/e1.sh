#!/bin/bash

wc(){
    /usr/bin/python3 /home/mahdi/shell_programing/HW1/wc.py $* > /tmp/temp.txt

    echo "--------------------------------------------------"
    echo -e "line    word    char    file_name"
    echo "--------------------------------------------------"


    Lines=$(cat "/tmp/temp.txt")

    i=4
    for line in $Lines
    do
        if [ $i -eq 1 ]
        then
            i=4
            printf  '%b\n' "${line}"
        
        else 
            i=$(($i - 1))
            printf "%-8s" $line
        fi
    done

    echo "--------------------------------------------------"
}
wc test_wc/a.txt test_wc/b.txt test_wc/c.txt
echo "*****************************************************************"
echo "                       sorted by size"
echo "*****************************************************************"
ls -S test_wc > /tmp/temp2.txt
sorted_files=$(cat /tmp/temp2.txt)
cd test_wc
wc ${sorted_files}

# for file in $(cat temp2.txt)
# do
#     /usr/bin/python3 /home/mahdi/shell_programing/HW1/wc.py test_wc/$file
# done