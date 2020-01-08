
_main:
	MOV SP+0, #128
;graf.c,15 :: 		void main() {
;graf.c,16 :: 		UART1_Init(4800);
	ORL PCON+0, #128
	MOV TH1+0, #245
	MOV TL1+0, #245
	LCALL _UART1_Init+0
;graf.c,17 :: 		Delay_ms(100);
	MOV R6, 163
	MOV R7, 30
	DJNZ R7, 
	DJNZ R6, 
	NOP
;graf.c,18 :: 		viteza=500;
	MOV _viteza+0, #244
	MOV _viteza+1, #1
;graf.c,19 :: 		oprire=1;
	MOV _oprire+0, #1
;graf.c,20 :: 		comanda='A';
	MOV _comanda+0, #65
;graf.c,21 :: 		Glcd_Init(); // Initialize GLCD
	LCALL _Glcd_Init+0
;graf.c,22 :: 		Glcd_Fill(0x00); // Clear GLCD
	MOV FARG_Glcd_Fill_pattern+0, #0
	LCALL _Glcd_Fill+0
;graf.c,23 :: 		Glcd_Set_Font(Character8x7, 8, 7, 32); // setare font, latime 8, inaltime 7, offset 32
	MOV FARG_Glcd_Set_Font_activeFont+0, #_Character8x7+0
	MOV FARG_Glcd_Set_Font_activeFont+1, hi(#_Character8x7+0)
	MOV FARG_Glcd_Set_Font_aFontWidth+0, #8
	MOV FARG_Glcd_Set_Font_aFontHeight+0, #7
	MOV FARG_Glcd_Set_Font_aFontOffs+0, #32
	MOV FARG_Glcd_Set_Font_aFontOffs+1, #0
	LCALL _Glcd_Set_Font+0
;graf.c,24 :: 		afisare = "MortalROs";
	MOV _afisare+0, #?lstr1_graf+0
;graf.c,26 :: 		while(1) {
L_main0:
;graf.c,27 :: 		if (UART1_Data_Ready()) { // Daca se receptioneaza informatii
	LCALL _UART1_Data_Ready+0
	MOV A, R0
	JNZ #3
	LJMP L_main2
;graf.c,28 :: 		caracter_sosit= UART1_Read(); // Se citesc
	LCALL _UART1_Read+0
	MOV _caracter_sosit+0, 0
;graf.c,29 :: 		UART1_Write(caracter_sosit); // Trimite informatiile prin UART
	MOV FARG_UART1_Write_data_+0, 0
	LCALL _UART1_Write+0
;graf.c,30 :: 		if ((caracter_sosit == 'A') || (caracter_sosit == 'D')) {
	MOV A, _caracter_sosit+0
	XRL A, #65
	JZ L__main19
	MOV A, _caracter_sosit+0
	XRL A, #68
	JZ L__main19
	SJMP L_main5
L__main19:
;graf.c,31 :: 		comanda=caracter_sosit;
	MOV _comanda+0, _caracter_sosit+0
;graf.c,32 :: 		}
L_main5:
;graf.c,33 :: 		switch(caracter_sosit) {
	SJMP L_main6
;graf.c,34 :: 		case 'W': if (viteza>50) viteza -= 50; break;
L_main8:
	SETB C
	MOV A, _viteza+0
	SUBB A, #50
	MOV A, _viteza+1
	SUBB A, #0
	JC L_main9
	CLR C
	MOV A, _viteza+0
	SUBB A, #50
	MOV _viteza+0, A
	MOV A, _viteza+1
	SUBB A, #0
	MOV _viteza+1, A
L_main9:
	SJMP L_main7
;graf.c,35 :: 		case 'S': viteza += 50; break;
L_main10:
	MOV A, #50
	ADD A, _viteza+0
	MOV _viteza+0, A
	MOV A, #0
	ADDC A, _viteza+1
	MOV _viteza+1, A
	SJMP L_main7
;graf.c,36 :: 		case 'P': oprire=0; break;
L_main11:
	MOV _oprire+0, #0
	SJMP L_main7
;graf.c,37 :: 		case 'O': oprire=1; break;
L_main12:
	MOV _oprire+0, #1
	SJMP L_main7
;graf.c,38 :: 		}
L_main6:
	MOV A, _caracter_sosit+0
	XRL A, #87
	JZ L_main8
	MOV A, _caracter_sosit+0
	XRL A, #83
	JZ L_main10
	MOV A, _caracter_sosit+0
	XRL A, #80
	JZ L_main11
	MOV A, _caracter_sosit+0
	XRL A, #79
	JZ L_main12
L_main7:
;graf.c,39 :: 		}
L_main2:
;graf.c,40 :: 		switch(comanda) {
	SJMP L_main13
;graf.c,41 :: 		case 'A': {
L_main15:
;graf.c,42 :: 		if (oprire==0){
	MOV A, _oprire+0
	JNZ L_main16
;graf.c,43 :: 		Glcd_Fill(0x00);
	MOV FARG_Glcd_Fill_pattern+0, #0
	LCALL _Glcd_Fill+0
;graf.c,44 :: 		i=i-5;
	CLR C
	MOV A, _i+0
	SUBB A, #5
	MOV R0, A
	MOV _i+0, 0
;graf.c,45 :: 		Glcd_Write_Text(afisare, i, 3, 1); // Scrie txt_afis in pozitia i, pagina 3, culoare inversata
	MOV FARG_Glcd_Write_Text_text+0, _afisare+0
	MOV FARG_Glcd_Write_Text_x_pos+0, 0
	MOV FARG_Glcd_Write_Text_page_num+0, #3
	MOV FARG_Glcd_Write_Text_color+0, #1
	LCALL _Glcd_Write_Text+0
;graf.c,46 :: 		Vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;graf.c,47 :: 		}} break;
L_main16:
	SJMP L_main14
;graf.c,48 :: 		case 'D': {
L_main17:
;graf.c,49 :: 		if (oprire==0)
	MOV A, _oprire+0
	JNZ L_main18
;graf.c,51 :: 		Glcd_Fill(0x00);
	MOV FARG_Glcd_Fill_pattern+0, #0
	LCALL _Glcd_Fill+0
;graf.c,52 :: 		i=i+5;
	MOV A, _i+0
	ADD A, #5
	MOV R0, A
	MOV _i+0, 0
;graf.c,53 :: 		Glcd_Write_Text(afisare, i, 3, 1); // Scrie txt_afis in pozitia i, pagina 3, culoare inversata
	MOV FARG_Glcd_Write_Text_text+0, _afisare+0
	MOV FARG_Glcd_Write_Text_x_pos+0, 0
	MOV FARG_Glcd_Write_Text_page_num+0, #3
	MOV FARG_Glcd_Write_Text_color+0, #1
	LCALL _Glcd_Write_Text+0
;graf.c,54 :: 		Vdelay_ms(viteza);
	MOV FARG_VDelay_ms_Time_ms+0, _viteza+0
	MOV FARG_VDelay_ms_Time_ms+1, _viteza+1
	LCALL _VDelay_ms+0
;graf.c,55 :: 		}}break;
L_main18:
	SJMP L_main14
;graf.c,56 :: 		}
L_main13:
	MOV A, _comanda+0
	XRL A, #65
	JZ L_main15
	MOV A, _comanda+0
	XRL A, #68
	JZ L_main17
L_main14:
;graf.c,57 :: 		}
	LJMP L_main0
;graf.c,58 :: 		}
	SJMP #254
; end of _main
