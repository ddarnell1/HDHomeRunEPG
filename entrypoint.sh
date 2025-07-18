#!/bin/sh

while :
do
	DATE=$(date)
	eval python /app/HDHomeRunEPG_To_XmlTv.py "$OPT_ARGS"
	echo "Last run time: $DATE"
	echo "Will run in $SLEEPTIME seconds"
	sleep "$SLEEPTIME"
done
