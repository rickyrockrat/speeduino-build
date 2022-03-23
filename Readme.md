#### Build Speeduino for the Mega2560 without the garbage

## speeduino-build
This is to build the speeduino as quick and dirty as possible on Linux. <rant>
For some reason the Arduino project and PlatformIO feel the need to re-invent the wheel. Again.
Why do software developers feel the need to create terribly complicated build systems and environments?
</rant>
This makefile accomplishes what 50 billion lines of code accomplish without the bloat.

I'm not alone in my ranting:
[Hackaday Arduino comments](https://hackaday.com/2015/07/28/embed-with-elliot-there-is-no-arduino-language)

## Dependencies
gcc-avr, avr-libc, make, grep, sed, tr, ls, and git.

apt-get install util-linux make git gcc-avr avr-libc

For Alpine: apk add util-linux make git avrdude avr-libc gcc-avr

avrdude is recommended for downloading, and if the boot loader is running on the mega2650, 
you use the stk500v2 programmer. For ISP, choose the programmer for your ISP.

The Makefile.speeduino has some AVRdude things in it.

## Instructions
Here are the guidelines to building this without PlatformIO, without Python and Without Arduino IDE.

  * git clone https://github.com/rickyrockrat/speeduino-build
  * cd speeduino-build
  * make
  * make upload

Wow, that was hard. I just replaced a billion lines of code with a make file.

The caveat is that I haven't fully tested the binary.  The upload does work if you have avrdude installed.
It does connect to tunerstudio, and once I set the board under Settings->Engine constants to the UA4C, all the inputs respond as I expect.

Too simple for you? I thought so. You too can follow the directions below for a real challenge! It's fun surfing through pages and pages of instructions and steps.

## Arduino IDE
 * [Getting Started](https://www.arduino.cc/en/Guide)
 * [Install](http://docs.arduino.cc/software/ide-v1/tutorials/Linux)
 * [Getting Stared IDE](https://create.arduino.cc/projecthub/Arduino_Genuino/getting-started-with-arduino-web-editor-on-various-platforms-4b3e4a)

Lost yet? Try Platform IO. It's fun. It's free!! What could possibly go wrong??

## Platform IO
 * [Platform IO](https://platformio.org/platformio-ide) 
 * [Dowload EE VS](https://code.visualstudio.com)
 * [Magically Add PlatformIO](https://platformio.org/install/ide?install=vscode)
 * [Configure](https://docs.platformio.org/en/latest/frameworks/arduino.html)

MiniCore, MegaCore, MightyCore... I just want a atmega2560. Which is it?


## References
* [Speduino Source](https://github.com/noisymime/speeduino)
* [Speduino Wiki](https://wiki.speeduino.com)
* [Sketch Tunes](https://arduino.github.io/arduino-cli/0.21/sketch-build-process)
* [Arduino Main](https://github.com/arduino)
* [Arduino Core (AVR)](https://github.com/arduino/ArduinoCore-avr)
* [Time Library](https://github.com/PaulStoffregen/Time)
* [PlatformIO clues](https://github.com/platformio/platform-atmelavr/blob/develop/platform.json) 

