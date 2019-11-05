 ms=""
if [ -z $2 ]
    then
        echo "One or both of the arguments were null or there was a third argument."
    else
        check=`expr $1 - $2`
        check=`expr $check % 2`
        #echo $check
        half=`expr $1 - $2`
        half=`expr $half / 2`
        #echo $half
        if [ $1 -gt $2 -a $check -eq 0 ]
            then  
                for((i=0; i<half; i++))
                    do
                        for((j=0; j<$1; j++))
                            do
                                ms="${ms}*"
                            done
                        echo "${ms}"
                        ms=""
                    done
                for((i=0; i<half; i++))
                            do                        
                                ms="${ms}*"
                            done
                        for((i=0; i<$2; i++))
                            do                        
                                ms="${ms} "
                            done
                        for((i=0; i<half; i++))
                            do                        
                                ms="${ms}*"
                            done
                for((i=0; i<$2; i++))
                    do  
                        echo "${ms}"                        
                    done 
                ms=""      
                for((i=0; i<half; i++))
                    do
                        for((j=0; j<$1; j++))
                            do
                                ms="${ms}*"
                            done
                        echo "${ms}"
                        ms=""
                    done         
            else
                echo "Requirements weren't met;"
                echo "1-The first argument was equal or lower than the second one, the program didn't execute."
                echo "2-The difference between arguments was not an even number."
        fi
fi
