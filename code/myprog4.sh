
dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)


changeFunc()
{    
    for file in $2/*.txt -maxdepth 1 #searches through the directory given
    do
        if [ -f "${file}" ] #if file found
        then
        txt=`cat $file`
        read -a strarr <<< $txt #dumping txt words to a string arrary word by word
        for (( n=0; n < ${#strarr[*]}; n++))
        do
            case  ${strarr[n]}  in $1) #search through the array of words for our words
                    upper="$(echo ${strarr[n]} | tr '[a-z]' '[A-Z]')" #makes the word uppercase
                    sed -i "s/${strarr[n]}\b/$upper/g" $file #replaces the word
                    echo -e "The word '${strarr[n]}' inside '$file' is substituted with '$upper'.\n";;
                *) ;;
            esac
        done
        fi
    done
    upper=""
}

if [ $# -gt 2 ] #if there are more than 2 arguments.
    then
    echo "There are more than 2 arguments."
elif [ $# -eq 0 ] #if there are no arguments.
    then
    echo "There are no arguments. You need to give atleast one argument."
else
    if [ -z $2 ]    #if $2 is null
        then
        #echo There is 1 argument.
        if [ -d $1 ]    #if the argument was a directory instead of search word
            then
            echo "Argument is a directory. If given one argument it must be the search word."
        elif [ ! -z $1 ] #if the argument was a search word instead of directory
            then
            #echo "Argument is being searched"
            changeFunc $1 $dir
        else    #if not both
            echo "Argument is invalid."
        fi    
    else    #if there are 2 arguments
        #echo "There are 2 arguments."
        if [ ! -z $1 -o ! -z $2 ] #if one of the arguments were not null  ?
            then
            if [ -d $1 -o -d $2 ]   #if the other one is a directory
            then
                #echo "There are 2 correct arguments. "
                if [ -d $1 ]
                    then
                    changeFunc $2 $1  
                else
                    changeFunc $1 $2  
                fi
            else 
                echo "no directory found"
            fi
        else 
            echo "no search word argument or directory found"
        fi        
    fi
fi

