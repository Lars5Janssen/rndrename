#!/usr/bin/bash
sourceFolder=$1
fileCount=$(ls $sourceFolder -l | grep -v ^d | wc -l)

for (( i = 1 ; i < $fileCount ; i++ )); do 

fileToMove=$(ls $sourceFolder |sort -R | tail -1)
echo $fileToMove

done
