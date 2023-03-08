# 1 "/root/arduino_sketches/wordclock_arduino/wordclock_arduino.ino"
# 1 "/root/arduino_sketches/wordclock_arduino/wordclock_arduino.ino"
// What sould be included
# 3 "/root/arduino_sketches/wordclock_arduino/wordclock_arduino.ino" 2

//Defining stuff for the LED library


CRGB leds[256 /*How many LEDs are in the array*/]; //initialize the LED array


void setup() {
//Debug Info
Serial.begin(57600);
Serial.println("[INFO] Worldclock is booting...");

FastLED.addLeds<NEOPIXEL, 6 /*PWM Pin to use with the LEDs*/>(leds, 256 /*How many LEDs are in the array*/);

//Initialize the LEDs and show some animation
Serial.println("[INFO] 1. Checking LEDs...");
//startup_procedure();
}

void loop()
{
Serial.println("Clock Running");
int hours[] = {58,59,60,61};
for (int i = 0; i < 4; i++){
leds[hours[i]] = CHSV( 252,255,100);
}
int minutes[] = {240,241,243,244,91,92,93,94,232,231,230};
for (int i = 0; i < 11; i++){
leds[minutes[i]] = CHSV( 252,255,100);
}
FastLED.show();
delay(6000);
//FastLED.clear();
//DESC_HERE
//delay(1000);
//FastLED.clear();
//TEMP_HERE
//delay(1000);
//FastLED.clear();
}

void startup_procedure(){
for (int i = 0; i < 256 /*How many LEDs are in the array*/ ; i++){
leds[i] = CHSV( 161, 255, 150);
FastLED.show();
delay(1);
leds[i] = CHSV( 0, 0, 0);
FastLED.show();
}
}
