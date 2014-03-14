#include <avr/io.h>

; BEGIN CONSTANTS

; END CONSTANTS

    .section .bss
; BEGIN GLOBALS

; END GLOBALS

    .section .text
; BEGIN PROGRAM CONSTANTS

; END PROGRAM CONSTANTS

    .align 2
    .global main
main:
; BEGIN MAIN PROGRAM

loop:

    rjmp    loop

; END MAIN PROGRAM
    .global __vector_default
__vector_default:
    reti
    .end
