
_main:
	MOV SP+0, #128
;a.c,4 :: 		void main() {
;a.c,5 :: 		P0=0x00;
	MOV P0+0, #0
;a.c,6 :: 		P1=0x00;
	MOV P1+0, #0
;a.c,7 :: 		P2=0x00;
	MOV P2+0, #0
;a.c,8 :: 		P3=0x03;
	MOV P3+0, #3
;a.c,10 :: 		UART1_Init(4800);
	ORL PCON+0, #128
	MOV TH1+0, #245
	MOV TL1+0, #245
	LCALL _UART1_Init+0
;a.c,11 :: 		Delay_ms(100);
	MOV R6, 163
	MOV R7, 30
	DJNZ R7, 
	DJNZ R6, 
	NOP
;a.c,12 :: 		viteza=100;
	MOV _viteza+0, #100
	MOV _viteza+1, #0
;a.c,13 :: 		oprire=0;
	MOV _oprire+0, #0
;a.c,15 :: 		while (1) {
L_main0:
;a.c,16 :: 		if (UART1_Data_Ready()) {
	LCALL _UART1_Data_Ready+0
	MOV A, R0
	JZ L_main2
;a.c,17 :: 		caracter_sosit= UART1_Read();
	LCALL _UART1_Read+0
	MOV _caracter_sosit+0, 0
;a.c,18 :: 		UART1_Write(caracter_sosit);
	MOV FARG_UART1_Write_data_+0, 0
	LCALL _UART1_Write+0
;a.c,22 :: 		(caracter_sosit != '-'))
	MOV A, _caracter_sosit+0
	XRL A, #79
	JZ L_main5
	MOV A, _caracter_sosit+0
	XRL A, #80
	JZ L_main5
	MOV A, _caracter_sosit+0
	XRL A, #43
	JZ L_main5
	MOV A, _caracter_sosit+0
	XRL A, #45
	JZ L_main5
L__main23:
;a.c,23 :: 		comanda=caracter_sosit;
	MOV _comanda+0, _caracter_sosit+0
	SJMP L_main6
L_main5:
;a.c,25 :: 		comanda_ant=comanda;
	MOV _comanda_ant+0, _comanda+0
;a.c,26 :: 		comanda=caracter_sosit;}
	MOV _comanda+0, _caracter_sosit+0
L_main6:
;a.c,27 :: 		}
L_main2:
;a.c,28 :: 		switch (comanda) {
	SJMP L_main7
;a.c,29 :: 		case '+': if (viteza>10) viteza -= 10; comanda=comanda_ant; break;
L_main9:
	SETB C
	MOV A, _viteza+0
	SUBB A, #10
	MOV A, _viteza+1
	SUBB A, #0
	JC L_main10
	CLR C
	MOV A, _viteza+0
	SUBB A, #10
	MOV _viteza+0, A
	MOV A, _viteza+1
	SUBB A, #0
	MOV _viteza+1, A
L_main10:
	MOV _comanda+0, _comanda_ant+0
	SJMP L_main8
;a.c,30 :: 		case '-': viteza += 10; comanda=comanda_ant; break;
L_main11:
	MOV A, #10
	ADD A, _viteza+0
	MOV _viteza+0, A
	MOV A, #0
	ADDC A, _viteza+1
	MOV _viteza+1, A
	MOV _comanda+0, _comanda_ant+0
	SJMP L_main8
;a.c,31 :: 		case 'P': oprire=0; comanda=comanda_ant; break;
L_main12:
	MOV _oprire+0, #0
	MOV _comanda+0, _comanda_ant+0
	SJMP L_main8
;a.c,32 :: 		case 'O': oprire=1; comanda=comanda_ant; break;
L_main13:
	MOV _oprire+0, #1
	MOV _comanda+0, _comanda_ant+0
	SJMP L_main8
;a.c,33 :: 		case 'A': Aprindere_porturi(); break;
L_main14:
	LCALL _Aprindere_porturi+0
	SJMP L_main8
;a.c,34 :: 		case 'S': Stingere_porturi(); break;
L_main15:
	LCALL _Stingere_porturi+0
	SJMP L_main8
;a.c,35 :: 		}
L_main7:
	MOV A, _comanda+0
	XRL A, #43
	JZ L_main9
	MOV A, _comanda+0
	XRL A, #45
	JZ L_main11
	MOV A, _comanda+0
	XRL A, #80
	JZ L_main12
	MOV A, _comanda+0
	XRL A, #79
	JZ L_main13
	MOV A, _comanda+0
	XRL A, #65
	JZ L_main14
	MOV A, _comanda+0
	XRL A, #83
	JZ L_main15
L_main8:
;a.c,36 :: 		if (oprire==0) {
	MOV A, _oprire+0
	JNZ L_main16
;a.c,37 :: 		switch (comanda) {
	SJMP L_main17
;a.c,38 :: 		case '1': Efect1(); break;
L_main19:
	LCALL _Efect1+0
	SJMP L_main18
;a.c,39 :: 		case '2': Efect2(); break;
L_main20:
	LCALL _Efect2+0
	SJMP L_main18
;a.c,40 :: 		case '3': Efect3(); break;
L_main21:
	LCALL _Efect3+0
	SJMP L_main18
;a.c,41 :: 		case '4': Efect4(); break;
L_main22:
	LCALL _Efect4+0
	SJMP L_main18
;a.c,42 :: 		}
L_main17:
	MOV A, _comanda+0
	XRL A, #49
	JZ L_main19
	MOV A, _comanda+0
	XRL A, #50
	JZ L_main20
	MOV A, _comanda+0
	XRL A, #51
	JZ L_main21
	MOV A, _comanda+0
	XRL A, #52
	JZ L_main22
L_main18:
;a.c,43 :: 		}
L_main16:
;a.c,44 :: 		}
	LJMP L_main0
;a.c,45 :: 		}
	SJMP #254
; end of _main

_Efect1:
;a.c,47 :: 		void Efect1() {
;a.c,48 :: 		p0 = 0x00;
	MOV P0+0, #0
;a.c,49 :: 		p1 = 0x00;
	MOV P1+0, #0
;a.c,50 :: 		p2 = 0x00;
	MOV P2+0, #0
;a.c,51 :: 		p3 = 0x03;
	MOV P3+0, #3
;a.c,52 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,54 :: 		p0 = 0x00;
	MOV P0+0, #0
;a.c,55 :: 		p1 = 0x80;
	MOV P1+0, #128
;a.c,56 :: 		p2 = 0x00;
	MOV P2+0, #0
;a.c,57 :: 		p3 = 0x03;
	MOV P3+0, #3
;a.c,58 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,60 :: 		p0 = 0x00;
	MOV P0+0, #0
;a.c,61 :: 		p1 = 0x60;
	MOV P1+0, #96
;a.c,62 :: 		p2 = 0x00;
	MOV P2+0, #0
;a.c,63 :: 		p3 = 0x03;
	MOV P3+0, #3
;a.c,64 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,66 :: 		p0 = 0x01;
	MOV P0+0, #1
;a.c,67 :: 		p1 = 0x61;
	MOV P1+0, #97
;a.c,68 :: 		p2 = 0x00;
	MOV P2+0, #0
;a.c,69 :: 		p3 = 0x03;
	MOV P3+0, #3
;a.c,70 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,72 :: 		p0 = 0x02;
	MOV P0+0, #2
;a.c,73 :: 		p1 = 0x62;
	MOV P1+0, #98
;a.c,74 :: 		p2 = 0x00;
	MOV P2+0, #0
;a.c,75 :: 		p3 = 0x03;
	MOV P3+0, #3
;a.c,76 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,78 :: 		p0 = 0x04;
	MOV P0+0, #4
;a.c,79 :: 		p1 = 0x64;
	MOV P1+0, #100
;a.c,80 :: 		p2 = 0x00;
	MOV P2+0, #0
;a.c,81 :: 		p3 = 0x03;
	MOV P3+0, #3
;a.c,82 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,84 :: 		p0 = 0x08;
	MOV P0+0, #8
;a.c,85 :: 		p1 = 0x08;
	MOV P1+0, #8
;a.c,86 :: 		p2 = 0x60;
	MOV P2+0, #96
;a.c,87 :: 		p3 = 0x03;
	MOV P3+0, #3
;a.c,88 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,90 :: 		p0 = 0x10;
	MOV P0+0, #16
;a.c,91 :: 		p1 = 0x10;
	MOV P1+0, #16
;a.c,92 :: 		p2 = 0x60;
	MOV P2+0, #96
;a.c,93 :: 		p3 = 0x03;
	MOV P3+0, #3
;a.c,94 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,96 :: 		p0 = 0x20;
	MOV P0+0, #32
;a.c,97 :: 		p1 = 0x20;
	MOV P1+0, #32
;a.c,98 :: 		p2 = 0x61;
	MOV P2+0, #97
;a.c,99 :: 		p3 = 0x03;
	MOV P3+0, #3
;a.c,100 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,102 :: 		p0 = 0x40;
	MOV P0+0, #64
;a.c,103 :: 		p1 = 0x40;
	MOV P1+0, #64
;a.c,104 :: 		p2 = 0x62;
	MOV P2+0, #98
;a.c,105 :: 		p3 = 0x03;
	MOV P3+0, #3
;a.c,106 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,108 :: 		p0 = 0x80;
	MOV P0+0, #128
;a.c,109 :: 		p1 = 0x80;
	MOV P1+0, #128
;a.c,110 :: 		p2 = 0x64;
	MOV P2+0, #100
;a.c,111 :: 		p3 = 0x07;
	MOV P3+0, #7
;a.c,112 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,114 :: 		p0 = 0x00;
	MOV P0+0, #0
;a.c,115 :: 		p1 = 0x60;
	MOV P1+0, #96
;a.c,116 :: 		p2 = 0x08;
	MOV P2+0, #8
;a.c,117 :: 		p3 = 0x0B;
	MOV P3+0, #11
;a.c,118 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,120 :: 		p0 = 0x00;
	MOV P0+0, #0
;a.c,121 :: 		p1 = 0x60;
	MOV P1+0, #96
;a.c,122 :: 		p2 = 0x10;
	MOV P2+0, #16
;a.c,123 :: 		p3 = 0x13;
	MOV P3+0, #19
;a.c,124 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,126 :: 		p0 = 0x00;
	MOV P0+0, #0
;a.c,127 :: 		p1 = 0x61;
	MOV P1+0, #97
;a.c,128 :: 		p2 = 0x21;
	MOV P2+0, #33
;a.c,129 :: 		p3 = 0x23;
	MOV P3+0, #35
;a.c,130 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,132 :: 		p0 = 0x00;
	MOV P0+0, #0
;a.c,133 :: 		p1 = 0x62;
	MOV P1+0, #98
;a.c,134 :: 		p2 = 0x42;
	MOV P2+0, #66
;a.c,135 :: 		p3 = 0x43;
	MOV P3+0, #67
;a.c,136 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,138 :: 		p0 = 0x00;
	MOV P0+0, #0
;a.c,139 :: 		p1 = 0x64;
	MOV P1+0, #100
;a.c,140 :: 		p2 = 0x84;
	MOV P2+0, #132
;a.c,141 :: 		p3 = 0x87;
	MOV P3+0, #135
;a.c,142 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,144 :: 		p0 = 0x60;
	MOV P0+0, #96
;a.c,145 :: 		p1 = 0x08;
	MOV P1+0, #8
;a.c,146 :: 		p2 = 0x08;
	MOV P2+0, #8
;a.c,147 :: 		p3 = 0x0B;
	MOV P3+0, #11
;a.c,148 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,150 :: 		p0 = 0x60;
	MOV P0+0, #96
;a.c,151 :: 		p1 = 0x10;
	MOV P1+0, #16
;a.c,152 :: 		p2 = 0x10;
	MOV P2+0, #16
;a.c,153 :: 		p3 = 0x13;
	MOV P3+0, #19
;a.c,154 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,156 :: 		p0 = 0x61;
	MOV P0+0, #97
;a.c,157 :: 		p1 = 0x21;
	MOV P1+0, #33
;a.c,158 :: 		p2 = 0x21;
	MOV P2+0, #33
;a.c,159 :: 		p3 = 0x23;
	MOV P3+0, #35
;a.c,160 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,162 :: 		p0 = 0x62;
	MOV P0+0, #98
;a.c,163 :: 		p1 = 0x42;
	MOV P1+0, #66
;a.c,164 :: 		p2 = 0x42;
	MOV P2+0, #66
;a.c,165 :: 		p3 = 0x43;
	MOV P3+0, #67
;a.c,166 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,168 :: 		p0 = 0x04;
	MOV P0+0, #4
;a.c,169 :: 		p1 = 0xE4;
	MOV P1+0, #228
;a.c,170 :: 		p2 = 0x84;
	MOV P2+0, #132
;a.c,171 :: 		p3 = 0x83;
	MOV P3+0, #131
;a.c,172 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,174 :: 		p0 = 0x08;
	MOV P0+0, #8
;a.c,175 :: 		p1 = 0x08;
	MOV P1+0, #8
;a.c,176 :: 		p2 = 0x68;
	MOV P2+0, #104
;a.c,177 :: 		p3 = 0x03;
	MOV P3+0, #3
;a.c,178 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,180 :: 		p0 = 0x10;
	MOV P0+0, #16
;a.c,181 :: 		p1 = 0x10;
	MOV P1+0, #16
;a.c,182 :: 		p2 = 0x10;
	MOV P2+0, #16
;a.c,183 :: 		p3 = 0x63;
	MOV P3+0, #99
;a.c,184 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,186 :: 		p0 = 0x20;
	MOV P0+0, #32
;a.c,187 :: 		p1 = 0x20;
	MOV P1+0, #32
;a.c,188 :: 		p2 = 0x20;
	MOV P2+0, #32
;a.c,189 :: 		p3 = 0x63;
	MOV P3+0, #99
;a.c,190 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,192 :: 		p0 = 0x40;
	MOV P0+0, #64
;a.c,193 :: 		p1 = 0x40;
	MOV P1+0, #64
;a.c,194 :: 		p2 = 0x40;
	MOV P2+0, #64
;a.c,195 :: 		p3 = 0x63;
	MOV P3+0, #99
;a.c,196 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,198 :: 		p0 = 0x80;
	MOV P0+0, #128
;a.c,199 :: 		p1 = 0x80;
	MOV P1+0, #128
;a.c,200 :: 		p2 = 0x80;
	MOV P2+0, #128
;a.c,201 :: 		p3 = 0x63;
	MOV P3+0, #99
;a.c,202 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,204 :: 		p0 = 0x00;
	MOV P0+0, #0
;a.c,205 :: 		p1 = 0x00;
	MOV P1+0, #0
;a.c,206 :: 		p2 = 0x60;
	MOV P2+0, #96
;a.c,207 :: 		p3 = 0x03;
	MOV P3+0, #3
;a.c,208 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,210 :: 		p0 = 0x01;
	MOV P0+0, #1
;a.c,211 :: 		p1 = 0x61;
	MOV P1+0, #97
;a.c,212 :: 		p2 = 0x01;
	MOV P2+0, #1
;a.c,213 :: 		p3 = 0x03;
	MOV P3+0, #3
;a.c,214 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,216 :: 		p0 = 0x02;
	MOV P0+0, #2
;a.c,217 :: 		p1 = 0x62;
	MOV P1+0, #98
;a.c,218 :: 		p2 = 0x02;
	MOV P2+0, #2
;a.c,219 :: 		p3 = 0x03;
	MOV P3+0, #3
;a.c,220 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,222 :: 		p0 = 0x04;
	MOV P0+0, #4
;a.c,223 :: 		p1 = 0x64;
	MOV P1+0, #100
;a.c,224 :: 		p2 = 0x04;
	MOV P2+0, #4
;a.c,225 :: 		p3 = 0x07;
	MOV P3+0, #7
;a.c,226 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,228 :: 		p0 = 0x08;
	MOV P0+0, #8
;a.c,229 :: 		p1 = 0x68;
	MOV P1+0, #104
;a.c,230 :: 		p2 = 0x08;
	MOV P2+0, #8
;a.c,231 :: 		p3 = 0x0B;
	MOV P3+0, #11
;a.c,232 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,234 :: 		p0 = 0x10;
	MOV P0+0, #16
;a.c,235 :: 		p1 = 0x70;
	MOV P1+0, #112
;a.c,236 :: 		p2 = 0x10;
	MOV P2+0, #16
;a.c,237 :: 		p3 = 0x13;
	MOV P3+0, #19
;a.c,238 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,240 :: 		p0 = 0x20;
	MOV P0+0, #32
;a.c,241 :: 		p1 = 0xE0;
	MOV P1+0, #224
;a.c,242 :: 		p2 = 0x20;
	MOV P2+0, #32
;a.c,243 :: 		p3 = 0x23;
	MOV P3+0, #35
;a.c,244 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,246 :: 		p0 = 0x40;
	MOV P0+0, #64
;a.c,247 :: 		p1 = 0xC0;
	MOV P1+0, #192
;a.c,248 :: 		p2 = 0x40;
	MOV P2+0, #64
;a.c,249 :: 		p3 = 0x43;
	MOV P3+0, #67
;a.c,250 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,252 :: 		p0 = 0x80;
	MOV P0+0, #128
;a.c,253 :: 		p1 = 0x80;
	MOV P1+0, #128
;a.c,254 :: 		p2 = 0x80;
	MOV P2+0, #128
;a.c,255 :: 		p3 = 0x83;
	MOV P3+0, #131
;a.c,256 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,258 :: 		p0 = 0x00;
	MOV P0+0, #0
;a.c,259 :: 		p1 = 0x00;
	MOV P1+0, #0
;a.c,260 :: 		p2 = 0x00;
	MOV P2+0, #0
;a.c,261 :: 		p3 = 0x03;
	MOV P3+0, #3
;a.c,262 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,264 :: 		}
	RET
; end of _Efect1

_Efect2:
;a.c,266 :: 		void Efect2() {
;a.c,267 :: 		p0 = 0x01;
	MOV P0+0, #1
;a.c,268 :: 		p1 = 0x00;
	MOV P1+0, #0
;a.c,269 :: 		p2 = 0x00;
	MOV P2+0, #0
;a.c,270 :: 		p3 = 0x03;
	MOV P3+0, #3
;a.c,271 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,273 :: 		p0 = 0x03;
	MOV P0+0, #3
;a.c,274 :: 		p1 = 0x01;
	MOV P1+0, #1
;a.c,275 :: 		p2 = 0x00;
	MOV P2+0, #0
;a.c,276 :: 		p3 = 0x03;
	MOV P3+0, #3
;a.c,277 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,279 :: 		p0 = 0x07;
	MOV P0+0, #7
;a.c,280 :: 		p1 = 0x02;
	MOV P1+0, #2
;a.c,281 :: 		p2 = 0x00;
	MOV P2+0, #0
;a.c,282 :: 		p3 = 0x03;
	MOV P3+0, #3
;a.c,283 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,285 :: 		p0 = 0x0E;
	MOV P0+0, #14
;a.c,286 :: 		p1 = 0x04;
	MOV P1+0, #4
;a.c,287 :: 		p2 = 0x00;
	MOV P2+0, #0
;a.c,288 :: 		p3 = 0x03;
	MOV P3+0, #3
;a.c,289 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,291 :: 		p0 = 0x1C;
	MOV P0+0, #28
;a.c,292 :: 		p1 = 0x08;
	MOV P1+0, #8
;a.c,293 :: 		p2 = 0x00;
	MOV P2+0, #0
;a.c,294 :: 		p3 = 0x03;
	MOV P3+0, #3
;a.c,295 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,297 :: 		p0 = 0x10;
	MOV P0+0, #16
;a.c,298 :: 		p1 = 0x18;
	MOV P1+0, #24
;a.c,299 :: 		p2 = 0x10;
	MOV P2+0, #16
;a.c,300 :: 		p3 = 0x03;
	MOV P3+0, #3
;a.c,301 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,303 :: 		p0 = 0x20;
	MOV P0+0, #32
;a.c,304 :: 		p1 = 0x30;
	MOV P1+0, #48
;a.c,305 :: 		p2 = 0x20;
	MOV P2+0, #32
;a.c,306 :: 		p3 = 0x03;
	MOV P3+0, #3
;a.c,307 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,309 :: 		p0 = 0x40;
	MOV P0+0, #64
;a.c,310 :: 		p1 = 0x60;
	MOV P1+0, #96
;a.c,311 :: 		p2 = 0x40;
	MOV P2+0, #64
;a.c,312 :: 		p3 = 0x03;
	MOV P3+0, #3
;a.c,313 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,315 :: 		p0 = 0x80;
	MOV P0+0, #128
;a.c,316 :: 		p1 = 0xC0;
	MOV P1+0, #192
;a.c,317 :: 		p2 = 0x81;
	MOV P2+0, #129
;a.c,318 :: 		p3 = 0x03;
	MOV P3+0, #3
;a.c,319 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,321 :: 		p0 = 0x80;
	MOV P0+0, #128
;a.c,322 :: 		p1 = 0xC1;
	MOV P1+0, #193
;a.c,323 :: 		p2 = 0x83;
	MOV P2+0, #131
;a.c,324 :: 		p3 = 0x03;
	MOV P3+0, #3
;a.c,325 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,327 :: 		p0 = 0x80;
	MOV P0+0, #128
;a.c,328 :: 		p1 = 0xC2;
	MOV P1+0, #194
;a.c,329 :: 		p2 = 0x87;
	MOV P2+0, #135
;a.c,330 :: 		p3 = 0x03;
	MOV P3+0, #3
;a.c,331 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,333 :: 		p0 = 0x80;
	MOV P0+0, #128
;a.c,334 :: 		p1 = 0xC4;
	MOV P1+0, #196
;a.c,335 :: 		p2 = 0x8E;
	MOV P2+0, #142
;a.c,336 :: 		p3 = 0x03;
	MOV P3+0, #3
;a.c,337 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,339 :: 		p0 = 0x80;
	MOV P0+0, #128
;a.c,340 :: 		p1 = 0xC8;
	MOV P1+0, #200
;a.c,341 :: 		p2 = 0x9C;
	MOV P2+0, #156
;a.c,342 :: 		p3 = 0x03;
	MOV P3+0, #3
;a.c,343 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,345 :: 		p0 = 0x80;
	MOV P0+0, #128
;a.c,346 :: 		p1 = 0xD0;
	MOV P1+0, #208
;a.c,347 :: 		p2 = 0xB8;
	MOV P2+0, #184
;a.c,348 :: 		p3 = 0x03;
	MOV P3+0, #3
;a.c,349 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,351 :: 		p0 = 0x80;
	MOV P0+0, #128
;a.c,352 :: 		p1 = 0xC0;
	MOV P1+0, #192
;a.c,353 :: 		p2 = 0xA0;
	MOV P2+0, #160
;a.c,354 :: 		p3 = 0x73;
	MOV P3+0, #115
;a.c,355 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,357 :: 		p0 = 0x80;
	MOV P0+0, #128
;a.c,358 :: 		p1 = 0xC0;
	MOV P1+0, #192
;a.c,359 :: 		p2 = 0xC0;
	MOV P2+0, #192
;a.c,360 :: 		p3 = 0xE3;
	MOV P3+0, #227
;a.c,361 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,363 :: 		p0 = 0x80;
	MOV P0+0, #128
;a.c,364 :: 		p1 = 0xC1;
	MOV P1+0, #193
;a.c,365 :: 		p2 = 0xC1;
	MOV P2+0, #193
;a.c,366 :: 		p3 = 0xE3;
	MOV P3+0, #227
;a.c,367 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,369 :: 		p0 = 0x80;
	MOV P0+0, #128
;a.c,370 :: 		p1 = 0xC3;
	MOV P1+0, #195
;a.c,371 :: 		p2 = 0xC2;
	MOV P2+0, #194
;a.c,372 :: 		p3 = 0xE3;
	MOV P3+0, #227
;a.c,373 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,375 :: 		p0 = 0x80;
	MOV P0+0, #128
;a.c,376 :: 		p1 = 0xC7;
	MOV P1+0, #199
;a.c,377 :: 		p2 = 0xC4;
	MOV P2+0, #196
;a.c,378 :: 		p3 = 0xE3;
	MOV P3+0, #227
;a.c,379 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,381 :: 		p0 = 0x80;
	MOV P0+0, #128
;a.c,382 :: 		p1 = 0xCE;
	MOV P1+0, #206
;a.c,383 :: 		p2 = 0xC8;
	MOV P2+0, #200
;a.c,384 :: 		p3 = 0xE3;
	MOV P3+0, #227
;a.c,385 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,387 :: 		p0 = 0x80;
	MOV P0+0, #128
;a.c,388 :: 		p1 = 0xDC;
	MOV P1+0, #220
;a.c,389 :: 		p2 = 0xD0;
	MOV P2+0, #208
;a.c,390 :: 		p3 = 0xE3;
	MOV P3+0, #227
;a.c,391 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,393 :: 		p0 = 0xB0;
	MOV P0+0, #176
;a.c,394 :: 		p1 = 0xD0;
	MOV P1+0, #208
;a.c,395 :: 		p2 = 0xD0;
	MOV P2+0, #208
;a.c,396 :: 		p3 = 0xE3;
	MOV P3+0, #227
;a.c,397 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,399 :: 		p0 = 0xE0;
	MOV P0+0, #224
;a.c,400 :: 		p1 = 0xE0;
	MOV P1+0, #224
;a.c,401 :: 		p2 = 0xE0;
	MOV P2+0, #224
;a.c,402 :: 		p3 = 0xE3;
	MOV P3+0, #227
;a.c,403 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,405 :: 		p0 = 0xE0;
	MOV P0+0, #224
;a.c,406 :: 		p1 = 0xE1;
	MOV P1+0, #225
;a.c,407 :: 		p2 = 0xE0;
	MOV P2+0, #224
;a.c,408 :: 		p3 = 0xE3;
	MOV P3+0, #227
;a.c,409 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,411 :: 		p0 = 0xE0;
	MOV P0+0, #224
;a.c,412 :: 		p1 = 0xE3;
	MOV P1+0, #227
;a.c,413 :: 		p2 = 0xE0;
	MOV P2+0, #224
;a.c,414 :: 		p3 = 0xE3;
	MOV P3+0, #227
;a.c,415 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,417 :: 		p0 = 0xE0;
	MOV P0+0, #224
;a.c,418 :: 		p1 = 0xE7;
	MOV P1+0, #231
;a.c,419 :: 		p2 = 0xE0;
	MOV P2+0, #224
;a.c,420 :: 		p3 = 0xE3;
	MOV P3+0, #227
;a.c,421 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,423 :: 		p0 = 0xF0;
	MOV P0+0, #240
;a.c,424 :: 		p1 = 0xF0;
	MOV P1+0, #240
;a.c,425 :: 		p2 = 0xF0;
	MOV P2+0, #240
;a.c,426 :: 		p3 = 0xF3;
	MOV P3+0, #243
;a.c,427 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,429 :: 		p0 = 0xF1;
	MOV P0+0, #241
;a.c,430 :: 		p1 = 0xF0;
	MOV P1+0, #240
;a.c,431 :: 		p2 = 0xF0;
	MOV P2+0, #240
;a.c,432 :: 		p3 = 0xF3;
	MOV P3+0, #243
;a.c,433 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,435 :: 		p0 = 0xF3;
	MOV P0+0, #243
;a.c,436 :: 		p1 = 0xF1;
	MOV P1+0, #241
;a.c,437 :: 		p2 = 0xF0;
	MOV P2+0, #240
;a.c,438 :: 		p3 = 0xF3;
	MOV P3+0, #243
;a.c,439 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,441 :: 		p0 = 0xF7;
	MOV P0+0, #247
;a.c,442 :: 		p1 = 0xF2;
	MOV P1+0, #242
;a.c,443 :: 		p2 = 0xF0;
	MOV P2+0, #240
;a.c,444 :: 		p3 = 0xF3;
	MOV P3+0, #243
;a.c,445 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,447 :: 		p0 = 0xF8;
	MOV P0+0, #248
;a.c,448 :: 		p1 = 0xFC;
	MOV P1+0, #252
;a.c,449 :: 		p2 = 0xF8;
	MOV P2+0, #248
;a.c,450 :: 		p3 = 0xF3;
	MOV P3+0, #243
;a.c,451 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,453 :: 		p0 = 0xF8;
	MOV P0+0, #248
;a.c,454 :: 		p1 = 0xFC;
	MOV P1+0, #252
;a.c,455 :: 		p2 = 0xF9;
	MOV P2+0, #249
;a.c,456 :: 		p3 = 0xF3;
	MOV P3+0, #243
;a.c,457 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,459 :: 		p0 = 0xF9;
	MOV P0+0, #249
;a.c,460 :: 		p1 = 0xFD;
	MOV P1+0, #253
;a.c,461 :: 		p2 = 0xFB;
	MOV P2+0, #251
;a.c,462 :: 		p3 = 0xF3;
	MOV P3+0, #243
;a.c,463 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,465 :: 		p0 = 0xFA;
	MOV P0+0, #250
;a.c,466 :: 		p1 = 0xFE;
	MOV P1+0, #254
;a.c,467 :: 		p2 = 0xFE;
	MOV P2+0, #254
;a.c,468 :: 		p3 = 0xF3;
	MOV P3+0, #243
;a.c,469 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,470 :: 		}
	RET
; end of _Efect2

_Efect3:
;a.c,472 :: 		void Efect3() {
;a.c,473 :: 		p0 = 0x00;
	MOV P0+0, #0
;a.c,474 :: 		p1 = 0x00;
	MOV P1+0, #0
;a.c,475 :: 		p2 = 0x00;
	MOV P2+0, #0
;a.c,476 :: 		p3 = 0x03;
	MOV P3+0, #3
;a.c,477 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,479 :: 		p0 = 0x01;
	MOV P0+0, #1
;a.c,480 :: 		p1 = 0x00;
	MOV P1+0, #0
;a.c,481 :: 		p2 = 0x00;
	MOV P2+0, #0
;a.c,482 :: 		p3 = 0x83;
	MOV P3+0, #131
;a.c,483 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,485 :: 		p0 = 0x02;
	MOV P0+0, #2
;a.c,486 :: 		p1 = 0x01;
	MOV P1+0, #1
;a.c,487 :: 		p2 = 0x80;
	MOV P2+0, #128
;a.c,488 :: 		p3 = 0x43;
	MOV P3+0, #67
;a.c,489 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,491 :: 		p0 = 0x04;
	MOV P0+0, #4
;a.c,492 :: 		p1 = 0x82;
	MOV P1+0, #130
;a.c,493 :: 		p2 = 0x41;
	MOV P2+0, #65
;a.c,494 :: 		p3 = 0x23;
	MOV P3+0, #35
;a.c,495 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,497 :: 		p0 = 0x04;
	MOV P0+0, #4
;a.c,498 :: 		p1 = 0xC4;
	MOV P1+0, #196
;a.c,499 :: 		p2 = 0x23;
	MOV P2+0, #35
;a.c,500 :: 		p3 = 0x23;
	MOV P3+0, #35
;a.c,501 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,503 :: 		p0 = 0xC8;
	MOV P0+0, #200
;a.c,504 :: 		p1 = 0x28;
	MOV P1+0, #40
;a.c,505 :: 		p2 = 0x14;
	MOV P2+0, #20
;a.c,506 :: 		p3 = 0x13;
	MOV P3+0, #19
;a.c,507 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,509 :: 		p0 = 0x30;
	MOV P0+0, #48
;a.c,510 :: 		p1 = 0x18;
	MOV P1+0, #24
;a.c,511 :: 		p2 = 0x0E;
	MOV P2+0, #14
;a.c,512 :: 		p3 = 0x07;
	MOV P3+0, #7
;a.c,513 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,515 :: 		p0 = 0x10;
	MOV P0+0, #16
;a.c,516 :: 		p1 = 0x10;
	MOV P1+0, #16
;a.c,517 :: 		p2 = 0x0C;
	MOV P2+0, #12
;a.c,518 :: 		p3 = 0x03;
	MOV P3+0, #3
;a.c,519 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,521 :: 		p0 = 0x00;
	MOV P0+0, #0
;a.c,522 :: 		p1 = 0x08;
	MOV P1+0, #8
;a.c,523 :: 		p2 = 0x08;
	MOV P2+0, #8
;a.c,524 :: 		p3 = 0x03;
	MOV P3+0, #3
;a.c,525 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,527 :: 		p0 = 0x00;
	MOV P0+0, #0
;a.c,528 :: 		p1 = 0x18;
	MOV P1+0, #24
;a.c,529 :: 		p2 = 0x18;
	MOV P2+0, #24
;a.c,530 :: 		p3 = 0x03;
	MOV P3+0, #3
;a.c,531 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,533 :: 		p0 = 0x18;
	MOV P0+0, #24
;a.c,534 :: 		p1 = 0x24;
	MOV P1+0, #36
;a.c,535 :: 		p2 = 0x24;
	MOV P2+0, #36
;a.c,536 :: 		p3 = 0x1B;
	MOV P3+0, #27
;a.c,537 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,539 :: 		p0 = 0x24;
	MOV P0+0, #36
;a.c,540 :: 		p1 = 0x42;
	MOV P1+0, #66
;a.c,541 :: 		p2 = 0x42;
	MOV P2+0, #66
;a.c,542 :: 		p3 = 0x27;
	MOV P3+0, #39
;a.c,543 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,545 :: 		p0 = 0x42;
	MOV P0+0, #66
;a.c,546 :: 		p1 = 0x81;
	MOV P1+0, #129
;a.c,547 :: 		p2 = 0x81;
	MOV P2+0, #129
;a.c,548 :: 		p3 = 0x43;
	MOV P3+0, #67
;a.c,549 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,551 :: 		p0 = 0x81;
	MOV P0+0, #129
;a.c,552 :: 		p1 = 0x00;
	MOV P1+0, #0
;a.c,553 :: 		p2 = 0x00;
	MOV P2+0, #0
;a.c,554 :: 		p3 = 0x83;
	MOV P3+0, #131
;a.c,555 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,557 :: 		p0 = 0x00;
	MOV P0+0, #0
;a.c,558 :: 		p1 = 0x00;
	MOV P1+0, #0
;a.c,559 :: 		p2 = 0x00;
	MOV P2+0, #0
;a.c,560 :: 		p3 = 0x03;
	MOV P3+0, #3
;a.c,561 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,562 :: 		}
	RET
; end of _Efect3

_Efect4:
;a.c,564 :: 		void Efect4() {
;a.c,565 :: 		p0 = 0xE0;
	MOV P0+0, #224
;a.c,566 :: 		p1 = 0xE0;
	MOV P1+0, #224
;a.c,567 :: 		p2 = 0xE0;
	MOV P2+0, #224
;a.c,568 :: 		p3 = 0xE3;
	MOV P3+0, #227
;a.c,569 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,571 :: 		p0 = 0xE1;
	MOV P0+0, #225
;a.c,572 :: 		p1 = 0xE0;
	MOV P1+0, #224
;a.c,573 :: 		p2 = 0xE0;
	MOV P2+0, #224
;a.c,574 :: 		p3 = 0xE3;
	MOV P3+0, #227
;a.c,575 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,577 :: 		p0 = 0xE2;
	MOV P0+0, #226
;a.c,578 :: 		p1 = 0xE0;
	MOV P1+0, #224
;a.c,579 :: 		p2 = 0xE0;
	MOV P2+0, #224
;a.c,580 :: 		p3 = 0xE3;
	MOV P3+0, #227
;a.c,581 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,583 :: 		p0 = 0xE4;
	MOV P0+0, #228
;a.c,584 :: 		p1 = 0xE0;
	MOV P1+0, #224
;a.c,585 :: 		p2 = 0xE0;
	MOV P2+0, #224
;a.c,586 :: 		p3 = 0xE3;
	MOV P3+0, #227
;a.c,587 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,589 :: 		p0 = 0xE8;
	MOV P0+0, #232
;a.c,590 :: 		p1 = 0xE0;
	MOV P1+0, #224
;a.c,591 :: 		p2 = 0xE1;
	MOV P2+0, #225
;a.c,592 :: 		p3 = 0xE3;
	MOV P3+0, #227
;a.c,593 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,595 :: 		p0 = 0xF0;
	MOV P0+0, #240
;a.c,596 :: 		p1 = 0xE0;
	MOV P1+0, #224
;a.c,597 :: 		p2 = 0xE2;
	MOV P2+0, #226
;a.c,598 :: 		p3 = 0xE3;
	MOV P3+0, #227
;a.c,599 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,601 :: 		p0 = 0xC0;
	MOV P0+0, #192
;a.c,602 :: 		p1 = 0xE0;
	MOV P1+0, #224
;a.c,603 :: 		p2 = 0xE4;
	MOV P2+0, #228
;a.c,604 :: 		p3 = 0xE3;
	MOV P3+0, #227
;a.c,605 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,607 :: 		p0 = 0xC0;
	MOV P0+0, #192
;a.c,608 :: 		p1 = 0xE1;
	MOV P1+0, #225
;a.c,609 :: 		p2 = 0xE8;
	MOV P2+0, #232
;a.c,610 :: 		p3 = 0xE3;
	MOV P3+0, #227
;a.c,611 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,613 :: 		p0 = 0xC0;
	MOV P0+0, #192
;a.c,614 :: 		p1 = 0xE2;
	MOV P1+0, #226
;a.c,615 :: 		p2 = 0xF0;
	MOV P2+0, #240
;a.c,616 :: 		p3 = 0xE3;
	MOV P3+0, #227
;a.c,617 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,619 :: 		p0 = 0xC0;
	MOV P0+0, #192
;a.c,620 :: 		p1 = 0xE4;
	MOV P1+0, #228
;a.c,621 :: 		p2 = 0xC0;
	MOV P2+0, #192
;a.c,622 :: 		p3 = 0xE3;
	MOV P3+0, #227
;a.c,623 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,625 :: 		p0 = 0xC0;
	MOV P0+0, #192
;a.c,626 :: 		p1 = 0xE8;
	MOV P1+0, #232
;a.c,627 :: 		p2 = 0xC0;
	MOV P2+0, #192
;a.c,628 :: 		p3 = 0xE7;
	MOV P3+0, #231
;a.c,629 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,631 :: 		p0 = 0xC0;
	MOV P0+0, #192
;a.c,632 :: 		p1 = 0xF0;
	MOV P1+0, #240
;a.c,633 :: 		p2 = 0xC0;
	MOV P2+0, #192
;a.c,634 :: 		p3 = 0xEB;
	MOV P3+0, #235
;a.c,635 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,637 :: 		p0 = 0xC0;
	MOV P0+0, #192
;a.c,638 :: 		p1 = 0xC0;
	MOV P1+0, #192
;a.c,639 :: 		p2 = 0xC0;
	MOV P2+0, #192
;a.c,640 :: 		p3 = 0xF3;
	MOV P3+0, #243
;a.c,641 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,643 :: 		p0 = 0xC0;
	MOV P0+0, #192
;a.c,644 :: 		p1 = 0xC0;
	MOV P1+0, #192
;a.c,645 :: 		p2 = 0xC1;
	MOV P2+0, #193
;a.c,646 :: 		p3 = 0xC3;
	MOV P3+0, #195
;a.c,647 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,649 :: 		p0 = 0xC0;
	MOV P0+0, #192
;a.c,650 :: 		p1 = 0xC0;
	MOV P1+0, #192
;a.c,651 :: 		p2 = 0xC2;
	MOV P2+0, #194
;a.c,652 :: 		p3 = 0xC3;
	MOV P3+0, #195
;a.c,653 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,655 :: 		p0 = 0xC0;
	MOV P0+0, #192
;a.c,656 :: 		p1 = 0xC0;
	MOV P1+0, #192
;a.c,657 :: 		p2 = 0xC4;
	MOV P2+0, #196
;a.c,658 :: 		p3 = 0xC3;
	MOV P3+0, #195
;a.c,659 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,661 :: 		p0 = 0xC0;
	MOV P0+0, #192
;a.c,662 :: 		p1 = 0xC1;
	MOV P1+0, #193
;a.c,663 :: 		p2 = 0xC8;
	MOV P2+0, #200
;a.c,664 :: 		p3 = 0xC3;
	MOV P3+0, #195
;a.c,665 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,667 :: 		p0 = 0xC0;
	MOV P0+0, #192
;a.c,668 :: 		p1 = 0xC2;
	MOV P1+0, #194
;a.c,669 :: 		p2 = 0xD0;
	MOV P2+0, #208
;a.c,670 :: 		p3 = 0xC3;
	MOV P3+0, #195
;a.c,671 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,673 :: 		p0 = 0xC0;
	MOV P0+0, #192
;a.c,674 :: 		p1 = 0xC4;
	MOV P1+0, #196
;a.c,675 :: 		p2 = 0xE0;
	MOV P2+0, #224
;a.c,676 :: 		p3 = 0xC3;
	MOV P3+0, #195
;a.c,677 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,679 :: 		p0 = 0xC0;
	MOV P0+0, #192
;a.c,680 :: 		p1 = 0xC8;
	MOV P1+0, #200
;a.c,681 :: 		p2 = 0x80;
	MOV P2+0, #128
;a.c,682 :: 		p3 = 0xC3;
	MOV P3+0, #195
;a.c,683 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,685 :: 		p0 = 0xC0;
	MOV P0+0, #192
;a.c,686 :: 		p1 = 0xD0;
	MOV P1+0, #208
;a.c,687 :: 		p2 = 0x80;
	MOV P2+0, #128
;a.c,688 :: 		p3 = 0xC7;
	MOV P3+0, #199
;a.c,689 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,691 :: 		p0 = 0xC0;
	MOV P0+0, #192
;a.c,692 :: 		p1 = 0xE0;
	MOV P1+0, #224
;a.c,693 :: 		p2 = 0x80;
	MOV P2+0, #128
;a.c,694 :: 		p3 = 0xCB;
	MOV P3+0, #203
;a.c,695 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,697 :: 		p0 = 0xC0;
	MOV P0+0, #192
;a.c,698 :: 		p1 = 0x80;
	MOV P1+0, #128
;a.c,699 :: 		p2 = 0x80;
	MOV P2+0, #128
;a.c,700 :: 		p3 = 0xD3;
	MOV P3+0, #211
;a.c,701 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,703 :: 		p0 = 0xC1;
	MOV P0+0, #193
;a.c,704 :: 		p1 = 0x80;
	MOV P1+0, #128
;a.c,705 :: 		p2 = 0x80;
	MOV P2+0, #128
;a.c,706 :: 		p3 = 0xE3;
	MOV P3+0, #227
;a.c,707 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,709 :: 		p0 = 0xC2;
	MOV P0+0, #194
;a.c,710 :: 		p1 = 0x80;
	MOV P1+0, #128
;a.c,711 :: 		p2 = 0x80;
	MOV P2+0, #128
;a.c,712 :: 		p3 = 0x83;
	MOV P3+0, #131
;a.c,713 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,715 :: 		p0 = 0xC4;
	MOV P0+0, #196
;a.c,716 :: 		p1 = 0x80;
	MOV P1+0, #128
;a.c,717 :: 		p2 = 0x80;
	MOV P2+0, #128
;a.c,718 :: 		p3 = 0x83;
	MOV P3+0, #131
;a.c,719 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,721 :: 		p0 = 0xC8;
	MOV P0+0, #200
;a.c,722 :: 		p1 = 0x80;
	MOV P1+0, #128
;a.c,723 :: 		p2 = 0x80;
	MOV P2+0, #128
;a.c,724 :: 		p3 = 0x83;
	MOV P3+0, #131
;a.c,725 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,727 :: 		p0 = 0xD0;
	MOV P0+0, #208
;a.c,728 :: 		p1 = 0x80;
	MOV P1+0, #128
;a.c,729 :: 		p2 = 0x80;
	MOV P2+0, #128
;a.c,730 :: 		p3 = 0x83;
	MOV P3+0, #131
;a.c,731 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,733 :: 		p0 = 0xE0;
	MOV P0+0, #224
;a.c,734 :: 		p1 = 0x80;
	MOV P1+0, #128
;a.c,735 :: 		p2 = 0x80;
	MOV P2+0, #128
;a.c,736 :: 		p3 = 0x83;
	MOV P3+0, #131
;a.c,737 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,739 :: 		p0 = 0x80;
	MOV P0+0, #128
;a.c,740 :: 		p1 = 0x80;
	MOV P1+0, #128
;a.c,741 :: 		p2 = 0x80;
	MOV P2+0, #128
;a.c,742 :: 		p3 = 0x83;
	MOV P3+0, #131
;a.c,743 :: 		vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;a.c,744 :: 		}
	RET
; end of _Efect4

_Aprindere_porturi:
;a.c,746 :: 		void Aprindere_porturi() {
;a.c,747 :: 		P0=0xFF;
	MOV P0+0, #255
;a.c,748 :: 		P1=0xFF;
	MOV P1+0, #255
;a.c,749 :: 		P2=0xFF;
	MOV P2+0, #255
;a.c,750 :: 		P3=0xFF;
	MOV P3+0, #255
;a.c,751 :: 		}
	RET
; end of _Aprindere_porturi

_Stingere_porturi:
;a.c,753 :: 		void Stingere_porturi() {
;a.c,754 :: 		P0=0x00;
	MOV P0+0, #0
;a.c,755 :: 		P1=0x00;
	MOV P1+0, #0
;a.c,756 :: 		P2=0x00;
	MOV P2+0, #0
;a.c,757 :: 		P3=0x03;
	MOV P3+0, #3
;a.c,758 :: 		}
	RET
; end of _Stingere_porturi
