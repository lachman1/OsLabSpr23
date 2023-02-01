echo "Enter Num1 is :" $1
echo "Enter Num2 is :" $2
echo "Enter Num3 is : "$3
if [ $1 -lt $2 ] && [ $1 -lt $3 ]
then
    echo $1
elif [ $2 -lt $1 ] && [ $2 -lt $3 ]
then
    echo $2
else
    echo $3
fi
