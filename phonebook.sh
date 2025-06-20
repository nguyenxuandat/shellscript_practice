#!/bin/bash

PHONEBOOK_ENTRIES="bash_phonebook_entries"


if [ "$#" -lt 1 ]; then
    exit 1

elif [ "$1" = "new" ]; then
   echo "$2 $3" >> $PHONEBOOK_ENTRIES 

elif [ "$1" = "list" ]; then
    if [ ! -e $PHONEBOOK_ENTRIES ] || [ ! -s $PHONEBOOK_ENTRIES ]; then
        echo "phonebook is empty"
    else
	cat $PHONEBOOK_ENTRIES
    fi

elif [ "$1" = "lookup" ]; then
    grep "$2" $PHONEBOOK_ENTRIES

elif [ "$1" = "remove" ]; then
    # YOUR CODE HERE #
    temp=$(grep "$2" "$PHONEBOOK_ENTRIES") 
    sed -i "s/$temp//g" $PHONEBOOK_ENTRIES

elif [ "$1" = "clear" ]; then
    rm $PHONEBOOK_ENTRIES

else
     echo "command not found"
fi
