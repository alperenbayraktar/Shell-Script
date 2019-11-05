upper="$(echo $1 | tr '[a-z]' '[A-Z]')" #makes the word uppercase
strlen=${#upper}
dec=`expr $strlen - 1`
echo $1

int='^[0-9a-zA-Z]+$'

counter=0
divlen=`expr $strlen / 2` #storing the middle.
for ((i=0; i<divlen; i++))
    do
    let1=${upper:$i:1} #first letter than second...
    let2=${upper:$dec:1} #first letter from the end then second...
    if  [[ $let1 =~ $int ]] && ! [[ $let2 =~ $int ]] || ! [[ $let1 =~ $int ]] && [[ $let2 =~ $int ]]
        then
        echo "$let1 , $let2 "
        break
    fi
    if [[ $let1 = $let2 ]]
    then
        #echo $let1 $let2
        counter=`expr $counter + 1`
        dec=`expr $dec - 1`
    fi
    done
if [ $counter -eq $divlen ] #if the same letter count is equal to half word length
then
    echo $1 is palindrome
else
    echo $1 is not a palindrome
fi