# AVR assembler Makefile variables
# Originated from AVR-Libc sample projects page
# http://www.nongnu.org/avr-libc/examples/demo/Makefile

DEV_DIR = /home/allen/Development/avr

OBJ =		$(PROJ).o
LIB =		lib$(PROJ).a

OPTIMIZE =
DEFS =
LIBS +=		-l$(DEV_DIR)/avr_lcd,-Lavr_lcd

RESIDUE =	*.o \
		*.a \
		*.eps \
		*.png \
		*.pdf \
		*.bak \
		*.lst \
		*.map \
		*.hex \
		*.bin \
		*.srec

MCU_TARGET =	atmega328p
SIM_TARGET =	atmega328

CC =		avr-gcc
AR =		avr-ar
OBJCOPY =	avr-objcopy
OBJDUMP =	avr-objdump

# Override is only needed by avr-lib build system.
override CFLAGS =	-Wall $(OPTIMIZE) $(DEFS)
ifdef SIM
override CFLAGS +=	-mmcu=$(SIM_TARGET)
else
override CFLAGS +=	-mmcu=$(MCU_TARGET)
endif

override LDFLAGS       = -Wl,-Map,$(PROJ).map,$(LIBS)
ASFLAGS = -Wa,-mno-wrap,--gstabs,-alms=$(PROJ).lst

FIG2DEV =	fig2dev
