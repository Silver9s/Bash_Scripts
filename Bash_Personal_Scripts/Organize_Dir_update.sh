#!bin/bash

#Purpose of this part of the script is to make a range 
#of directories from A-Z and one for numbers '#' 

#Make dir list: 

mkdir {A..Z}
mkdir '#'

sleep 1
#Move all files of a specific range into its respective folder
#there must be a way to simplify this proccess but I don't know it

#Move command: 

move_files() {
    for letter in {A..Z} {a..z}; do
        mv -f ${letter}* ${letter}/
    done
}

move_files

sleep 1

#We don't move any Numbers into the '#'' directory as some 
#files may start with numbers due to the way it was named by 
#the origional owner.

#Make a list text:

touch .list | ls */ > .list

sleep 1

##we name it .list instead of list or List so
#as to not have it be part of the  get moved into a directory
#by the move command 

exit 0