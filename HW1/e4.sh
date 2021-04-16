
#!/bin/bash
#Prompt user to insert inputs (one at a time) 
read -p 'Enter Number 1: ' a
read -p 'Enter Number 2: ' b

# checking that a and b are integer and positive
if ! [ $a -gt 0 ] || ! [ $b -gt 0 ] 
    then
        echo "Inputs must be a positive integer"
		exit 0
fi
# Assigning the value of a to m
m=$a

# checking if b greater than m
# If yes the replace the value of m assign a new value
if [ $b -lt $m ]
then
m=$b
fi

# In do while loop we are checking the gcd
while [ $m -ne 0 ]
do
x=`expr $a % $m`
y=`expr $b % $m`

# If x and y both are 0 then we complete over
# process and we print the gcd
if [ $x -eq 0 -a $y -eq 0 ]
then

# Printing the greatest gcd of two given number
echo gcd of $a and $b is $m
break
fi
m=`expr $m - 1`

done
