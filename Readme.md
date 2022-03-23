#### Build Speeduino for the Mega2560 without the garbage

## speeduino-build
This is to build the speeduino as quick and dirty as possible on Linux. 
For some reason the Arduino project and PlatformIO feel the need to re-invent the wheel. Again.
Why do software developers feel the need to create terribly complicated build systems and environments?
This makefile accomplishes what 50 billion lines of code accomplish without the bloat.

I'm not alone in my ranting:
[Hackaday Arduino comments](https://hackaday.com/2015/07/28/embed-with-elliot-there-is-no-arduino-language)

## Dependencies
gcc-avr, avr-libc, make, grep, sed, tr, ls, and git.

apt-get install utils-linux make git gcc-avr avr-libc

avrdude is recommended for downloading, and if the boot loader is running on the mega2650, 
you use the stk500v2 programmer. For ISP, choose the programmer for ISP.

The Makefile.speeduino has some AVRdude things in it.

## Instructions
Here is the guidelines to building this nonsense without PlatformIO and without Python and Without Arduino IDE.
  git clone https://github.com/rickyrockrat/speeduino-build
  cd speeduino-build

  make prepare
  make

Yeah, that was hard. I just replaced a billion lines of code with a make file.

## References
* [Speduino Source](https://github.com/noisymime/speeduino)
* [Speduino Wiki](https://wiki.speeduino.com)
* [Sketch Tunes](https://arduino.github.io/arduino-cli/0.21/sketch-build-process)
* [Arduino Main](https://github.com/arduino)
* [Arduino Core (AVR)](https://github.com/arduino/ArduinoCore-avr)
* [Time Library](https://github.com/PaulStoffregen/Time)
* [PlatformIO clues](https://github.com/platformio/platform-atmelavr/blob/develop/platform.json) 

