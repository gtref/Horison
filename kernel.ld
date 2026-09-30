ENTRY(_start)

SECTIONS {
    /* Physical load address */
    . = 0x80000;

    __kernel_start = .;

    .text : ALIGN(0x1000) {
        *(.text*)
        *(.init*)
        *(.rodata*)
    }

    .data : ALIGN(0x1000) {
        *(.data*)
    }

    .bss : ALIGN(0x1000) {
        *(.bss*)
        *(COMMON)
    }

    __kernel_end = .;
}
