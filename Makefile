# avr_spi library Makefile

PROJ =		avr_spi
SAMPLES	=	single_byte

include vars.mk

# Default target
all:  $(SAMPLES)

$(SAMPLES): $(LIB) lst text eeprom
	$(MAKE) -C samples/$@

include recipies.mk
