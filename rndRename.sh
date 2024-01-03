#!/usr/bin/bash
cd $1
sourceFolder=$(pwd)
cd ..
mkdir tempDestinationForRNDRename
cd tempDestinationForRNDRename
destFolder=$(pwd)
cd $sourceFolder

fileCount=$(ls $sourceFolder -l | grep -v ^d | wc -l)

for (( i = 1 ; i < $fileCount ; i++ )); do 
fileToMove=$(ls $sourceFolder |sort -R | tail -1)
mv $sourceFolder/$fileToMove $destFolder/$i
done

mv $destFolder/* $sourceFolder/

rm -rf $destFolder
