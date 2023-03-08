#!/bin/bash

tty=/dev/ttyUSB0

stty -F $tty cs8 115200 ignbrk -brkint -icrnl -imaxbel -opost -onlcr -isig -icanon -iexten -echo -echoe -echok -echoctl -echoke noflsh -ixon -crtscts -hupcl
#stty -F $tty cs8 9600 ignbrk -brkint -icrnl -imaxbel -opost -onlcr -isig -icanon -iexten -echo -echoe -echok -echoctl -echoke noflsh -ixon -crtscts
sleep 3
echo -n "Hello World"  >$tty
read reply <$tty
echo "$reply"
stty -F $tty hupcl
