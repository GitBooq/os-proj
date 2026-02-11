/* Linker script for bootloader*/


PHDRS
{
    code PT_LOAD FILEHDR PHDRS FLAGS(0x1 | 0x2 | 0x4);
}

SECTIONS /* Command */
{   
    . = 0x7C00;
    .text : { *(.text) } :code
    .data : { *(.data) }
    .bss : { *(.bss) }
    /DISCARD/ : { *(.eh_frame) }
}
