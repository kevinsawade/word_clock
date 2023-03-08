#!/bin/bash

while read file name leds length ; do
echo "$file $name $leds $length"
#echo -n "int minutes[] = {"
#echo -n $leds
#echo -e "};"
#echo -n "for (int i = 0; i < "
#echo -n $length
#echo -e "; i++){"
#echo -e "leds[minutes[i]] = CHSV( COLOR,255,100);"
#echo -e "}"
done < minutes.txt
	