// Glcd module connections
char GLCD_DataPort at P2;
sbit GLCD_CS1 at P0_2_bit;
sbit GLCD_CS2 at P0_3_bit;
sbit GLCD_RS at P0_4_bit;
sbit GLCD_RW at P0_5_bit;
sbit GLCD_EN at P0_6_bit;
sbit GLCD_RST at P0_7_bit;
// End Glcd module connections
unsigned char oprire, caracter_sosit, comanda, comanda_ant;
unsigned int viteza;                                                 s
unsigned short i;
char *afisare;

void main() {
  UART1_Init(4800);
  Delay_ms(100);
  viteza=500;
  oprire=1;
  comanda='A';
  Glcd_Init(); // Initialize GLCD
  Glcd_Fill(0x00); // Clear GLCD
  Glcd_Set_Font(Character8x7, 8, 7, 32); // setare font, latime 8, inaltime 7, offset 32
  afisare = "MortalROs";
  
  while(1) {
    if (UART1_Data_Ready()) { // Daca se receptioneaza informatii
      caracter_sosit= UART1_Read(); // Se citesc
      UART1_Write(caracter_sosit); // Trimite informatiile prin UART
      if ((caracter_sosit == 'A') || (caracter_sosit == 'D')) {
        comanda=caracter_sosit;
      }
      switch(caracter_sosit) {
        case 'W': if (viteza>50) viteza -= 50; break;
        case 'S': viteza += 50; break;
        case 'P': oprire=0; break;
        case 'O': oprire=1; break;
      }
    }
    switch(comanda) {
      case 'A': {
      if (oprire==0){
        Glcd_Fill(0x00);
        i=i-5;
        Glcd_Write_Text(afisare, i, 3, 1); // Scrie txt_afis in pozitia i, pagina 3, culoare inversata
        Vdelay_ms(viteza);
      }} break;
      case 'D': {
        if (oprire==0)
        {
          Glcd_Fill(0x00);
          i=i+5;
          Glcd_Write_Text(afisare, i, 3, 1); // Scrie txt_afis in pozitia i, pagina 3, culoare inversata
          Vdelay_ms(viteza);
        }}break;
    }
  }
}
