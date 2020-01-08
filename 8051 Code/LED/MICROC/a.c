unsigned char oprire, caracter_sosit, comanda, comanda_ant;
unsigned int viteza;
void Efect1(), Efect2(), Efect3(), Efect4(), Aprindere_porturi(), Stingere_porturi();
void main() {
  P0=0x00;
  P1=0x00;
  P2=0x00;
  P3=0x03;
  
  UART1_Init(4800);
  Delay_ms(100);
  viteza=100;
  oprire=0;
  
  while (1) {
    if (UART1_Data_Ready()) {
      caracter_sosit= UART1_Read();
      UART1_Write(caracter_sosit);
      if ((caracter_sosit != 'T') && \
      (caracter_sosit != 'P') && \
      (caracter_sosit != 'F') && \
      (caracter_sosit != 'S'))
      comanda=caracter_sosit;
    else {
      comanda_ant=comanda;
      comanda=caracter_sosit;}
    }
    switch (comanda) {
      case 'F': if (viteza>10) viteza -= 10; comanda=comanda_ant; break;
      case 'S': viteza += 10; comanda=comanda_ant; break;
      case 'P': oprire=0; comanda=comanda_ant; break;
      case 'T': oprire=1; comanda=comanda_ant; break;
      case 'X': Aprindere_porturi(); break;
      case 'Y': Stingere_porturi(); break;
    }
    if (oprire==0) {
      switch (comanda) {
        case '1': Efect1(); break;
        case '2': Efect2(); break;
        case '3': Efect3(); break;
        case '4': Efect4(); break;
      }
    }
  }
}

void Efect1() {
        p0 = 0x00;
        p1 = 0x00;
        p2 = 0x00;
        p3 = 0x03;
        vdelay_ms(viteza);

        p0 = 0x00;
        p1 = 0x80;
        p2 = 0x00;
        p3 = 0x03;
        vdelay_ms(viteza);

        p0 = 0x00;
        p1 = 0x60;
        p2 = 0x00;
        p3 = 0x03;
        vdelay_ms(viteza);

        p0 = 0x01;
        p1 = 0x61;
        p2 = 0x00;
        p3 = 0x03;
        vdelay_ms(viteza);

        p0 = 0x02;
        p1 = 0x62;
        p2 = 0x00;
        p3 = 0x03;
        vdelay_ms(viteza);

        p0 = 0x04;
        p1 = 0x64;
        p2 = 0x00;
        p3 = 0x03;
        vdelay_ms(viteza);

        p0 = 0x08;
        p1 = 0x08;
        p2 = 0x60;
        p3 = 0x03;
        vdelay_ms(viteza);

        p0 = 0x10;
        p1 = 0x10;
        p2 = 0x60;
        p3 = 0x03;
        vdelay_ms(viteza);

        p0 = 0x20;
        p1 = 0x20;
        p2 = 0x61;
        p3 = 0x03;
        vdelay_ms(viteza);

        p0 = 0x40;
        p1 = 0x40;
        p2 = 0x62;
        p3 = 0x03;
        vdelay_ms(viteza);

        p0 = 0x80;
        p1 = 0x80;
        p2 = 0x64;
        p3 = 0x07;
        vdelay_ms(viteza);

        p0 = 0x00;
        p1 = 0x60;
        p2 = 0x08;
        p3 = 0x0B;
        vdelay_ms(viteza);

        p0 = 0x00;
        p1 = 0x60;
        p2 = 0x10;
        p3 = 0x13;
        vdelay_ms(viteza);

        p0 = 0x00;
        p1 = 0x61;
        p2 = 0x21;
        p3 = 0x23;
        vdelay_ms(viteza);

        p0 = 0x00;
        p1 = 0x62;
        p2 = 0x42;
        p3 = 0x43;
        vdelay_ms(viteza);

        p0 = 0x00;
        p1 = 0x64;
        p2 = 0x84;
        p3 = 0x87;
        vdelay_ms(viteza);

        p0 = 0x60;
        p1 = 0x08;
        p2 = 0x08;
        p3 = 0x0B;
        vdelay_ms(viteza);

        p0 = 0x60;
        p1 = 0x10;
        p2 = 0x10;
        p3 = 0x13;
        vdelay_ms(viteza);

        p0 = 0x61;
        p1 = 0x21;
        p2 = 0x21;
        p3 = 0x23;
        vdelay_ms(viteza);

        p0 = 0x62;
        p1 = 0x42;
        p2 = 0x42;
        p3 = 0x43;
        vdelay_ms(viteza);

        p0 = 0x04;
        p1 = 0xE4;
        p2 = 0x84;
        p3 = 0x83;
        vdelay_ms(viteza);

        p0 = 0x08;
        p1 = 0x08;
        p2 = 0x68;
        p3 = 0x03;
        vdelay_ms(viteza);

        p0 = 0x10;
        p1 = 0x10;
        p2 = 0x10;
        p3 = 0x63;
        vdelay_ms(viteza);

        p0 = 0x20;
        p1 = 0x20;
        p2 = 0x20;
        p3 = 0x63;
        vdelay_ms(viteza);

        p0 = 0x40;
        p1 = 0x40;
        p2 = 0x40;
        p3 = 0x63;
        vdelay_ms(viteza);

        p0 = 0x80;
        p1 = 0x80;
        p2 = 0x80;
        p3 = 0x63;
        vdelay_ms(viteza);

        p0 = 0x00;
        p1 = 0x00;
        p2 = 0x60;
        p3 = 0x03;
        vdelay_ms(viteza);

        p0 = 0x01;
        p1 = 0x61;
        p2 = 0x01;
        p3 = 0x03;
        vdelay_ms(viteza);

        p0 = 0x02;
        p1 = 0x62;
        p2 = 0x02;
        p3 = 0x03;
        vdelay_ms(viteza);

        p0 = 0x04;
        p1 = 0x64;
        p2 = 0x04;
        p3 = 0x07;
        vdelay_ms(viteza);

        p0 = 0x08;
        p1 = 0x68;
        p2 = 0x08;
        p3 = 0x0B;
        vdelay_ms(viteza);

        p0 = 0x10;
        p1 = 0x70;
        p2 = 0x10;
        p3 = 0x13;
        vdelay_ms(viteza);

        p0 = 0x20;
        p1 = 0xE0;
        p2 = 0x20;
        p3 = 0x23;
        vdelay_ms(viteza);

        p0 = 0x40;
        p1 = 0xC0;
        p2 = 0x40;
        p3 = 0x43;
        vdelay_ms(viteza);

        p0 = 0x80;
        p1 = 0x80;
        p2 = 0x80;
        p3 = 0x83;
        vdelay_ms(viteza);

        p0 = 0x00;
        p1 = 0x00;
        p2 = 0x00;
        p3 = 0x03;
        vdelay_ms(viteza);

}

void Efect2() {
        p0 = 0x01;
        p1 = 0x00;
        p2 = 0x00;
        p3 = 0x03;
        vdelay_ms(viteza);

        p0 = 0x03;
        p1 = 0x01;
        p2 = 0x00;
        p3 = 0x03;
        vdelay_ms(viteza);

        p0 = 0x07;
        p1 = 0x02;
        p2 = 0x00;
        p3 = 0x03;
        vdelay_ms(viteza);

        p0 = 0x0E;
        p1 = 0x04;
        p2 = 0x00;
        p3 = 0x03;
        vdelay_ms(viteza);

        p0 = 0x1C;
        p1 = 0x08;
        p2 = 0x00;
        p3 = 0x03;
        vdelay_ms(viteza);

        p0 = 0x10;
        p1 = 0x18;
        p2 = 0x10;
        p3 = 0x03;
        vdelay_ms(viteza);

        p0 = 0x20;
        p1 = 0x30;
        p2 = 0x20;
        p3 = 0x03;
        vdelay_ms(viteza);

        p0 = 0x40;
        p1 = 0x60;
        p2 = 0x40;
        p3 = 0x03;
        vdelay_ms(viteza);

        p0 = 0x80;
        p1 = 0xC0;
        p2 = 0x81;
        p3 = 0x03;
        vdelay_ms(viteza);

        p0 = 0x80;
        p1 = 0xC1;
        p2 = 0x83;
        p3 = 0x03;
        vdelay_ms(viteza);

        p0 = 0x80;
        p1 = 0xC2;
        p2 = 0x87;
        p3 = 0x03;
        vdelay_ms(viteza);

        p0 = 0x80;
        p1 = 0xC4;
        p2 = 0x8E;
        p3 = 0x03;
        vdelay_ms(viteza);

        p0 = 0x80;
        p1 = 0xC8;
        p2 = 0x9C;
        p3 = 0x03;
        vdelay_ms(viteza);

        p0 = 0x80;
        p1 = 0xD0;
        p2 = 0xB8;
        p3 = 0x03;
        vdelay_ms(viteza);

        p0 = 0x80;
        p1 = 0xC0;
        p2 = 0xA0;
        p3 = 0x73;
        vdelay_ms(viteza);

        p0 = 0x80;
        p1 = 0xC0;
        p2 = 0xC0;
        p3 = 0xE3;
        vdelay_ms(viteza);

        p0 = 0x80;
        p1 = 0xC1;
        p2 = 0xC1;
        p3 = 0xE3;
        vdelay_ms(viteza);

        p0 = 0x80;
        p1 = 0xC3;
        p2 = 0xC2;
        p3 = 0xE3;
        vdelay_ms(viteza);

        p0 = 0x80;
        p1 = 0xC7;
        p2 = 0xC4;
        p3 = 0xE3;
        vdelay_ms(viteza);

        p0 = 0x80;
        p1 = 0xCE;
        p2 = 0xC8;
        p3 = 0xE3;
        vdelay_ms(viteza);

        p0 = 0x80;
        p1 = 0xDC;
        p2 = 0xD0;
        p3 = 0xE3;
        vdelay_ms(viteza);

        p0 = 0xB0;
        p1 = 0xD0;
        p2 = 0xD0;
        p3 = 0xE3;
        vdelay_ms(viteza);

        p0 = 0xE0;
        p1 = 0xE0;
        p2 = 0xE0;
        p3 = 0xE3;
        vdelay_ms(viteza);

        p0 = 0xE0;
        p1 = 0xE1;
        p2 = 0xE0;
        p3 = 0xE3;
        vdelay_ms(viteza);

        p0 = 0xE0;
        p1 = 0xE3;
        p2 = 0xE0;
        p3 = 0xE3;
        vdelay_ms(viteza);

        p0 = 0xE0;
        p1 = 0xE7;
        p2 = 0xE0;
        p3 = 0xE3;
        vdelay_ms(viteza);

        p0 = 0xF0;
        p1 = 0xF0;
        p2 = 0xF0;
        p3 = 0xF3;
        vdelay_ms(viteza);

        p0 = 0xF1;
        p1 = 0xF0;
        p2 = 0xF0;
        p3 = 0xF3;
        vdelay_ms(viteza);

        p0 = 0xF3;
        p1 = 0xF1;
        p2 = 0xF0;
        p3 = 0xF3;
        vdelay_ms(viteza);

        p0 = 0xF7;
        p1 = 0xF2;
        p2 = 0xF0;
        p3 = 0xF3;
        vdelay_ms(viteza);

        p0 = 0xF8;
        p1 = 0xFC;
        p2 = 0xF8;
        p3 = 0xF3;
        vdelay_ms(viteza);

        p0 = 0xF8;
        p1 = 0xFC;
        p2 = 0xF9;
        p3 = 0xF3;
        vdelay_ms(viteza);

        p0 = 0xF9;
        p1 = 0xFD;
        p2 = 0xFB;
        p3 = 0xF3;
        vdelay_ms(viteza);

        p0 = 0xFA;
        p1 = 0xFE;
        p2 = 0xFE;
        p3 = 0xF3;
        vdelay_ms(viteza);
}

void Efect3() {
        p0 = 0x00;
        p1 = 0x00;
        p2 = 0x00;
        p3 = 0x03;
        vdelay_ms(viteza);

        p0 = 0x01;
        p1 = 0x00;
        p2 = 0x00;
        p3 = 0x83;
        vdelay_ms(viteza);

        p0 = 0x02;
        p1 = 0x01;
        p2 = 0x80;
        p3 = 0x43;
        vdelay_ms(viteza);

        p0 = 0x04;
        p1 = 0x82;
        p2 = 0x41;
        p3 = 0x23;
        vdelay_ms(viteza);

        p0 = 0x04;
        p1 = 0xC4;
        p2 = 0x23;
        p3 = 0x23;
        vdelay_ms(viteza);

        p0 = 0xC8;
        p1 = 0x28;
        p2 = 0x14;
        p3 = 0x13;
        vdelay_ms(viteza);

        p0 = 0x30;
        p1 = 0x18;
        p2 = 0x0E;
        p3 = 0x07;
        vdelay_ms(viteza);

        p0 = 0x10;
        p1 = 0x10;
        p2 = 0x0C;
        p3 = 0x03;
        vdelay_ms(viteza);

        p0 = 0x00;
        p1 = 0x08;
        p2 = 0x08;
        p3 = 0x03;
        vdelay_ms(viteza);

        p0 = 0x00;
        p1 = 0x18;
        p2 = 0x18;
        p3 = 0x03;
        vdelay_ms(viteza);

        p0 = 0x18;
        p1 = 0x24;
        p2 = 0x24;
        p3 = 0x1B;
        vdelay_ms(viteza);

        p0 = 0x24;
        p1 = 0x42;
        p2 = 0x42;
        p3 = 0x27;
        vdelay_ms(viteza);

        p0 = 0x42;
        p1 = 0x81;
        p2 = 0x81;
        p3 = 0x43;
        vdelay_ms(viteza);

        p0 = 0x81;
        p1 = 0x00;
        p2 = 0x00;
        p3 = 0x83;
        vdelay_ms(viteza);

        p0 = 0x00;
        p1 = 0x00;
        p2 = 0x00;
        p3 = 0x03;
        vdelay_ms(viteza);
}

void Efect4() {
        p0 = 0xE0;
        p1 = 0xE0;
        p2 = 0xE0;
        p3 = 0xE3;
        vdelay_ms(viteza);

        p0 = 0xE1;
        p1 = 0xE0;
        p2 = 0xE0;
        p3 = 0xE3;
        vdelay_ms(viteza);

        p0 = 0xE2;
        p1 = 0xE0;
        p2 = 0xE0;
        p3 = 0xE3;
        vdelay_ms(viteza);

        p0 = 0xE4;
        p1 = 0xE0;
        p2 = 0xE0;
        p3 = 0xE3;
        vdelay_ms(viteza);

        p0 = 0xE8;
        p1 = 0xE0;
        p2 = 0xE1;
        p3 = 0xE3;
        vdelay_ms(viteza);

        p0 = 0xF0;
        p1 = 0xE0;
        p2 = 0xE2;
        p3 = 0xE3;
        vdelay_ms(viteza);

        p0 = 0xC0;
        p1 = 0xE0;
        p2 = 0xE4;
        p3 = 0xE3;
        vdelay_ms(viteza);

        p0 = 0xC0;
        p1 = 0xE1;
        p2 = 0xE8;
        p3 = 0xE3;
        vdelay_ms(viteza);

        p0 = 0xC0;
        p1 = 0xE2;
        p2 = 0xF0;
        p3 = 0xE3;
        vdelay_ms(viteza);

        p0 = 0xC0;
        p1 = 0xE4;
        p2 = 0xC0;
        p3 = 0xE3;
        vdelay_ms(viteza);

        p0 = 0xC0;
        p1 = 0xE8;
        p2 = 0xC0;
        p3 = 0xE7;
        vdelay_ms(viteza);

        p0 = 0xC0;
        p1 = 0xF0;
        p2 = 0xC0;
        p3 = 0xEB;
        vdelay_ms(viteza);

        p0 = 0xC0;
        p1 = 0xC0;
        p2 = 0xC0;
        p3 = 0xF3;
        vdelay_ms(viteza);

        p0 = 0xC0;
        p1 = 0xC0;
        p2 = 0xC1;
        p3 = 0xC3;
        vdelay_ms(viteza);

        p0 = 0xC0;
        p1 = 0xC0;
        p2 = 0xC2;
        p3 = 0xC3;
        vdelay_ms(viteza);

        p0 = 0xC0;
        p1 = 0xC0;
        p2 = 0xC4;
        p3 = 0xC3;
        vdelay_ms(viteza);

        p0 = 0xC0;
        p1 = 0xC1;
        p2 = 0xC8;
        p3 = 0xC3;
        vdelay_ms(viteza);

        p0 = 0xC0;
        p1 = 0xC2;
        p2 = 0xD0;
        p3 = 0xC3;
        vdelay_ms(viteza);

        p0 = 0xC0;
        p1 = 0xC4;
        p2 = 0xE0;
        p3 = 0xC3;
        vdelay_ms(viteza);

        p0 = 0xC0;
        p1 = 0xC8;
        p2 = 0x80;
        p3 = 0xC3;
        vdelay_ms(viteza);

        p0 = 0xC0;
        p1 = 0xD0;
        p2 = 0x80;
        p3 = 0xC7;
        vdelay_ms(viteza);

        p0 = 0xC0;
        p1 = 0xE0;
        p2 = 0x80;
        p3 = 0xCB;
        vdelay_ms(viteza);

        p0 = 0xC0;
        p1 = 0x80;
        p2 = 0x80;
        p3 = 0xD3;
        vdelay_ms(viteza);

        p0 = 0xC1;
        p1 = 0x80;
        p2 = 0x80;
        p3 = 0xE3;
        vdelay_ms(viteza);

        p0 = 0xC2;
        p1 = 0x80;
        p2 = 0x80;
        p3 = 0x83;
        vdelay_ms(viteza);

        p0 = 0xC4;
        p1 = 0x80;
        p2 = 0x80;
        p3 = 0x83;
        vdelay_ms(viteza);

        p0 = 0xC8;
        p1 = 0x80;
        p2 = 0x80;
        p3 = 0x83;
        vdelay_ms(viteza);

        p0 = 0xD0;
        p1 = 0x80;
        p2 = 0x80;
        p3 = 0x83;
        vdelay_ms(viteza);

        p0 = 0xE0;
        p1 = 0x80;
        p2 = 0x80;
        p3 = 0x83;
        vdelay_ms(viteza);

        p0 = 0x80;
        p1 = 0x80;
        p2 = 0x80;
        p3 = 0x83;
        vdelay_ms(viteza);
}

void Aprindere_porturi() {
        P0=0xFF;
        P1=0xFF;
        P2=0xFF;
        P3=0xFF;
}

void Stingere_porturi() {
        P0=0x00;
        P1=0x00;
        P2=0x00;
        P3=0x03;
}
