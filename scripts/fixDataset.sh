#!/bin/bash

# Appropriate variables describing the dataset paths
dataset='../../../../Dataset/';
path1='./complete_dataset/';

# The first argument is the path where all the images after augmentation are stored
# The second argument is the path where the dataset will be distributed in class folders
dataset=$1
path1=$2

#path2='../../'
#literalNegativeClass='not_'

# Here are the suffices of the dataset images after augmentation
suffix1='.jpg'
suffix2='_02A.jpg'
suffix3='_02B.jpg'

echo ">>> This is the script for distributing the dataset images (after augmentation)"
echo "    to their respective class folder"

echo

DONE=false
until $DONE; do
	printf ">>> Please give the name of each class you want its images to be distributed\n    to their folders. To exit press Ctlr+D: "
	
	read || DONE=true
	if [ ! $REPLY = EOF ]; then
		echo
		echo ">>> Images belonging to class $REPLY were distributed successfully"
		echo

		prefixPositiveClass=$path1$REPLY/$REPLY

		if [ ! -d "$$path1$REPLY" ]; then
			mkdir -p $$path1$REPLY
		fi

		if [ ! -d "$prefixPositiveClass" ]; then
			mkdir -p $prefixPositiveClass
		fi

		cd $prefixPositiveClass
		for f in *.wav; do
			f1=${f%.wav}
			jpg1=$dataset$f1$suffix1;
			jpg2=$dataset$f1$suffix2;
			jpg3=$dataset$f1$suffix3;
			echo $jpg1
			echo $jpg2
			echo $jpg3
			#cp $jpg1 $f$suffix1
			#cp $jpg2 $f$suffix2
			#cp $jpg3 $f$suffix3
		done

		prefixNegativeClass=$path2$REPLY/$literalNegativeClass$REPLY

		if [ ! -d "$prefixNegativeClass" ]; then
			mkdir -p $prefixNegativeClass
		fi
		
		cd $prefixNegativeClass
		for f in *.wav; do
			f1=${f%.wav}
			jpg1=$dataset$f1$suffix1;
			jpg2=$dataset$f1$suffix2;
			jpg3=$dataset$f1$suffix3;
			echo $jpg1
			echo $jpg2
			echo $jpg3
			#cp $jpg1 $f$suffix1
			#cp $jpg2 $f$suffix2
			#cp $jpg3 $f$suffix3
		done
	fi
done
echo

#!/bin/bash
