unsigned char oprire, caracter_sosit, comanda, comanda_ant;
unsigned int viteza;
// LCD module connections
sbit LCD_RS at P1_2_bit;
sbit LCD_EN at P1_5_bit;
sbit LCD_D4 at P3_4_bit;
sbit LCD_D5 at P3_5_bit;
sbit LCD_D6 at P3_6_bit;
sbit LCD_D7 at P3_7_bit;
// End LCD module connections
char afisare[] = "MortalROs";
void main() {
  UART1_Init(4800); // Initialize UART module at 4800 bps
  Delay_ms(1000); // Wait for UART module to stabilize
  viteza=500;
  oprire=0;
  Lcd_Init(); // Initializare LCD37
  Lcd_Cmd(_LCD_CLEAR); // Clear display
  Lcd_Cmd(_LCD_CURSOR_OFF); // Cursor off
  LCD_Out (1,17,afisare); // Afisare continut variabila 'afisare' la pe randul I la pozitia 17
  Delay_ms(10);
  
  while (1) {
    if (UART1_Data_Ready()) { // Daca se receptioneaza informatii
    caracter_sosit= UART1_Read(); // Se citeste
    UART1_Write(caracter_sosit); // ECHO REPLY
    if ((caracter_sosit != 'W') && \
    (caracter_sosit != 'S') && \
    (caracter_sosit != 'P') && \
    (caracter_sosit != 'O') && \
    (caracter_sosit != 'A') && \
    (caracter_sosit != 'D'))
      comanda=caracter_sosit;
    else {
      comanda_ant=comanda;
      comanda=caracter_sosit;}
    }
    switch (comanda) {
      case 'W': if (viteza>100) viteza -= 100; comanda=comanda_ant; break; //creste viteza
      case 'S': viteza += 100; comanda=comanda_ant; break; //scade viteza
      case 'P': oprire=0; comanda=comanda_ant; break; //porneste (=0)
      case 'O': oprire=1; comanda=comanda_ant; break; //opreste (=1)
      case 'A': {
        if (oprire==0) //deplasare stanga
          Lcd_Cmd(_LCD_SHIFT_LEFT);
        vdelay_ms(viteza); }; break;
      case 'D': {
        if (oprire==0) //deplasare dreapta
          Lcd_Cmd(_LCD_SHIFT_RIGHT);
        vdelay_ms(viteza); }; break;
    }
  }
}
