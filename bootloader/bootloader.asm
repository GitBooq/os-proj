;******************************************
; bootloader.asm
; A Simple Bootloader
;******************************************
bits 16
%ifidn __OUTPUT_FORMAT__, "bin"
    org 0x7c00
%endif

start: jmp boot

;; constant and variable definitions
msg db "Welcome to My Operating System!", 0ah, 0dh, 0h

boot:
    cli ; no interrupts
    cld ; set string direction to forward
    
    ; set up stack and segment regs
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00


    ; clear screen
    mov ax, 0x0003
    int 10h

    ; set cursor to pos (10, 5)
    mov bh, 5   ; Y
    mov bl, 10  ; X
    call MovCursor

    ; print msg
    mov si, msg
    call Print

;; boot sector 2

    mov ax, 0x50
    
    ;; set the buffer [0x50 * 16 + 0]
    mov es, ax
    xor bx, bx

    ; read data from disk
    mov al, 2 ; read 2 sectors
    mov ch, 0 ; track 0
    mov cl, 2 ; sector to read (the second sector)
    mov dh, 0 ; head number
    mov dl, 0 ; drive number(0 is floppy)

    mov ah, 0x02 ; read sectors from disk
    int 0x13     ; call the BIOS routine
    
    jmp [500h + 18h] ; jump and exec the sector! (entry point 0x18 bytes offset)

    hlt ; halt the system

; include I/O library
%include "io.asmh"

; We have to be 512 bytes. Clear the rest of the bytes with 0

%if ($ - $$) > 510
    %error "Bootloader too large"
%endif

times 510 - ($-$$) db 0
dw 0xAA55   ; Boot Signature
