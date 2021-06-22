#include QMK_KEYBOARD_H
#include "keymap_steno.h"

#define A_A LOPT_T(KC_A)
#define SU_O LCTL_T(KC_O)
#define S_E LSFT_T(KC_E)
#define C_U LCMD_T(KC_U)
#define A_S ROPT_T(KC_S)
#define SU_N RCTL_T(KC_N)
#define S_T RSFT_T(KC_T)
#define C_H RCMD_T(KC_H)

#define base_layer 0
#define symbols 1
#define navigation 2
#define fn_row 3
#define numbers 4
#define steno 5


#define L1_SPC LT(1, KC_SPC)
#define L2_SPC LT(2, KC_SPC)
#define L3 MO(3)
#define L4 MO(4)

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

  [base_layer] = LAYOUT(
  //┌────────┬────────┬────────┬────────┬────────┬────────┐                          ┌────────┬────────┬────────┬────────┬────────┬────────┐
      KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,                              KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,
  //├────────┼────────┼────────┼────────┼────────┼────────┤                          ├────────┼────────┼────────┼────────┼────────┼────────┤
      KC_TAB, KC_QUOT, KC_COMM,  KC_DOT,   KC_P,    KC_Y,                               KC_F,    KC_G,    KC_C,    KC_R,    KC_L,   KC_BSPC,
  //├────────┼────────┼────────┼────────┼────────┼────────┤                          ├────────┼────────┼────────┼────────┼────────┼────────┤
      KC_ESC,   A_A,     SU_O,    S_E,     C_U,     KC_I,                               KC_D,     C_H,     S_T,     SU_N,    A_S,    KC_ENT,
  //├────────┼────────┼────────┼────────┼────────┼────────┼────────┐        ┌────────┼────────┼────────┼────────┼────────┼────────┼────────┤
    KC_RSFT,  KC_SCLN,   KC_Q,    KC_J,    KC_K,    KC_X,   KC_NO,            KC_NO,    KC_B,    KC_M,    KC_W,    KC_V,    KC_Z,   KC_RSFT,
  //└────────┴────────┴────────┴───┬────┴───┬────┴───┬────┴───┬────┘        └───┬────┴───┬────┴───┬────┴───┬────┴────────┴────────┴────────┘
                                       L4,    L2_SPC,  KC_NO,                     KC_NO,   L1_SPC,    L3
                                // └────────┴────────┴────────┘                 └────────┴────────┴────────┘
  ),
  [symbols] = LAYOUT(
  //┌────────┬────────┬────────┬────────┬────────┬────────┐                          ┌────────┬────────┬────────┬────────┬────────┬────────┐
     KC_WAKE,  KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,                              KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,
  //├────────┼────────┼────────┼────────┼────────┼────────┤                          ├────────┼────────┼────────┼────────┼────────┼────────┤
      KC_NO,   KC_NO,  KC_LBRC, KC_RBRC,  KC_BSLS,  KC_NO,                             KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,
  //├────────┼────────┼────────┼────────┼────────┼────────┤                          ├────────┼────────┼────────┼────────┼────────┼────────┤
     KC_CAPS,  KC_GRV, KC_MINS,  KC_EQL,  KC_SLSH,  KC_NO,                             KC_NO,  KC_RCMD, KC_RSFT, KC_RCTL, KC_ROPT,   KC_NO,
  //├────────┼────────┼────────┼────────┼────────┼────────┼────────┐        ┌────────┼────────┼────────┼────────┼────────┼────────┼────────┤
      KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO, TO(steno),            KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,
  //└────────┴────────┴────────┴───┬────┴───┬────┴───┬────┴───┬────┘        └───┬────┴───┬────┴───┬────┴───┬────┴────────┴────────┴────────┘
                                     KC_NO,   KC_NO,   KC_NO,                     KC_NO,  KC_TRNS,  KC_NO
                                // └────────┴────────┴────────┘                 └────────┴────────┴────────┘
  ),
  [navigation] = LAYOUT(
  //┌────────┬────────┬────────┬────────┬────────┬────────┐                          ┌────────┬────────┬────────┬────────┬────────┬────────┐
      KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,                              KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,
  //├────────┼────────┼────────┼────────┼────────┼────────┤                          ├────────┼────────┼────────┼────────┼────────┼────────┤
      KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,                              KC_NO,  KC_HOME,  KC_NO,   KC_NO,   KC_END,   KC_NO,
  //├────────┼────────┼────────┼────────┼────────┼────────┤                          ├────────┼────────┼────────┼────────┼────────┼────────┤
      KC_NO,  KC_LOPT, KC_LCTL, KC_LSFT, KC_LCMD,  KC_NO,                              KC_NO,  KC_LEFT, KC_DOWN,  KC_UP,  KC_RGHT,   KC_NO,
  //├────────┼────────┼────────┼────────┼────────┼────────┼────────┐        ┌────────┼────────┼────────┼────────┼────────┼────────┼────────┤
      KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,  KC_TRNS,             KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,
  //└────────┴────────┴────────┴───┬────┴───┬────┴───┬────┴───┬────┘        └───┬────┴───┬────┴───┬────┴───┬────┴────────┴────────┴────────┘
                                     KC_NO,  KC_TRNS,  KC_NO,                     KC_NO,   KC_NO,   KC_NO
                                // └────────┴────────┴────────┘                 └────────┴────────┴────────┘
  ),
  [fn_row] = LAYOUT(
  //┌────────┬────────┬────────┬────────┬────────┬────────┐                          ┌────────┬────────┬────────┬────────┬────────┬────────┐
      KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,                              KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,
  //├────────┼────────┼────────┼────────┼────────┼────────┤                          ├────────┼────────┼────────┼────────┼────────┼────────┤
      KC_NO,   KC_F1,   KC_F2,   KC_F3,   KC_F4,   KC_NO,                              KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,
  //├────────┼────────┼────────┼────────┼────────┼────────┤                          ├────────┼────────┼────────┼────────┼────────┼────────┤
      KC_NO,   KC_F5,   KC_F6,   KC_F7,   KC_F8,   KC_NO,                              KC_NO,  KC_RCMD, KC_RSFT, KC_RCTL, KC_ROPT,  KC_NO,
  //├────────┼────────┼────────┼────────┼────────┼────────┼────────┐        ┌────────┼────────┼────────┼────────┼────────┼────────┼────────┤
      KC_NO,   KC_F9,   KC_F10,  KC_F11,  KC_F12,   KC_NO,  KC_TRNS,            KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,
  //└────────┴────────┴────────┴───┬────┴───┬────┴───┬────┴───┬────┘        └───┬────┴───┬────┴───┬────┴───┬────┴────────┴────────┴────────┘
                                    KC_NO,  KC_NO,   KC_NO,                     KC_NO,   KC_NO,  KC_TRNS
                                // └────────┴────────┴────────┘                 └────────┴────────┴────────┘
  ),
  [numbers] = LAYOUT(
  //┌────────┬────────┬────────┬────────┬────────┬────────┐                          ┌────────┬────────┬────────┬────────┬────────┬────────┐
      KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,                              KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,
  //├────────┼────────┼────────┼────────┼────────┼────────┤                          ├────────┼────────┼────────┼────────┼────────┼────────┤
      KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,                              KC_NO,    KC_1,    KC_2,    KC_3,   KC_NO,   KC_NO,
  //├────────┼────────┼────────┼────────┼────────┼────────┤                          ├────────┼────────┼────────┼────────┼────────┼────────┤
      KC_NO,  KC_LOPT, KC_LCTL, KC_LSFT, KC_LCMD,  KC_NO,                              KC_NO,    KC_4,    KC_5,    KC_6,    KC_0,   KC_NO,
  //├────────┼────────┼────────┼────────┼────────┼────────┼────────┐        ┌────────┼────────┼────────┼────────┼────────┼────────┼────────┤
      KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,  KC_TRNS,            KC_NO,   KC_NO,    KC_7,    KC_8,    KC_9,   KC_NO,   KC_NO,
  //└────────┴────────┴────────┴───┬────┴───┬────┴───┬────┴───┬────┘        └───┬────┴───┬────┴───┬────┴───┬────┴────────┴────────┴────────┘
                                     KC_TRNS,  KC_NO,   KC_NO,                     KC_NO,   KC_NO,  KC_NO
                                // └────────┴────────┴────────┘                 └────────┴────────┴────────┘
  ),
  [steno] = LAYOUT(
  //┌────────┬────────┬────────┬────────┬────────┬────────┐                          ┌────────┬────────┬────────┬────────┬────────┬────────┐
      KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,                              KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,
  //├────────┼────────┼────────┼────────┼────────┼────────┤                          ├────────┼────────┼────────┼────────┼────────┼────────┤
      KC_NO,  STN_NUM, STN_NUM, STN_NUM, STN_NUM, KC_NO,                              KC_NO,  STN_NUM, STN_NUM, STN_NUM, STN_NUM, KC_NO,
  //├────────┼────────┼────────┼────────┼────────┼────────┤                          ├────────┼────────┼────────┼────────┼────────┼────────┤
      KC_NO,   STN_SL,  STN_TL,  STN_PL,  STN_HL, STN_STR,                            STN_STR,  STN_FR,  STN_PR,  STN_LR,  STN_TR,  STN_DR,
  //├────────┼────────┼────────┼────────┼────────┼────────┼────────┐        ┌────────┼────────┼────────┼────────┼────────┼────────┼────────┤
      KC_NO,  STN_SL,  STN_KL,  STN_WL,  STN_RL,  STN_STR,  TO(0),            KC_NO,  STN_STR,  STN_RR,  STN_BR,  STN_GR,  STN_SR,  STN_ZR,
  //└────────┴────────┴────────┴───┬────┴───┬────┴───┬────┴───┬────┘        └───┬────┴───┬────┴───┬────┴───┬────┴────────┴────────┴────────┘
                                     STN_A,   STN_O,   KC_NO,                     KC_NO,   STN_E,   STN_U
                                // └────────┴────────┴────────┘                 └────────┴────────┴────────┘
  )
};
