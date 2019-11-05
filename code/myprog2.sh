#!/bin/bash
dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
#echo $dir
err="There exists no .c file"
x=0
for file in $dir/*.c -maxdepth 1
do
        if [ -f "${file}" ]
        then
        x=1 
        break   
        fi
done
#echo $x
if [ $x -eq 1 ]         
        then
                #echo c var
                if [ -z "$1" ]
                then
                        #echo "\$1 is NULL"
                        if [ -d "cprogs" ]
                                then
                                        echo cprogs under the current directory already exists, .c files are moved there.
                                else
                                        mkdir cprogs
                                        echo A directory named cprogs is created under current working directory.
                        fi                        
                        mv *.c* $dir/cprogs #if there are a .c files with the same name in cprogs, it changes them with the outer ones.
                        echo All the files whose name ends with .c in the current working directory are moved into cprogs directory.
                else
                        if [ -d $1 ]
                                then
                                        #echo "\$1 is NOT NULL"
                                        mkdir $1/cprogs
                                        echo A directory named cprogs is created under $1
                                        mv *.c* $1/cprogs
                                        echo All the files whose name ends with .c in $1 are moved into cprogs directory.
                                else
                                        echo There is no directory named $1
                        fi
                        
                fi
        else
                echo $err
fi