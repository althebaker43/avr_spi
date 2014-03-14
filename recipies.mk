# AVR assembler Makefile recipies
# Originated from AVR-Libc sample projects page
# http://www.nongnu.org/avr-libc/examples/demo/Makefile

$(LIB): $(OBJ)
ifdef SIM
	@echo ""
	@echo "INFO: Generating simulation files."
	@echo ""
else
	@echo ""
	@echo "INFO: Generating hardware files."
	@echo ""
endif
	avr-ar rcs $@ $^

# dependency:
$(OBJ): $(PROJ).S
	$(CC) $(CFLAGS) $(ASFLAGS) -x assembler-with-cpp -c -o $@ $^

ifdef SAMPLES
clean: clean-$(SAMPLES)
	rm -rf $(RESIDUE)
else
clean:
	rm -rf $(RESIDUE)
endif

clean-%:
	make -C samples/$* clean

lst:  $(PROJ).lst

%.lst: lib%.a
	$(OBJDUMP) -h -S $< > $@

# Rules for building the .text rom images

text: hex bin srec

hex:  $(PROJ).hex
bin:  $(PROJ).bin
srec: $(PROJ).srec

%.hex: %.o
	$(OBJCOPY) -j .text -j .data -O ihex $< $@

%.srec: %.o
	$(OBJCOPY) -j .text -j .data -O srec $< $@

%.bin: %.o
	$(OBJCOPY) -j .text -j .data -O binary $< $@

# Rules for building the .eeprom rom images

eeprom: ehex ebin esrec

ehex:  $(PROJ)_eeprom.hex
ebin:  $(PROJ)_eeprom.bin
esrec: $(PROJ)_eeprom.srec

%_eeprom.hex: %.o
	$(OBJCOPY) -j .eeprom --change-section-lma .eeprom=0 -O ihex $< $@ \
	|| { echo empty $@ not generated; exit 0; }

%_eeprom.srec: %.o
	$(OBJCOPY) -j .eeprom --change-section-lma .eeprom=0 -O srec $< $@ \
	|| { echo empty $@ not generated; exit 0; }

%_eeprom.bin: %.o
	$(OBJCOPY) -j .eeprom --change-section-lma .eeprom=0 -O binary $< $@ \
	|| { echo empty $@ not generated; exit 0; }

dox: eps png pdf

eps: $(PROJ).eps
png: $(PROJ).png
pdf: $(PROJ).pdf

%.eps: %.fig
	$(FIG2DEV) -L eps $< $@

%.pdf: %.fig
	$(FIG2DEV) -L pdf $< $@

%.png: %.fig
	$(FIG2DEV) -L png $< $@
