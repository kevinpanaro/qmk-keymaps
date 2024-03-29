/*
Copyright 2021 Kevin Panaro

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#pragma once

#include "config_common.h"

/* USB Device descriptor parameter */
#define VENDOR_ID    0xB00F
#define PRODUCT_ID   0xB00F
#define DEVICE_VER   0x0001
#define MANUFACTURER Kevin Panaro
#define PRODUCT      macropad

/* key matrix size */
#define MATRIX_ROWS 4
#define MATRIX_COLS 4

/*
 * Keyboard Matrix Assignments
 *
 * Change this to how you wired your keyboard
 * COLS: AVR pins used for columns, left to right
 * ROWS: AVR pins used for rows, top to bottom
 * DIODE_DIRECTION: COL2ROW = COL = Anode (+), ROW = Cathode (-, marked on diode)
 *                  ROW2COL = ROW = Anode (+), COL = Cathode (-, marked on diode)
 * UNUSED_PINS: pins that are not used, for reference
 */
#define MATRIX_ROW_PINS { D4, B5, C7, F0 }
#define MATRIX_COL_PINS { C6, B4, F1, B6 }
#define UNUSED_PINS     { D3, D2, B7, D5, B2, B3, B1, F7, F6, F5, B0 }

/* COL2ROW, ROW2COL */
#define DIODE_DIRECTION COL2ROW


/* Debounce reduces chatter (unintended double-presses) - set 0 if debouncing is not needed */
#define DEBOUNCE 5


/* Mechanical locking support. Use KC_LCAP, KC_LNUM or KC_LSCR instead in keymap */
#define LOCKING_SUPPORT_ENABLE
/* Locking resynchronize hack */
#define LOCKING_RESYNC_ENABLE


/* disable these deprecated features by default */
#define NO_ACTION_MACRO
#define NO_ACTION_FUNCTION

// OLED Config
#define OLED_DISPLAY_ADDRESS 0x3C
#define OLED_DISPLAY_128X64

// Rotary Encoder
#define ENCODERS_PAD_A { D7 }
#define ENCODERS_PAD_B { E6 }
#define ENCODER_RESOLUTION 4
