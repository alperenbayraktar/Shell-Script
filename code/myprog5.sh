opR="-R"
dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
rFlag=0

findFile()
{
    if [ $1 == 1 ]
        then
        find $2 -type f -size 0 -exec rm -i {} \;
    else
        for file in $2/* -maxdepth 1
        do            
            if [ -f "${file}" -a ! -s "${file}" ]
                then  
                rm -i $file
            fi
        done    
    fi
}

if [ $# -gt 2 ] #if there are more than 2 arguments.
    then
    echo There are more than 2 arguments.
elif [ $# -eq 0 ] #if there are no arguments.
    then
    echo There are no arguments.
    findFile 0 $dir
else
    if [ -z $2 ]    #if $2 is null
        then
        #echo There is 1 argument.
        if [ -d $1 ]    #if the argument was a directory instead of -R
            then
            #echo Argument is a directory.
            findFile 0 $1  
        elif [ $1 == $opR ] #if the argument was -R instead of directory
            then
            #echo Argument is -R.
            findFile 1 $dir
        else    #if not both
            echo Argument is invalid.
        fi    
    else    #if there are 2 arguments
        #echo There are 2 arguments.
        if [ $1 == $opR -o $2 == $opR ] #if one of the arguments were -R
            then
            if [ -d $1 -o -d $2 ]   #if the other one is a directory
            then
                #echo There are 2 correct arguments. 
                if [ -d $1 ]
                    then
                    findFile 1 $1  
                else
                    findFile 1 $2  
                fi
            else 
                echo "no directory found"
            fi
        else 
            echo "no -R argument or directory found"
        fi        
    fi
fi


