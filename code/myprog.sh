int='^[0-9]+$' #integer definition

while
    echo -e "\nPlease select an option:\n\n1. Check for palindromes\n2. Move .c files\n3. Draw hollowed square\n4. Uppercase conversion\n5. Delete files\n6. Exit\n"
    read x
    if [ ! -z "$x" ] #if the input is not null
    then
        if [[ $x =~ $int ]] #if the input is an integer
        then
            if [ $x -gt 0 -a $x -lt 7 ] #if the input is between 1-6
            then
                if [ $x -eq 1 ]
                then
                    echo -e "You chose 1. Enter one argument\n"
                    read  argument
                    ./myprog1.sh $argument 
                elif [ $x -eq 2 ]
                then
                    echo -e "You chose 2. Enter one argument\n"
                    read -a arguments
                    ./myprog2.sh ${arguments[0]} ${arguments[1]} ${arguments[2]} 
                elif [ $x -eq 3 ]
                then
                    echo -e "You chose 3. Enter two arguments\n"
                    read -a arguments
                    ./myprog3.sh ${arguments[0]} ${arguments[1]} ${arguments[2]} 
                elif [ $x -eq 4 ]
                then
                    echo -e "You chose 4. Enter two arguments\n"
                    read -a arguments
                    ./myprog4.sh ${arguments[0]} ${arguments[1]} ${arguments[2]} 
                elif [ $x -eq 5 ]
                then
                    echo -e "You chose 5. Enter two arguments\n"
                    read -a arguments
                    ./myprog5.sh ${arguments[0]} ${arguments[1]} ${arguments[2]} 
                elif [ $x -eq 6 ]
                then
                    echo "Goodbye."
                    break                    
                fi
            else
                echo -e "\nError: You have to choose a number between 1 and 6."
            fi
        else
            echo -e "\nError: You didn't choose a number."
        fi        
    else 
        echo -e "\nError: You didn't choose a number."
    fi
do :;  done