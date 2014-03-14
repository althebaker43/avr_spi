; avr_spi.S
;
;  Created: 3/14/2014
;   Author: Allen Baker

#include <avr/io.h>

; BEGIN CONSTANTS

; END CONSTANTS

    .section .data
; BEGIN GLOBALS

; Name: spi_config
; Descr: Copy of the SPI Configuration Register (SPCR)
    .global spi_config
spi_config:
    .byte   0x00

; Name: spi_timeout
; Descr: Time-out value for SPI operations
    .global spi_timeout
spi_timeout:
    .byte   0x00

; Name: spi_data_available
; Descr: Indicates if new data is available from SPI
    .global spi_new_data
spi_data_available:
    .byte   0x00

; Name: spi_read_addr
; Descr: Address of data read from SPI
    .global spi_read_addr
spi_read_addr:
    .byte   0x00

; Name: spi_read_size
; Descr: Size of data read from SPI
    .global spi_read_size
spi_read_size:
    .byte   0x00

; Name: spi_write_addr
; Descr: Address of data to write to SPI
    .global spi_write_addr
spi_write_addr:
    .byte   0x00

; Name: spi_write_size
; Descr: Size of data to write to SPI
    .global spi_write_size
spi_write_size:
    .byte   0x00

; END GLOBALS

    .section .text
; BEGIN PROGRAM CONSTANTS

; END PROGRAM CONSTANTS

; BEGIN PUBLIC FUNCTIONS

; Name: SPI_Init
; Descr: Initializes the SPI
    .align 2
    .global SPI_Init
SPI_Init:
    
    ret ; Return from SPI_Init


; Name: SPI_Read_Byte
; Descr: Reads a byte from the SPI
    .align 2
    .global SPI_Read_Byte
SPI_Read_Byte:

    ret ; Return from SPI_Read_Byte


; Name: SPI_Write_Byte
; Descr: Writes a byte to the SPI
    .align 2
    .global SPI_Write_Byte
SPI_Write_Byte:

    ret ; Return from SPI_Write_Byte

; END GLOBAL FUNCTIONS

; BEGIN PRIVATE FUNCTIONS

; Name: Exec_Transfer
; Descr: Executes a SPI transfer (write and read one byte)
Exec_Transfer:

    ret ; Return from Exec_Transfer

; END PRIVATE FUNCTIONS
    .end
