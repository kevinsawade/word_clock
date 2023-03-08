#!/bin/bash

echo "Downloading weather Data and replacing it in file"

#get weather paramters and store as variables
desc=$( python3 /root/arduino_sketches/time_and_weather/desc.py  2>&1 )
temp=$( python3 /root/arduino_sketches/time_and_weather/temp.py  2>&1 )
pres=$( python3 /root/arduino_sketches/time_and_weather/pres.py  2>&1 )
humid=$( python3 /root/arduino_sketches/time_and_weather/humid.py  2>&1 )

#if [ $temp -eq 5 ] ; then
#	echo "writing $temp degrees on clock"
#	sed -i -e '/TEMP_HERE/{r five_deg.txt' -e 'd}' /root/arduino_sketches/wordclock_arduino/wordclock_arduino.ino
#else
#	echo "Something went wrong"
#	sed -i 's/TEMP_HERE//' /root/arduino_sketches/wordclock_arduino/wordclock_arduino.ino
#	#exit
#fi

#if [ "$desc" == "clear sky"  ] ; then
#	echo "writing $desc degrees on clock"
#	sed -i -e '/DESC_HERE/{r clear_sky.txt' -e 'd}' /root/arduino_sketches/wordclock_arduino/wordclock_arduino.ino
#else
#	echo "Something went wrong"
#	#exit
#fi

#sed -i -e '/TIME_HERE/{r times/itisonepast.txt' -e 'd}' /root/arduino_sketches/wordclock_arduino/wordclock_arduino.ino

cd /root/arduino_sketches/wordclock_arduino
bash compile.sh

#get weather from openwaeathermap.org
#export api_key=3d96739d8a2d1dfe40562be3ab6466b3

#python3 weather_json.py
