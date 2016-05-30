#!/bin/bash
DIR="/opt/odoo"
#Find all ascii files 
FILES="ascii.txt"
#`find $DIR -type f -print0 | xargs -0r file | grep 'ASCII' | awk -F: '{print $1}'`
#path to translations file
TRANSLATIONS="terms.txt"

#main loop
#COUNTER=0
while read TRANSLATE # in `cat $TRANSLATIONS`
do
#	let "COUNTER++"
	echo "Parsing line : $TRANSLATE"
#	echo $COUNTER
	ORGTERM=`echo $TRANSLATE | awk -F= '{print $1}'`
	REPTERM=`echo $TRANSLATE | awk -F= '{print $2}'`
	#Set terms
	#$TRF
	#$TRT
	echo "Original term is: $ORGTERM"
	echo "New term is: $REPTERM"

	for FILE in `cat $FILES`
	do
		echo "Testing file: $FILE"
		LINE=`grep "$ORGTERM" $FILE`
		if [ "$LINE" != ""   ]
		then
			echo "Term: $ORGTERM found in file:  $FILE, changing to term: $REPTERM:"
			sed "s;$ORGTERM;$REPTERM;g" $FILE
			echo "$FILE:$ORGTERM:$REPTERM" >> ascii.log
		fi
	done
echo "loop done"
done < $TRANSLATIONS
