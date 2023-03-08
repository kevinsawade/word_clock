avrdude -C /root/avrdude.conf -v -p atmega328p -c arduino -P /dev/ttyUSB0 -b 57600 -D -U flash:w:/root/arduino_sketches/wordclock_arduino/build/wordclock_arduino.ino.hex:i
