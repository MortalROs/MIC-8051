sbit Chip_Select at P1_1_bit;
//sbit Chip_Select_Direction at TRISC0_bit;
// End Serial 7-seg Display connections
unsigned int zz,ss,mm;
unsigned char caracter_sosit,oprire;
void afiseaza_ora(), max7219_init1();

void max7219_init1() {
  Chip_Select = 0; // SELECT MAX
  SPI1_write(0x09); // BCD mode for digit decoding
  SPI1_write(0xFF);
  Chip_Select = 1; // DESELECT MAX
  Chip_Select = 0; // SELECT MAX
  SPI1_write(0x0A);
  SPI1_write(0x0F); // Segment luminosity intensity
  Chip_Select = 1; // DESELECT MAX
  Chip_Select = 0; // SELECT MAX
  SPI1_write(0x0B);
  SPI1_write(0x07); // Display refresh
  Chip_Select = 1; // DESELECT MAX
  Chip_Select = 0; // SELECT MAX
  SPI1_write(0x0C);
  SPI1_write(0x01); // Turn on the display
  Chip_Select = 1; // DESELECT MAX
  Chip_Select = 0; // SELECT MAX
  SPI1_write(0x00);
  SPI1_write(0xFF); // No test
  Chip_Select = 1; // DESELECT MAX
}
void afiseaza_ora(unsigned int sutimi, unsigned int secunde, unsigned int minute) {
  Chip_Select = 0; // select max7219
  SPI1_write(8); // zeci de minute
  SPI1_write((minute/10)%10);
  Chip_Select = 1; // deselect max7219
  Chip_Select = 0; // select max7219
  SPI1_write(7);
  SPI1_write(minute%10); // minute
  Chip_Select = 1; // deselect max7219
  Chip_Select = 0; // select max7219
  SPI1_write(6);
  SPI1_write(0x0A); // -
  Chip_Select = 1; // deselect max7219
  Chip_Select = 0; // select max7219
  SPI1_write(5);
  SPI1_write((secunde/10)%10); // zeci de secunde
  Chip_Select = 1; // deselect max7219
  Chip_Select = 0; // select max7219
  SPI1_write(4); //
  SPI1_write(secunde%10); // secunde
  Chip_Select = 1; // deselect max7219
  Chip_Select = 0; // select max7219
  SPI1_write(3); //
  SPI1_write(0x0A); // -
  Chip_Select = 1; // deselect max7219
  Chip_Select = 0; // select max7219
  SPI1_write(2); // zecimi secunda
  SPI1_write((sutimi/10)%10);
  Chip_Select = 1; // deselect max7219
  Chip_Select = 0; // select max7219
  SPI1_write(1); // sutimi secunda
  SPI1_write(sutimi%10);
  Chip_Select = 1; // deselect max7219
}

void main() {
  zz=0;
  ss=0;
  mm=0;
  oprire=0;
  Uart1_Init(4800);
  Delay_ms(100);
  SPI1_Init();
  max7219_init1();

  while(1){
    if (UART1_Data_Ready()) {
      caracter_sosit=UART1_Read();
      UART1_Write(caracter_sosit);
    }
    switch (caracter_sosit) {
      case 'P': oprire=0; break;
      case 'O': oprire=1; break;
      case 'R': zz=0;ss=0; mm=0; caracter_sosit='M'; afiseaza_ora(zz,ss,mm); break;
    }
    if (oprire==0) {
      delay_ms(10);
      zz=zz+1;
      if (zz==100) {
        zz=0;
        ss=ss+1;
        if (ss==60) {
          ss=0;
          mm=mm+1;
          if (mm==60) {
            mm=0;
          }
        }
      }
      afiseaza_ora(zz,ss,mm);
    }
  }
}
