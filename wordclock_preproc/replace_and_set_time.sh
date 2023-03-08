#!/bin/bash

echo "replacing wordclock_arduino.ino and setting time"

#copying and replacing
cp wordclock_arduino_master.ino /root/arduino_sketches/wordclock_arduino/wordclock_arduino.ino

#set timezone for script
export TZ=Europe/Berlin

#define time variables
hours=`date +%H`
minutes=`date +%M`
seconds=`date +%S`
day=`date +%d`
month=`date +%m`
year=`date +%Y`
zone=`date +%Z`

## debug
#minutes=2
hours=16

for minutes in {1..29} ; do

color=$( shuf -i 0-255 -n 1)

timestamp="${hours}_${minutes}"

echo "The current time stamp in hours_minutes is $timestamp"

if [ $hours -eq 0 ] ; then
	echo "It is witching hour"
	hour=12
elif [ $hours -le 12 ] && [ $hours -gt 0 ] ; then
	echo "We have a.m."
elif [ $hours -gt 12 ] ; then
	echo "We have p.m."
	hours=$(( $hours - 12 ))
else
	echo "The server didn't give correct hours. exiting"
	exit
fi

if [ $(( $minutes + 1 )) -le 30 ] ; then
	echo "Using Minutes from hour"
	minutes_next=$(( $minutes + 1 ))
	hours_next=$hours
elif [ $(( $minutes + 1 )) -gt 30 ] && [ $(( $minutes + 1 )) -le 59 ]; then
	echo "Using Minutes to hour"
	hours_next=$(( $hours + 1 ))
	minutes_next=$(( $minutes + 1 ))
elif [ $minutes -eq 59 ] ; then
	echo "The next hour is about to dawn"
	hours_next=$(( $hours + 2 ))
	minutes_next=0
else
	echo "The minute value from the server was 60 and I couldn't handle it"
fi

echo "I am going to upload $hours_next hours and $minutes_next minutes to the clock"

minutes_text=$( cat times/minutes/$minutes_next )
#echo $minutes_text
awk -i inplace -v input="$minutes_text" 'NR == 1, /MINUTES/ { sub(/MINUTES/, input) } 1' /root/arduino_sketches/wordclock_arduino/wordclock_arduino.ino

hours_text=$( cat times/hours/$hours_next )
awk -i inplace -v input="$hours_text" 'NR == 1, /HOURS/ { sub(/HOURS/, input) } 1' /root/arduino_sketches/wordclock_arduino/wordclock_arduino.ino

echo "I chose the color value $color for the current time"
sed -i "s|COLOR|$color|g" /root/arduino_sketches/wordclock_arduino/wordclock_arduino.ino

sleep 5s

#bash /root/arduino_sketches/wordclock_arduino/compile.sh
bash /root/arduino_sketches/wordclock_arduino/compile_and_upload.sh
wait
sleep 20s
wait
done