#!/bin/bash

words=()
results=()
# echo Hello, enter file name:
# read -p 'file name:' fileName

echo enter word.for stop enter -1:
read -p 'word:' myWord
fileName="testFile.txt"
myWord="the"
words+=($myWord)

while [ $myWord != "-1" ]
do
    echo enter word:
    read -p 'word:' myWord
    words+=($myWord)
done
# Lines=$(cat $fileName)

# i=4
# for line in $Lines
# do
#     if [ $i -eq 1 ]
#     then
#         i=4
#         printf  '%b\n' "${line}"

#     else
#         i=$(($i - 1))
#         printf "%-8s" $line
#     fi
# done

# numOfThread=$(( "${#words[@]}" - 1 ))
# echo " threads: " $numOfThread

start=`date +%s.%N`
for i in $(seq 0 $(( "${#words[@]}" - 2 )))
do
    grep -c ${words[i]} $fileName &
done

wait
end=`date +%s.%N`

runtime=$( echo "$end - $start" | bc -l )
echo "runtime: " $runtime "microseconds"
# Lines=$(cat "temp.txt")
# echo $Lines
# for line in $Lines
# do
#     echo "found "$line" word "${words[$i]}" in file '"$fileName"'"
# done

# echo "results "$results
# for i in $(seq 0 $(( "${#results[@]}" -1 )))
# do
#     echo "found '"${results[$i]}"' words in file '"$fileName"'"
# done
