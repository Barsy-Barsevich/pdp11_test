# Makefile
.RECIPEPREFIX = >

#previously used
#    m68k-linux-gnu-gcc-10 -c *.c

#lib.o: lib.c
#>   m68k-linux-gnu-gcc-10 -W -c lib.c

#main.o: main.c
#>   m68k-linux-gnu-gcc-10 -c main.c

main.o:
>   pdp11-aout-gcc -nostdlib -c -mint16 -msoft-float -mno-ac0 -O1 runtime/*.s src/*.c

result.elf: main.o
# LINKING
#>   pdp11-aout-ld -Ttext 0 -Tdata 0x8000 -o result.elf -t -Map map.map *.o
>   pdp11-aout-ld -o result.elf -t -O1 -Map map.map *.o -T linker.ld

# HEX CONVERTING
#>   pdp11-aout-ld -o result.elf *.o -lc -O0 -t -Map map.txt -T *.ld
>   pdp11-aout-objcopy -O ihex result.elf result.hex

# DISASSEMBLING
>   pdp11-aout-objdump -D result.elf > Disasm.lst


clean_o:
>   rm -rf *.o

clean_elf:
>   rm -rf *.elf *.hex
