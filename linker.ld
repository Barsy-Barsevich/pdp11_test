

ENTRY(_start);

MEMORY
{
  rom (rx)   : ORIGIN = 0x4000, LENGTH = 1K
  ram (rw!x) : ORIGIN = 0x8000, LENGTH = 32K
}

SECTIONS
{
    .text : { *(.text); } > rom
    
    ___RAM_START__ = .;
    .data : { *(.data) } > ram
    .bss : { *(.bss) } > ram
}

__text_start = ADDR(.text);
__text_end = __text_start + SIZEOF(.text);
_ram_start = ADDR(.data);
