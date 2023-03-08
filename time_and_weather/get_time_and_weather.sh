#!/bin/bash

#set timezone for script
export TZ=Europe/Berlin

#define Hours etc.

Hours=`date +%H`
Minutes=`date +%M`
Day=`date +%d`
Month=`date +%m`
Year=`date +%Y`
Zone=`date +%Z`

desc=$( python3 /root/arduino_sketches/time_and_weather/desc.py  2>&1 )
temp=$( python3 /root/arduino_sketches/time_and_weather/temp.py  2>&1 )
pres=$( python3 /root/arduino_sketches/time_and_weather/pres.py  2>&1 )
humid=$( python3 /root/arduino_sketches/time_and_weather/humid.py  2>&1 )

echo "This machine runs in the timezone $Zone"
echo "It is day $Day, in Month $Month in the year $Year"
echo "It is $Hours hours and $Minutes minutes"
echo "It is $temp degree celsius, with a pressure of $pres mbar and a relative humidity of $humid persent. The description is: $desc"
