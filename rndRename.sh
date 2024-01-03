#!/usr/bin/bash
echo "Creating temporary folder and initializing variabels and paths"
cd $1
sourceFolder=$(pwd)
cd ..
mkdir tempDestinationForRNDRename
cd tempDestinationForRNDRename
destFolder=$(pwd)
cd $sourceFolder


fileCount=$(ls $sourceFolder -l | grep -v ^d | wc -l)
fileCountSize=${#fileCount}

echo "Starting move and rename to temporary folder"
for (( i = 1 ; i < $fileCount ; i++ )); do 

	newFNBeforeEx=$i
	newFNSize=${#newFNBeforeEx}
	zeroPadDiff=$(($fileCountSize-$newFNSize))

	for ((n=0;n<$zeroPadDiff;n++)); do
		newFNBeforeEx="0${newFNBeforeEx}"
	done

	fileToMove=$(ls $sourceFolder |sort -R | tail -1)
	extension="${fileToMove##*.}"

	mv $sourceFolder/$fileToMove $destFolder/$newFNBeforeEx.$extension
done

echo "Moveing files back from temporary folder into source folder"
mv $destFolder/* $sourceFolder/

echo "Deleting temporary Folder"
rm -rf $destFolder

echo "All "$fileCount"files renamed!"
