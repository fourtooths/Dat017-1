
#include "defines.h"
#include "globals.h"

void ascii_ctrl_bit_set(unsigned char x) {
    GPIO_E.odrLow |= x | B_SELECT;
}

void ascii_ctrl_bit_clear(unsigned char x) {
    GPIO_E.odrLow &= (~x | B_SELECT);
}

void ascii_write_controller(unsigned char command) {
    delay_250ns();
    ascii_ctrl_bit_set(B_E);
    GPIO_E.odrHigh = command;
    delay_250ns();
    ascii_ctrl_bit_clear(B_E);
    delay_250ns();
}

unsigned char ascii_read_controller(void) {
    ascii_ctrl_bit_set(B_E);
    delay_250ns();
    delay_250ns();
    unsigned char rv = GPIO_E.idrHigh;
    ascii_ctrl_bit_clear(B_E);
    return rv;
}

void ascii_write_cmd(unsigned char command) {
    ascii_ctrl_bit_clear(B_RS | B_RW);
    ascii_write_controller(command);
}

void ascii_write_data(unsigned char data) {
    ascii_ctrl_bit_set(B_RS);
    ascii_ctrl_bit_clear(B_RW);
    ascii_write_controller(data);
}

unsigned char ascii_read_status(void) {
    GPIO_E.moder = 0x00005555;
    ascii_ctrl_bit_clear(B_RS);
    ascii_ctrl_bit_set(B_RW);
    unsigned char rv = ascii_read_controller();
    GPIO_E.moder = 0x55555555;
}

unsigned char ascii_read_data(void) {
    GPIO_E.moder = 0x00005555;
    ascii_ctrl_bit_set(B_RW | B_RS);
    unsigned char rv = ascii_read_controller();
    GPIO_E.moder = 0x55555555;
}

void ascii_command(unsigned char command) {
    while ((ascii_read_status() & 0x80) == 0x80);
    delay_mikro(8);
    ascii_write_cmd(command);
}

void function_set() {
    ascii_command(0x38);
    delay_milli(2);
}

void display_control(void) {
    ascii_command(0x0E);
    delay_mikro(39);
}

void clear_display(void) {
    ascii_command(0x01);
    delay_milli(2);
}

void entry_mode_set(void) {
    ascii_command(0x06);
    delay_mikro(39);
}

void ascii_init(void) {
    function_set();
    display_control();
    clear_display();
    entry_mode_set();
}

void ascii_gotoxy(unsigned int x, unsigned int y) {
    unsigned int address = x - 1;
    if (y == 2) {
        address += 0x40;
    }
    ascii_command(address | 0x80);
    delay_mikro(39);
}

void ascii_write_char(unsigned char c) {
    ascii_write_data(c);
    delay_mikro(43);
}
