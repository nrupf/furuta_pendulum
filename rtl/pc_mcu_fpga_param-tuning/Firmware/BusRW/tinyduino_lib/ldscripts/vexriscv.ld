ENTRY(_start)

MEMORY
{
	BRAM (rw)   : ORIGIN = 0x80000000, LENGTH = 176K
  SDRAM (rw)  : ORIGIN = 0x40000000, LENGTH = 64M
}

SECTIONS
{
	.text :
	{
		*(.init)
		*(.text*)

    /* .ctors */
    *crtbegin.o(.ctors)
    *crtbegin?.o(.ctors)
    *(EXCLUDE_FILE(*crtend?.o *crtend.o) .ctors)
    *(SORT(.ctors.*))
    *(.ctors)
    /* .dtors */
    *crtbegin.o(.dtors)
    *crtbegin?.o(.dtors)
    *(EXCLUDE_FILE(*crtend?.o *crtend.o) .dtors)
    *(SORT(.dtors.*))
    *(.dtors)

		__text_end = .;
	} > BRAM

  .rodata :
  {
    . = ALIGN(4);
    *(.rodata)         /* .rodata sections (constants, strings, etc.) */
    *(.rodata*)        /* .rodata* sections (constants, strings, etc.) */
    *(.gnu.linkonce.r.*)
    . = ALIGN(4);
  } > SDRAM

	.data ALIGN(4) :
	{
		__data_begin = .;
		__global_pointer$ = . + 0x800;
    *(vtable)
		*(.data*)
		*(.eh_frame*)
		*(.rodata*)
		__data_end = ALIGN(4);
		_edata = .;
		_end = .;
	} > SDRAM

	.bss ALIGN(4) :
	{
		__bss_begin = .;
		*(.bss*)
		*(.sbss)
		__bss_end = ALIGN(4);
	} > SDRAM

  .heap :
  {
    __end__ = .;
    end = __end__;
    *(.heap*)
    __HeapLimit = .;
  } > BRAM

	__stack_top = ORIGIN(BRAM) + LENGTH(BRAM);

	/DISCARD/ :
	{
		*(.comment)
	}
}
