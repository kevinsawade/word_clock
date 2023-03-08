#!/bin/bash

echo "Hello"
echo "Starting up the wordclock script."

echo "checking if arduino is connected..."
if [ -a /dev/ttyUSB0 ] ; then
	echo "Arduino is connected"
else
	echo "Arduino is not connected. Exiting"
	exit
fi

echo "Starting a one day clock session..."

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

#debug stuff to check variables
echo "This machine runs in the timezone $zone"
echo "It is day $day, in Month $month in the year $year"
echo "It is $hours hours, $minutes minutes and $seconds seconds."

#while [ $day -le 22 ] ; do
for i in {1..20} ; do
	color=$( shuf -i 1-255 -n 1 )
	#define time variables
	hours=`date +%H`
	minutes=`date +%M`
	seconds=`date +%S`
	day=`date +%d`
	month=`date +%m`
	year=`date +%Y`
	zone=`date +%Z`
	echo "Checking seconds to compile new file..."
	if [ $seconds -gt 7 ] && [ $seconds -lt 20 ]; then
		echo "compiling for arduino..."
		bash replace_and_set_time.sh
		#bash get_weather_and_compile.sh
	elif [ $seconds -le 7 ] && [ $seconds -ge 0 ] ; then
		echo "uploading..."
		minutes=`date +%M`
		echo "it is $hours hours and $minutes minutes"
		bash ../wordclock_arduino/upload.sh
		sleep 5s
	else
		echo "waiting to compile..."
		sleep 1s
	fi
done