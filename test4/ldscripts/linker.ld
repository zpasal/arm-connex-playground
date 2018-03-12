ENTRY (main)

MEMORY {
  FLASH : ORIGIN = 0x0, LENGTH = 16M
  RAM   : ORIGIN = 0xA0000000, LENGTH = 64M 
}

SECTIONS {
    . = 0x00000000;
    .text : {
          * (vectors);
          * (.text);
          * (.init);
          * (.fini);          
          * (.rodata);
    } > FLASH
    flash_sdata = .;

    . = 0xA0000000;
    ram_sdata = .;
    .data : AT (flash_sdata) {
          * (.data);
    } > RAM
    ram_edata = .;
    data_size = ram_edata - ram_sdata;

    sbss = .;
    .bss : {
         * (.bss);
    } > RAM
    ebss = .;
    bss_size = ebss - sbss;
}