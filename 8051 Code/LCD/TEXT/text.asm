
_main:
	MOV SP+0, #128
;text.c,12 :: 		void main() {
;text.c,13 :: 		UART1_Init(4800); // Initialize UART module at 4800 bps
	ORL PCON+0, #128
	MOV TH1+0, #245
	MOV TL1+0, #245
	LCALL _UART1_Init+0
;text.c,14 :: 		Delay_ms(1000); // Wait for UART module to stabilize
	MOV R5, 7
	MOV R6, 86
	MOV R7, 60
	DJNZ R7, 
	DJNZ R6, 
	DJNZ R5, 
;text.c,15 :: 		viteza=500;
	MOV _viteza+0, #244
	MOV _viteza+1, #1
;text.c,16 :: 		oprire=0;
	MOV _oprire+0, #0
;text.c,17 :: 		Lcd_Init(); // Initializare LCD37
	LCALL _Lcd_Init+0
;text.c,18 :: 		Lcd_Cmd(_LCD_CLEAR); // Clear display
	MOV FARG_Lcd_Cmd_out_char+0, #1
	LCALL _Lcd_Cmd+0
;text.c,19 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // Cursor off
	MOV FARG_Lcd_Cmd_out_char+0, #12
	LCALL _Lcd_Cmd+0
;text.c,20 :: 		LCD_Out (1,17,afisare); // Afisare continut variabila 'afisare' la pe randul I la pozitia 17
	MOV FARG_LCD_Out_row+0, #1
	MOV FARG_LCD_Out_column+0, #17
	MOV FARG_LCD_Out_text+0, #_afisare+0
	LCALL _LCD_Out+0
;text.c,21 :: 		Delay_ms(10);
	MOV R6, 17
	MOV R7, 52
	DJNZ R7, 
	DJNZ R6, 
	NOP
;text.c,23 :: 		while (1) {
L_main0:
;text.c,24 :: 		if (UART1_Data_Ready()) { // Daca se receptioneaza informatii
	LCALL _UART1_Data_Ready+0
	MOV A, R0
	JZ L_main2
;text.c,25 :: 		caracter_sosit= UART1_Read(); // Se citeste
	LCALL _UART1_Read+0
	MOV _caracter_sosit+0, 0
;text.c,26 :: 		UART1_Write(caracter_sosit); // ECHO REPLY
	MOV FARG_UART1_Write_data_+0, 0
	LCALL _UART1_Write+0
;text.c,32 :: 		(caracter_sosit != 'D'))
	MOV A, _caracter_sosit+0
	XRL A, #87
	JZ L_main5
	MOV A, _caracter_sosit+0
	XRL A, #83
	JZ L_main5
	MOV A, _caracter_sosit+0
	XRL A, #80
	JZ L_main5
	MOV A, _caracter_sosit+0
	XRL A, #79
	JZ L_main5
	MOV A, _caracter_sosit+0
	XRL A, #65
	JZ L_main5
	MOV A, _caracter_sosit+0
	XRL A, #68
	JZ L_main5
L__main18:
;text.c,33 :: 		comanda=caracter_sosit;
	MOV _comanda+0, _caracter_sosit+0
	SJMP L_main6
L_main5:
;text.c,35 :: 		comanda_ant=comanda;
	MOV _comanda_ant+0, _comanda+0
;text.c,36 :: 		comanda=caracter_sosit;}
	MOV _comanda+0, _caracter_sosit+0
L_main6:
;text.c,37 :: 		}
L_main2:
;text.c,38 :: 		switch (comanda) {
	SJMP L_main7
;text.c,39 :: 		case 'W': if (viteza>100) viteza -= 100; comanda=comanda_ant; break; //creste viteza
L_main9:
	SETB C
	MOV A, _viteza+0
	SUBB A, #100
	MOV A, _viteza+1
	SUBB A, #0
	JC L_main10
	CLR C
	MOV A, _viteza+0
	SUBB A, #100
	MOV _viteza+0, A
	MOV A, _viteza+1
	SUBB A, #0
	MOV _viteza+1, A
L_main10:
	MOV _comanda+0, _comanda_ant+0
	LJMP L_main8
;text.c,40 :: 		case 'S': viteza += 100; comanda=comanda_ant; break; //scade viteza
L_main11:
	MOV A, #100
	ADD A, _viteza+0
	MOV _viteza+0, A
	MOV A, #0
	ADDC A, _viteza+1
	MOV _viteza+1, A
	MOV _comanda+0, _comanda_ant+0
	SJMP L_main8
;text.c,41 :: 		case 'P': oprire=0; comanda=comanda_ant; break; //porneste (=0)
L_main12:
	MOV _oprire+0, #0
	MOV _comanda+0, _comanda_ant+0
	SJMP L_main8
;text.c,42 :: 		case 'O': oprire=1; comanda=comanda_ant; break; //opreste (=1)
L_main13:
	MOV _oprire+0, #1
	MOV _comanda+0, _comanda_ant+0
	SJMP L_main8
;text.c,43 :: 		case 'A': {
L_main14:
;text.c,44 :: 		if (oprire==0) //deplasare stanga
	MOV A, _oprire+0
	JNZ L_main15
;text.c,45 :: 		Lcd_Cmd(_LCD_SHIFT_LEFT);
	MOV FARG_Lcd_Cmd_out_char+0, #24
	LCALL _Lcd_Cmd+0
L_main15:
;text.c,46 :: 		vdelay_ms(viteza); }; break;
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
	SJMP L_main8
;text.c,47 :: 		case 'D': {
L_main16:
;text.c,48 :: 		if (oprire==0) //deplasare dreapta
	MOV A, _oprire+0
	JNZ L_main17
;text.c,49 :: 		Lcd_Cmd(_LCD_SHIFT_RIGHT);
	MOV FARG_Lcd_Cmd_out_char+0, #28
	LCALL _Lcd_Cmd+0
L_main17:
;text.c,50 :: 		vdelay_ms(viteza); }; break;
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
	SJMP L_main8
;text.c,51 :: 		}
L_main7:
	MOV A, _comanda+0
	XRL A, #87
	JZ L_main9
	MOV A, _comanda+0
	XRL A, #83
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
	XRL A, #68
	JZ L_main16
L_main8:
;text.c,52 :: 		}
	LJMP L_main0
;text.c,53 :: 		}
	SJMP #254
; end of _main
