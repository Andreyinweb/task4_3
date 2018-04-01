#!/bin/bash

MAX_NUM=50
# /tmp/backups/ 
WAY_FILE="/home/stariy/andrey/DevOps/ZZZZ"

str_argv=$*
end_argv=${!#}
num_argv=$#
argv=$( echo $str_argv | sed 's/\w*$//' | sed 's/.$//')

# Exists file
if ! [ -e "$argv" ] ; then
    echo "Error: task4_3: No folder $argv
Use:   task4_3.sh [folder] [number back-up]" >&2
    exit 1
fi
# Number or Not Number
if (echo "$end_argv" | grep -E -q "^?[0-9]+$"); then
    # Number
    if [ $end_argv -gt $MAX_NUM ] ; then
        echo "Error: task4_3: Big number $end_argv
Use less than $MAX_NUM" >&2
    exit 2
    fi
    # The number equals null
    if [ $end_argv -le 0 ] ; then
        echo "Error: task4_3: The number equals null $end_argv
Use from 1 to $MAX_NUM" >&2
    exit 3
    fi
# Not Number
else
    echo "Error: task4_3: Not Number $end_argv
Use:   task4_3.sh [folder] [number back-up]" >&2
exit 4
fi
name_back="$( echo "$argv" | cut -c 2- | tr  '/' '-' )"      # | tr  ':' '-' 
name_date="$name_back+_-$( date -Iseconds | tr  ':' '%' )"
name_full="$name_date.tar.gz"

cuunt_file=$(find "$WAY_FILE" -type f -name "$name_back*" | wc -l)

if [ $cuunt_file -le $end_argv ] ; then
    tar -cvzf "$name_full" "$argv" && mv "$name_full" "$WAY_FILE"

else
    sort

    echo "name_back= $name_back "
    echo "name_date= $name_date "
    echo "name_full= $name_full "
fi



echo "______________END________________________"