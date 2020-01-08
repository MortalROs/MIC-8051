
_max7219_init1:
;7seg.c,8 :: 		void max7219_init1() {
;7seg.c,9 :: 		Chip_Select = 0; // SELECT MAX
	CLR P1_1_bit+0
;7seg.c,10 :: 		SPI1_write(0x09); // BCD mode for digit decoding
	MOV FARG_SPI1_Write_data_out+0, #9
	LCALL _SPI1_Write+0
;7seg.c,11 :: 		SPI1_write(0xFF);
	MOV FARG_SPI1_Write_data_out+0, #255
	LCALL _SPI1_Write+0
;7seg.c,12 :: 		Chip_Select = 1; // DESELECT MAX
	SETB P1_1_bit+0
;7seg.c,13 :: 		Chip_Select = 0; // SELECT MAX
	CLR P1_1_bit+0
;7seg.c,14 :: 		SPI1_write(0x0A);
	MOV FARG_SPI1_Write_data_out+0, #10
	LCALL _SPI1_Write+0
;7seg.c,15 :: 		SPI1_write(0x0F); // Segment luminosity intensity
	MOV FARG_SPI1_Write_data_out+0, #15
	LCALL _SPI1_Write+0
;7seg.c,16 :: 		Chip_Select = 1; // DESELECT MAX
	SETB P1_1_bit+0
;7seg.c,17 :: 		Chip_Select = 0; // SELECT MAX
	CLR P1_1_bit+0
;7seg.c,18 :: 		SPI1_write(0x0B);
	MOV FARG_SPI1_Write_data_out+0, #11
	LCALL _SPI1_Write+0
;7seg.c,19 :: 		SPI1_write(0x07); // Display refresh
	MOV FARG_SPI1_Write_data_out+0, #7
	LCALL _SPI1_Write+0
;7seg.c,20 :: 		Chip_Select = 1; // DESELECT MAX
	SETB P1_1_bit+0
;7seg.c,21 :: 		Chip_Select = 0; // SELECT MAX
	CLR P1_1_bit+0
;7seg.c,22 :: 		SPI1_write(0x0C);
	MOV FARG_SPI1_Write_data_out+0, #12
	LCALL _SPI1_Write+0
;7seg.c,23 :: 		SPI1_write(0x01); // Turn on the display
	MOV FARG_SPI1_Write_data_out+0, #1
	LCALL _SPI1_Write+0
;7seg.c,24 :: 		Chip_Select = 1; // DESELECT MAX
	SETB P1_1_bit+0
;7seg.c,25 :: 		Chip_Select = 0; // SELECT MAX
	CLR P1_1_bit+0
;7seg.c,26 :: 		SPI1_write(0x00);
	MOV FARG_SPI1_Write_data_out+0, #0
	LCALL _SPI1_Write+0
;7seg.c,27 :: 		SPI1_write(0xFF); // No test
	MOV FARG_SPI1_Write_data_out+0, #255
	LCALL _SPI1_Write+0
;7seg.c,28 :: 		Chip_Select = 1; // DESELECT MAX
	SETB P1_1_bit+0
;7seg.c,29 :: 		}
	RET
; end of _max7219_init1

_afiseaza_ora:
;7seg.c,30 :: 		void afiseaza_ora(unsigned int sutimi, unsigned int secunde, unsigned int minute) {
;7seg.c,31 :: 		Chip_Select = 0; // select max7219
	CLR P1_1_bit+0
;7seg.c,32 :: 		SPI1_write(8); // zeci de minute
	MOV FARG_SPI1_Write_data_out+0, #8
	LCALL _SPI1_Write+0
;7seg.c,33 :: 		SPI1_write((minute/10)%10);
	MOV R4, #10
	MOV R5, #0
	MOV R0, FARG_afiseaza_ora_minute+0
	MOV R1, FARG_afiseaza_ora_minute+1
	LCALL _Div_16x16_U+0
	MOV R4, #10
	MOV R5, #0
	LCALL _Div_16x16_U+0
	MOV R0, 4
	MOV R1, 5
	MOV FARG_SPI1_Write_data_out+0, 0
	LCALL _SPI1_Write+0
;7seg.c,34 :: 		Chip_Select = 1; // deselect max7219
	SETB P1_1_bit+0
;7seg.c,35 :: 		Chip_Select = 0; // select max7219
	CLR P1_1_bit+0
;7seg.c,36 :: 		SPI1_write(7);
	MOV FARG_SPI1_Write_data_out+0, #7
	LCALL _SPI1_Write+0
;7seg.c,37 :: 		SPI1_write(minute%10); // minute
	MOV R4, #10
	MOV R5, #0
	MOV R0, FARG_afiseaza_ora_minute+0
	MOV R1, FARG_afiseaza_ora_minute+1
	LCALL _Div_16x16_U+0
	MOV R0, 4
	MOV R1, 5
	MOV FARG_SPI1_Write_data_out+0, 0
	LCALL _SPI1_Write+0
;7seg.c,38 :: 		Chip_Select = 1; // deselect max7219
	SETB P1_1_bit+0
;7seg.c,39 :: 		Chip_Select = 0; // select max7219
	CLR P1_1_bit+0
;7seg.c,40 :: 		SPI1_write(6);
	MOV FARG_SPI1_Write_data_out+0, #6
	LCALL _SPI1_Write+0
;7seg.c,41 :: 		SPI1_write(0x0A); // -
	MOV FARG_SPI1_Write_data_out+0, #10
	LCALL _SPI1_Write+0
;7seg.c,42 :: 		Chip_Select = 1; // deselect max7219
	SETB P1_1_bit+0
;7seg.c,43 :: 		Chip_Select = 0; // select max7219
	CLR P1_1_bit+0
;7seg.c,44 :: 		SPI1_write(5);
	MOV FARG_SPI1_Write_data_out+0, #5
	LCALL _SPI1_Write+0
;7seg.c,45 :: 		SPI1_write((secunde/10)%10); // zeci de secunde
	MOV R4, #10
	MOV R5, #0
	MOV R0, FARG_afiseaza_ora_secunde+0
	MOV R1, FARG_afiseaza_ora_secunde+1
	LCALL _Div_16x16_U+0
	MOV R4, #10
	MOV R5, #0
	LCALL _Div_16x16_U+0
	MOV R0, 4
	MOV R1, 5
	MOV FARG_SPI1_Write_data_out+0, 0
	LCALL _SPI1_Write+0
;7seg.c,46 :: 		Chip_Select = 1; // deselect max7219
	SETB P1_1_bit+0
;7seg.c,47 :: 		Chip_Select = 0; // select max7219
	CLR P1_1_bit+0
;7seg.c,48 :: 		SPI1_write(4); //
	MOV FARG_SPI1_Write_data_out+0, #4
	LCALL _SPI1_Write+0
;7seg.c,49 :: 		SPI1_write(secunde%10); // secunde
	MOV R4, #10
	MOV R5, #0
	MOV R0, FARG_afiseaza_ora_secunde+0
	MOV R1, FARG_afiseaza_ora_secunde+1
	LCALL _Div_16x16_U+0
	MOV R0, 4
	MOV R1, 5
	MOV FARG_SPI1_Write_data_out+0, 0
	LCALL _SPI1_Write+0
;7seg.c,50 :: 		Chip_Select = 1; // deselect max7219
	SETB P1_1_bit+0
;7seg.c,51 :: 		Chip_Select = 0; // select max7219
	CLR P1_1_bit+0
;7seg.c,52 :: 		SPI1_write(3); //
	MOV FARG_SPI1_Write_data_out+0, #3
	LCALL _SPI1_Write+0
;7seg.c,53 :: 		SPI1_write(0x0A); // -
	MOV FARG_SPI1_Write_data_out+0, #10
	LCALL _SPI1_Write+0
;7seg.c,54 :: 		Chip_Select = 1; // deselect max7219
	SETB P1_1_bit+0
;7seg.c,55 :: 		Chip_Select = 0; // select max7219
	CLR P1_1_bit+0
;7seg.c,56 :: 		SPI1_write(2); // zecimi secunda
	MOV FARG_SPI1_Write_data_out+0, #2
	LCALL _SPI1_Write+0
;7seg.c,57 :: 		SPI1_write((sutimi/10)%10);
	MOV R4, #10
	MOV R5, #0
	MOV R0, FARG_afiseaza_ora_sutimi+0
	MOV R1, FARG_afiseaza_ora_sutimi+1
	LCALL _Div_16x16_U+0
	MOV R4, #10
	MOV R5, #0
	LCALL _Div_16x16_U+0
	MOV R0, 4
	MOV R1, 5
	MOV FARG_SPI1_Write_data_out+0, 0
	LCALL _SPI1_Write+0
;7seg.c,58 :: 		Chip_Select = 1; // deselect max7219
	SETB P1_1_bit+0
;7seg.c,59 :: 		Chip_Select = 0; // select max7219
	CLR P1_1_bit+0
;7seg.c,60 :: 		SPI1_write(1); // sutimi secunda
	MOV FARG_SPI1_Write_data_out+0, #1
	LCALL _SPI1_Write+0
;7seg.c,61 :: 		SPI1_write(sutimi%10);
	MOV R4, #10
	MOV R5, #0
	MOV R0, FARG_afiseaza_ora_sutimi+0
	MOV R1, FARG_afiseaza_ora_sutimi+1
	LCALL _Div_16x16_U+0
	MOV R0, 4
	MOV R1, 5
	MOV FARG_SPI1_Write_data_out+0, 0
	LCALL _SPI1_Write+0
;7seg.c,62 :: 		Chip_Select = 1; // deselect max7219
	SETB P1_1_bit+0
;7seg.c,63 :: 		}
	RET
; end of _afiseaza_ora

_main:
	MOV SP+0, #128
;7seg.c,65 :: 		void main() {
;7seg.c,66 :: 		zz=0;
	MOV _zz+0, #0
	MOV _zz+1, #0
;7seg.c,67 :: 		ss=0;
	MOV _ss+0, #0
	MOV _ss+1, #0
;7seg.c,68 :: 		mm=0;
	MOV _mm+0, #0
	MOV _mm+1, #0
;7seg.c,69 :: 		oprire=0;
	MOV _oprire+0, #0
;7seg.c,70 :: 		Uart1_Init(4800);
	ORL PCON+0, #128
	MOV TH1+0, #245
	MOV TL1+0, #245
	LCALL _UART1_Init+0
;7seg.c,71 :: 		Delay_ms(100);
	MOV R6, 163
	MOV R7, 30
	DJNZ R7, 
	DJNZ R6, 
	NOP
;7seg.c,72 :: 		SPI1_Init();
	LCALL _SPI1_Init+0
;7seg.c,73 :: 		max7219_init1();
	LCALL _max7219_init1+0
;7seg.c,75 :: 		while(1){
L_main0:
;7seg.c,76 :: 		if (UART1_Data_Ready()) {
	LCALL _UART1_Data_Ready+0
	MOV A, R0
	JZ L_main2
;7seg.c,77 :: 		caracter_sosit=UART1_Read();
	LCALL _UART1_Read+0
	MOV _caracter_sosit+0, 0
;7seg.c,78 :: 		UART1_Write(caracter_sosit);
	MOV FARG_UART1_Write_data_+0, 0
	LCALL _UART1_Write+0
;7seg.c,79 :: 		}
L_main2:
;7seg.c,80 :: 		switch (caracter_sosit) {
	SJMP L_main3
;7seg.c,81 :: 		case 'P': oprire=0; break;
L_main5:
	MOV _oprire+0, #0
	SJMP L_main4
;7seg.c,82 :: 		case 'O': oprire=1; break;
L_main6:
	MOV _oprire+0, #1
	SJMP L_main4
;7seg.c,83 :: 		case 'R': zz=0;ss=0; mm=0; caracter_sosit='M'; afiseaza_ora(zz,ss,mm); break;
L_main7:
	MOV _zz+0, #0
	MOV _zz+1, #0
	MOV _ss+0, #0
	MOV _ss+1, #0
	MOV _mm+0, #0
	MOV _mm+1, #0
	MOV _caracter_sosit+0, #77
	MOV FARG_afiseaza_ora_sutimi+0, #0
	MOV FARG_afiseaza_ora_sutimi+1, #0
	MOV FARG_afiseaza_ora_secunde+0, #0
	MOV FARG_afiseaza_ora_secunde+1, #0
	MOV FARG_afiseaza_ora_minute+0, #0
	MOV FARG_afiseaza_ora_minute+1, #0
	LCALL _afiseaza_ora+0
	SJMP L_main4
;7seg.c,84 :: 		}
L_main3:
	MOV A, _caracter_sosit+0
	XRL A, #80
	JZ L_main5
	MOV A, _caracter_sosit+0
	XRL A, #79
	JZ L_main6
	MOV A, _caracter_sosit+0
	XRL A, #82
	JZ L_main7
L_main4:
;7seg.c,85 :: 		if (oprire==0) {
	MOV A, _oprire+0
	JZ #3
	LJMP L_main8
;7seg.c,86 :: 		delay_ms(10);
	MOV R6, 17
	MOV R7, 52
	DJNZ R7, 
	DJNZ R6, 
	NOP
;7seg.c,87 :: 		zz=zz+1;
	MOV A, #1
	ADD A, _zz+0
	MOV _zz+0, A
	MOV A, #0
	ADDC A, _zz+1
	MOV _zz+1, A
;7seg.c,88 :: 		if (zz==100) {
	MOV A, #100
	XRL A, _zz+0
	JNZ L__main12
	MOV A, #0
	XRL A, _zz+1
L__main12:
	JNZ L_main9
;7seg.c,89 :: 		zz=0;
	MOV _zz+0, #0
	MOV _zz+1, #0
;7seg.c,90 :: 		ss=ss+1;
	MOV A, #1
	ADD A, _ss+0
	MOV _ss+0, A
	MOV A, #0
	ADDC A, _ss+1
	MOV _ss+1, A
;7seg.c,91 :: 		if (ss==60) {
	MOV A, #60
	XRL A, _ss+0
	JNZ L__main13
	MOV A, #0
	XRL A, _ss+1
L__main13:
	JNZ L_main10
;7seg.c,92 :: 		ss=0;
	MOV _ss+0, #0
	MOV _ss+1, #0
;7seg.c,93 :: 		mm=mm+1;
	MOV A, #1
	ADD A, _mm+0
	MOV _mm+0, A
	MOV A, #0
	ADDC A, _mm+1
	MOV _mm+1, A
;7seg.c,94 :: 		if (mm==60) {
	MOV A, #60
	XRL A, _mm+0
	JNZ L__main14
	MOV A, #0
	XRL A, _mm+1
L__main14:
	JNZ L_main11
;7seg.c,95 :: 		mm=0;
	MOV _mm+0, #0
	MOV _mm+1, #0
;7seg.c,96 :: 		}
L_main11:
;7seg.c,97 :: 		}
L_main10:
;7seg.c,98 :: 		}
L_main9:
;7seg.c,99 :: 		afiseaza_ora(zz,ss,mm);
	MOV FARG_afiseaza_ora_sutimi+0, _zz+0
	MOV FARG_afiseaza_ora_sutimi+1, _zz+1
	MOV FARG_afiseaza_ora_secunde+0, _ss+0
	MOV FARG_afiseaza_ora_secunde+1, _ss+1
	MOV FARG_afiseaza_ora_minute+0, _mm+0
	MOV FARG_afiseaza_ora_minute+1, _mm+1
	LCALL _afiseaza_ora+0
;7seg.c,100 :: 		}
L_main8:
;7seg.c,101 :: 		}
	LJMP L_main0
;7seg.c,102 :: 		}
	SJMP #254
; end of _main
