ENTRY(main)

PHDRS
{
    text PT_LOAD FLAGS(5); /* R + X */
}

SECTIONS
{
    .text 0x600 : ALIGN(0x100) { *(.text*)} :text
    .data : { *(.data) }
    .bss : { *(.bss) }
    /DISCARD/ : { *(.eh_frame) }
}

