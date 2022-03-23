# Speeduino mega2560 Arduino Project source prep.
#
# RickyRockrat, Mar 2022.
#
# Download only necessary files and build
# You will need gcc-avr  and avr-libc along with
# grep,tr,sed, cat, make, etc..
#

TDIR=$(CURDIR)/clone

AVRCORE_URL=https://github.com/arduino/ArduinoCore-avr
AVRCORE_VER=1.8.3
AVRCORE_DIR=core

AVRTIME_URL=https://github.com/PaulStoffregen/Time
AVRTIME_VER=v1.6
AVRTIME_DIR=time

SPEEDY_URL=https://github.com/noisymime/speeduino
SPEEDY_VER=202202
SPEEDY_DIR=speeduino


all: speeduino.build


.SECONDARY:

AVRTIME.clone: AVRCORE.clone

$(TDIR):
	mkdir -p $@

%.clone: | $(TDIR)
	git clone --single-branch --branch $($*_VER) --depth =1 $($*_URL) $(TDIR)/$($*_DIR)
	touch $@

# Add time to the core.
speeduino.prepare: AVRTIME.clone SPEEDY.clone
	mkdir -p $(TDIR)/$(AVRCORE_DIR)/libraries/Time
	cd $(TDIR)/$(AVRCORE_DIR)/libraries/Time; ln -s $(TDIR)/$(AVRTIME_DIR) src
	cp Makefile.speeduino $(TDIR)/$(SPEEDY_DIR)/speeduino
	touch $@

speeduino.build: speeduino.prepare
	make -C $(TDIR)/$(SPEEDY_DIR)/speeduino BASE=$(TDIR) build
	touch $@
	
