#!/bin/bash

passwordsFile="passwords.txt"
rockyouFile="rockyou2024.txt"
tempFile="checkPasswords.tmp"

deleteTempFile() {
    if [ -f $tempFile ] ; then
        rm -f $tempFile
    fi
}

if [ ! -f $rockyouFile ] ; then
    echo "To run this program you need the $rockyouFile file."
    exit 1
fi

deleteTempFile

grep -a -F -x -f $passwordsFile $rockyouFile >> "$tempFile"

if [ -s $tempFile ] ; then
    echo "Warning: Your following passwords match with the RockYou2024 list..."
    cat $tempFile
else
    echo "OK: Your passwords does not match with the RockYou2024 list."
fi

deleteTempFile

exit 0
