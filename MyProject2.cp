#line 1 "D:/Engineering/College/3rd computer/1st term/Embedded systems/Project/MyProject2.c"

sbit LCD_D4 at RD0_bit;
sbit LCD_D5 at RD1_bit;
sbit LCD_D6 at RD2_bit;
sbit LCD_D7 at RD3_bit;
sbit LCD_EN at RD4_bit;
sbit LCD_RS at RD5_bit;

sbit LCD_D4_Direction at TRISD0_bit;
sbit LCD_D5_Direction at TRISD1_bit;
sbit LCD_D6_Direction at TRISD2_bit;
sbit LCD_D7_Direction at TRISD3_bit;
sbit LCD_EN_Direction at TRISD4_bit;
sbit LCD_RS_Direction at TRISD5_bit;

char keypadPort at PORTB;

char ADMIN_KEY[5] = "0000";
char password_input[5];
char stored_pass[5];
char str[7];
unsigned short tries_left = 3;
unsigned short user = 0, admin = 0;
unsigned short i=0;
unsigned short slot=0;
unsigned short addr=0;
unsigned short match_found = 0;
unsigned char key;
unsigned short is_full = 1;
unsigned short id = 0;

enum SystemState {
 STATE_LOGIN,
 STATE_ADMIN,
 STATE_LOCKED
};

enum SystemState current_state = STATE_LOGIN;


char get_mapped_key() {
 key = keypad_key_Click();

 if (key == 0) return 0;

 if (key == 16) return 'M';

 if (key == 1) return '7';
 if (key == 2) return '8';
 if (key == 3) return '9';
 if (key == 5) return '4';
 if (key == 6) return '5';
 if (key == 7) return '6';
 if (key == 9) return '1';
 if (key == 10) return '2';
 if (key == 11) return '3';
 if (key == 14) return '0';

 return 0;
}

void add_user(){
 i = 0;
 id = 0;
 slot = 0;
 addr = 0;
 key;
 is_full = 1;

 lcd_cmd(_LCD_CLEAR);
 lcd_out(1, 1, "New User Key:");

 memset(password_input, 0, 5);
 for (i = 0; i < 4; i++) {
 do {
 key = get_mapped_key();
 } while (key == 0);

 if (key == 'M') {
 current_state = STATE_ADMIN;
 return;
 }
 password_input[i] = key;
 Lcd_out_cp("*");
 }

 for(slot = 0; slot < 64; slot++) {
 addr = slot * 4;
 if (EEPROM_Read(addr) == 0xFF) {
 is_full = 0;
 break;
 }
 id++;
 }

 if (is_full) {
 lcd_cmd(_LCD_CLEAR);
 lcd_out(1, 1, "Memory Full!");
 delay_ms(1000);
 return;
 }

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_out(1, 1, "Saving...");

 for(i = 0; i < 4; i++) {
 EEPROM_Write(addr + i, password_input[i]);
 delay_ms(20);
 }
 ByteToStr(id, str);
 Ltrim(str);
 Lcd_out(1, 1, "User Saved!");
 Lcd_out(2,1,"USER ID: ");
 if (id < 10)
 Lcd_out_cp("0");
 lcd_out_cp(str);
 delay_ms(1000);
}

void delete_user(){
 i = 0;
 id=0;
 slot = 0;
 addr = 0;

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_out(1, 1, "User Key:");

 for (i = 0; i < 2; i++) {
 do {
 key = get_mapped_key();
 } while (key == 0);

 if (key == 'M') {
 current_state = STATE_ADMIN;
 return;
 }
 id = id*10 + (key - '0');
 Lcd_out_cp("*");
 }

 for(slot = 0; slot < 64; slot++) {
 addr = slot * 4;
 if (id == slot) {
 EEPROM_Write(addr, 0xff);
 Lcd_out(1, 1, "Deleting ...");
 delay_ms(20);
 break;
 }
 id++;
 }
 Lcd_out(1, 1, "USER Deleted");
 delay_ms(1000);
}

void login_mode() {
 i=0;
 slot=0;
 addr=0;
 match_found = 0;

 Lcd_Cmd(_LCD_CLEAR);
 portC.f1 = 0;
 portC.f2 = 1;
 if(!user){
 Lcd_out(1, 1, "USER MODE");
 delay_ms(200);
 user = 1;
 admin = 0;
 }
 Lcd_out(1, 1, "Enter Key:");

 memset(password_input, 0, sizeof password_input);
 memset(stored_pass, 0, sizeof stored_pass);

 for (i = 0; i < 4; i++) {
 do {
 key = get_mapped_key();
 } while (key == 0);

 if (key == 'M') {
 current_state = STATE_ADMIN;
 return;
 }
 password_input[i] = key;
 Lcd_out_cp("*");
 }

 for (slot = 0; slot < 64; slot++) {
 addr = slot * 4;

 if (EEPROM_Read(addr) == 0xFF) continue;

 for(i=0; i<4; i++) {
 stored_pass[i] = EEPROM_Read(addr + i);
 delay_ms(10);
 }

 if (strcmp(password_input, stored_pass) == 0) {
 match_found = 1;
 break;
 }
 }

 if (match_found) {
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_out(1, 2, "WELCOME");
 Lcd_out(2, 3, "ACCESS GRANTED");
 portC.f1 = 1;
 portC.f2 = 0;
 delay_ms(200);
 tries_left = 3;
 } else {
 tries_left--;
 if (tries_left <= 0) {
 current_state = STATE_LOCKED;
 return;
 }

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_out(1, 1, "Wrong Password");

 Lcd_out(2, 1, "Tries Left: ");
 ByteToStr(tries_left, str);
 Ltrim(str);
 Lcd_out_cp(str);
 delay_ms(200);
 }
}

void admin_mode() {
 i=0;
 Lcd_Cmd(_LCD_CLEAR);
 portC.f1 = 0;
 portC.f2 = 0;
 if(!admin){
 Lcd_out(1, 1, "ADMIN MODE");
 delay_ms(100);
 admin = 1;
 user = 0;
 }

 Lcd_out(1, 1, "Enter ADMIN Key:");
 lcd_out(2,1," ");
 memset(password_input, 0, sizeof password_input);

 for (i = 0; i < 4; i++) {
 do {
 key = get_mapped_key();
 } while (key == 0);

 if (key == 'M') {
 current_state = STATE_ADMIN;
 return;
 }
 password_input[i] = key;
 Lcd_out_cp("*");
 }

 if (strcmp(password_input, ADMIN_KEY) == 0) {
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_out(1, 2, "WELCOME");
 Lcd_out(2, 3, "ELHEFNAWY");
 delay_ms(200);
 tries_left = 3;
 LCD_OUT(1,1,"1- ADD KEY");
 LCD_OUT(2,1,"2- DELETE KEY");
 do{
 key = get_mapped_key();
 }while(key == 0);
 if(key == '1')
 add_user();
 else
 delete_user();

 } else {
 tries_left--;
 if (tries_left <= 0) {
 current_state = STATE_LOCKED;
 return;
 }

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_out(1, 1, "Wrong Password");

 Lcd_out(2, 1, "Tries Left: ");
 ByteToStr(tries_left, str);
 Ltrim(str);
 Lcd_out_cp(str);
 delay_ms(200);
 }


 current_state = STATE_LOGIN;
}

void suspended_mode() {
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_out(1, 1, "SYSTEM LOCKED");
 Lcd_out(2, 1, "CONTACT ADMIN");

 while(1) {
 portc.f2 = 1;
 }
}


void main() {

 trisc = 0;
 portc = 0;
 portc.f2 = 1;

 Lcd_Init();
 keypad_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Cmd(_LCD_CLEAR);

 Lcd_out(1, 1, "Welcome!!");
 delay_ms(200);

 while(1) {
 switch (current_state) {
 case STATE_LOGIN:
 login_mode();
 break;

 case STATE_ADMIN:
 admin_mode();
 break;

 case STATE_LOCKED:
 suspended_mode();
 break;
 }
 }
}
