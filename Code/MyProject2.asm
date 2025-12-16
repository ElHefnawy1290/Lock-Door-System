
_VDelay_us:

L_VDelay_us0:
	MOVF       FARG_VDelay_us_time_us+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__VDelay_us117
	MOVF       FARG_VDelay_us_time_us+0, 0
	SUBLW      10
L__VDelay_us117:
	BTFSC      STATUS+0, 0
	GOTO       L_VDelay_us1
	MOVLW      4
	MOVWF      R13+0
L_VDelay_us2:
	DECFSZ     R13+0, 1
	GOTO       L_VDelay_us2
	NOP
	MOVLW      10
	SUBWF      FARG_VDelay_us_time_us+0, 1
	BTFSS      STATUS+0, 0
	DECF       FARG_VDelay_us_time_us+1, 1
	GOTO       L_VDelay_us0
L_VDelay_us1:
	MOVF       FARG_VDelay_us_time_us+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__VDelay_us118
	MOVF       FARG_VDelay_us_time_us+0, 0
	SUBLW      0
L__VDelay_us118:
	BTFSC      STATUS+0, 0
	GOTO       L_VDelay_us3
	NOP
	NOP
L_VDelay_us3:
L_end_VDelay_us:
	RETURN
; end of _VDelay_us

_Servo_Move:

	MOVLW      128
	XORWF      FARG_Servo_Move_angle+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Servo_Move120
	MOVLW      0
	SUBWF      FARG_Servo_Move_angle+0, 0
L__Servo_Move120:
	BTFSC      STATUS+0, 0
	GOTO       L_Servo_Move4
	CLRF       FARG_Servo_Move_angle+0
	CLRF       FARG_Servo_Move_angle+1
L_Servo_Move4:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      FARG_Servo_Move_angle+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Servo_Move121
	MOVF       FARG_Servo_Move_angle+0, 0
	SUBLW      180
L__Servo_Move121:
	BTFSC      STATUS+0, 0
	GOTO       L_Servo_Move5
	MOVLW      180
	MOVWF      FARG_Servo_Move_angle+0
	CLRF       FARG_Servo_Move_angle+1
L_Servo_Move5:
	MOVF       FARG_Servo_Move_angle+0, 0
	MOVWF      R0+0
	MOVF       FARG_Servo_Move_angle+1, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	ADDLW      88
	MOVWF      FARG_VDelay_us_time_us+0
	MOVLW      2
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 0
	MOVWF      FARG_VDelay_us_time_us+1
	BSF        RC0_bit+0, BitPos(RC0_bit+0)
	CALL       _VDelay_us+0
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
	MOVLW      45
	MOVWF      R12+0
	MOVLW      38
	MOVWF      R13+0
L_Servo_Move6:
	DECFSZ     R13+0, 1
	GOTO       L_Servo_Move6
	DECFSZ     R12+0, 1
	GOTO       L_Servo_Move6
	NOP
L_end_Servo_Move:
	RETURN
; end of _Servo_Move

_Lcd_Out_Const:

	CLRF       Lcd_Out_Const_i_L0+0
L_Lcd_Out_Const7:
	MOVLW      16
	SUBWF      Lcd_Out_Const_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Lcd_Out_Const8
	MOVF       Lcd_Out_Const_i_L0+0, 0
	ADDWF      FARG_Lcd_Out_Const_text+0, 0
	MOVWF      R0+0
	MOVF       FARG_Lcd_Out_Const_text+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Lcd_Out_Const8
L__Lcd_Out_Const115:
	MOVF       Lcd_Out_Const_i_L0+0, 0
	ADDLW      _txt_buffer+0
	MOVWF      R2+0
	MOVF       Lcd_Out_Const_i_L0+0, 0
	ADDWF      FARG_Lcd_Out_Const_text+0, 0
	MOVWF      R0+0
	MOVF       FARG_Lcd_Out_Const_text+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      R0+0
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	INCF       Lcd_Out_Const_i_L0+0, 1
	GOTO       L_Lcd_Out_Const7
L_Lcd_Out_Const8:
	MOVF       Lcd_Out_Const_i_L0+0, 0
	ADDLW      _txt_buffer+0
	MOVWF      FSR
	CLRF       INDF+0
	MOVF       FARG_Lcd_Out_Const_row+0, 0
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       FARG_Lcd_Out_Const_col+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt_buffer+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L_end_Lcd_Out_Const:
	RETURN
; end of _Lcd_Out_Const

_get_mapped_key:

	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _key+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_get_mapped_key12
	CLRF       R0+0
	GOTO       L_end_get_mapped_key
L_get_mapped_key12:
	MOVF       _key+0, 0
	XORLW      16
	BTFSS      STATUS+0, 2
	GOTO       L_get_mapped_key13
	MOVLW      77
	MOVWF      R0+0
	GOTO       L_end_get_mapped_key
L_get_mapped_key13:
	MOVF       _key+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_get_mapped_key14
	MOVLW      49
	MOVWF      R0+0
	GOTO       L_end_get_mapped_key
L_get_mapped_key14:
	MOVF       _key+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_get_mapped_key15
	MOVLW      50
	MOVWF      R0+0
	GOTO       L_end_get_mapped_key
L_get_mapped_key15:
	MOVF       _key+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_get_mapped_key16
	MOVLW      51
	MOVWF      R0+0
	GOTO       L_end_get_mapped_key
L_get_mapped_key16:
	MOVF       _key+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_get_mapped_key17
	MOVLW      52
	MOVWF      R0+0
	GOTO       L_end_get_mapped_key
L_get_mapped_key17:
	MOVF       _key+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_get_mapped_key18
	MOVLW      53
	MOVWF      R0+0
	GOTO       L_end_get_mapped_key
L_get_mapped_key18:
	MOVF       _key+0, 0
	XORLW      7
	BTFSS      STATUS+0, 2
	GOTO       L_get_mapped_key19
	MOVLW      54
	MOVWF      R0+0
	GOTO       L_end_get_mapped_key
L_get_mapped_key19:
	MOVF       _key+0, 0
	XORLW      9
	BTFSS      STATUS+0, 2
	GOTO       L_get_mapped_key20
	MOVLW      55
	MOVWF      R0+0
	GOTO       L_end_get_mapped_key
L_get_mapped_key20:
	MOVF       _key+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_get_mapped_key21
	MOVLW      56
	MOVWF      R0+0
	GOTO       L_end_get_mapped_key
L_get_mapped_key21:
	MOVF       _key+0, 0
	XORLW      11
	BTFSS      STATUS+0, 2
	GOTO       L_get_mapped_key22
	MOVLW      57
	MOVWF      R0+0
	GOTO       L_end_get_mapped_key
L_get_mapped_key22:
	MOVF       _key+0, 0
	XORLW      14
	BTFSS      STATUS+0, 2
	GOTO       L_get_mapped_key23
	MOVLW      48
	MOVWF      R0+0
	GOTO       L_end_get_mapped_key
L_get_mapped_key23:
	CLRF       R0+0
L_end_get_mapped_key:
	RETURN
; end of _get_mapped_key

_read_password:

	MOVF       _current_state+0, 0
	SUBLW      1
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	MOVWF      read_password_toggleState_L0+0
	MOVLW      _password_input+0
	MOVWF      FARG_memset_p1+0
	CLRF       FARG_memset_character+0
	MOVLW      5
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
	CLRF       _i+0
L_read_password24:
	MOVLW      128
	XORWF      _i+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      4
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_read_password25
L_read_password27:
	CALL       _get_mapped_key+0
	MOVF       R0+0, 0
	MOVWF      _key+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_read_password27
	MOVF       _key+0, 0
	XORLW      77
	BTFSS      STATUS+0, 2
	GOTO       L_read_password30
	MOVF       read_password_toggleState_L0+0, 0
	MOVWF      _current_state+0
	MOVLW      255
	MOVWF      R0+0
	MOVLW      255
	MOVWF      R0+1
	GOTO       L_end_read_password
L_read_password30:
	MOVF       _i+0, 0
	ADDLW      _password_input+0
	MOVWF      FSR
	MOVF       _key+0, 0
	MOVWF      INDF+0
	MOVLW      42
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	INCF       _i+0, 1
	GOTO       L_read_password24
L_read_password25:
L_end_read_password:
	RETURN
; end of _read_password

_add_user:

	CLRF       _i+0
	CLRF       _id+0
	CLRF       _slot+0
	CLRF       _addr+0
	MOVLW      1
	MOVWF      _is_full+0
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_col+0
	MOVLW      _msg_new_user+0
	MOVWF      FARG_Lcd_Out_Const_text+0
	MOVLW      hi_addr(_msg_new_user+0)
	MOVWF      FARG_Lcd_Out_Const_text+1
	CALL       _Lcd_Out_Const+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_Const_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_col+0
	MOVLW      _msg_empty+0
	MOVWF      FARG_Lcd_Out_Const_text+0
	MOVLW      hi_addr(_msg_empty+0)
	MOVWF      FARG_Lcd_Out_Const_text+1
	CALL       _Lcd_Out_Const+0
	CALL       _read_password+0
	MOVLW      255
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__add_user126
	MOVLW      255
	XORWF      R0+0, 0
L__add_user126:
	BTFSS      STATUS+0, 2
	GOTO       L_add_user31
	GOTO       L_end_add_user
L_add_user31:
	CLRF       _slot+0
L_add_user32:
	MOVLW      128
	XORWF      _slot+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      64
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_add_user33
	MOVF       _slot+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      _addr+0
	MOVF       R0+0, 0
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L_add_user35
	CLRF       _is_full+0
	GOTO       L_add_user33
L_add_user35:
	INCF       _id+0, 1
	INCF       _slot+0, 1
	GOTO       L_add_user32
L_add_user33:
	MOVF       _is_full+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_add_user36
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_col+0
	MOVLW      _msg_mem_full+0
	MOVWF      FARG_Lcd_Out_Const_text+0
	MOVLW      hi_addr(_msg_mem_full+0)
	MOVWF      FARG_Lcd_Out_Const_text+1
	CALL       _Lcd_Out_Const+0
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_add_user37:
	DECFSZ     R13+0, 1
	GOTO       L_add_user37
	DECFSZ     R12+0, 1
	GOTO       L_add_user37
	DECFSZ     R11+0, 1
	GOTO       L_add_user37
	NOP
	GOTO       L_end_add_user
L_add_user36:
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_col+0
	MOVLW      _msg_saving+0
	MOVWF      FARG_Lcd_Out_Const_text+0
	MOVLW      hi_addr(_msg_saving+0)
	MOVWF      FARG_Lcd_Out_Const_text+1
	CALL       _Lcd_Out_Const+0
	CLRF       _i+0
L_add_user38:
	MOVLW      128
	XORWF      _i+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      4
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_add_user39
	MOVF       _i+0, 0
	ADDWF      _addr+0, 0
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _i+0, 0
	ADDLW      _password_input+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
	MOVLW      2
	MOVWF      R11+0
	MOVLW      160
	MOVWF      R12+0
	MOVLW      146
	MOVWF      R13+0
L_add_user41:
	DECFSZ     R13+0, 1
	GOTO       L_add_user41
	DECFSZ     R12+0, 1
	GOTO       L_add_user41
	DECFSZ     R11+0, 1
	GOTO       L_add_user41
	NOP
	INCF       _i+0, 1
	GOTO       L_add_user38
L_add_user39:
	MOVF       _id+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      _str+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
	MOVLW      _str+0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_col+0
	MOVLW      _msg_saved+0
	MOVWF      FARG_Lcd_Out_Const_text+0
	MOVLW      hi_addr(_msg_saved+0)
	MOVWF      FARG_Lcd_Out_Const_text+1
	CALL       _Lcd_Out_Const+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_Const_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_col+0
	MOVLW      _msg_userid+0
	MOVWF      FARG_Lcd_Out_Const_text+0
	MOVLW      hi_addr(_msg_userid+0)
	MOVWF      FARG_Lcd_Out_Const_text+1
	CALL       _Lcd_Out_Const+0
	MOVLW      128
	XORWF      _id+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      10
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_add_user42
	MOVLW      48
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
L_add_user42:
	MOVLW      _str+0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_add_user43:
	DECFSZ     R13+0, 1
	GOTO       L_add_user43
	DECFSZ     R12+0, 1
	GOTO       L_add_user43
	DECFSZ     R11+0, 1
	GOTO       L_add_user43
	NOP
L_end_add_user:
	RETURN
; end of _add_user

_delete_user:

	CLRF       _i+0
	CLRF       _id+0
	CLRF       _slot+0
	CLRF       _addr+0
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_col+0
	MOVLW      _msg_userid+0
	MOVWF      FARG_Lcd_Out_Const_text+0
	MOVLW      hi_addr(_msg_userid+0)
	MOVWF      FARG_Lcd_Out_Const_text+1
	CALL       _Lcd_Out_Const+0
	CLRF       _i+0
L_delete_user44:
	MOVLW      128
	XORWF      _i+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      2
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_delete_user45
L_delete_user47:
	CALL       _get_mapped_key+0
	MOVF       R0+0, 0
	MOVWF      _key+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_delete_user47
	MOVF       _key+0, 0
	XORLW      77
	BTFSS      STATUS+0, 2
	GOTO       L_delete_user50
	CLRF       _current_state+0
	GOTO       L_end_delete_user
L_delete_user50:
	MOVF       _id+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVLW      48
	SUBWF      _key+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	ADDWF      R0+0, 0
	MOVWF      _id+0
	MOVLW      42
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	INCF       _i+0, 1
	GOTO       L_delete_user44
L_delete_user45:
	MOVF       _id+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      _addr+0
	MOVF       R0+0, 0
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVLW      255
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
	MOVLW      2
	MOVWF      R11+0
	MOVLW      160
	MOVWF      R12+0
	MOVLW      146
	MOVWF      R13+0
L_delete_user51:
	DECFSZ     R13+0, 1
	GOTO       L_delete_user51
	DECFSZ     R12+0, 1
	GOTO       L_delete_user51
	DECFSZ     R11+0, 1
	GOTO       L_delete_user51
	NOP
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_col+0
	MOVLW      _msg_deleting+0
	MOVWF      FARG_Lcd_Out_Const_text+0
	MOVLW      hi_addr(_msg_deleting+0)
	MOVWF      FARG_Lcd_Out_Const_text+1
	CALL       _Lcd_Out_Const+0
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_delete_user52:
	DECFSZ     R13+0, 1
	GOTO       L_delete_user52
	DECFSZ     R12+0, 1
	GOTO       L_delete_user52
	DECFSZ     R11+0, 1
	GOTO       L_delete_user52
	NOP
	NOP
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_col+0
	MOVLW      _msg_deleted+0
	MOVWF      FARG_Lcd_Out_Const_text+0
	MOVLW      hi_addr(_msg_deleted+0)
	MOVWF      FARG_Lcd_Out_Const_text+1
	CALL       _Lcd_Out_Const+0
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_delete_user53:
	DECFSZ     R13+0, 1
	GOTO       L_delete_user53
	DECFSZ     R12+0, 1
	GOTO       L_delete_user53
	DECFSZ     R11+0, 1
	GOTO       L_delete_user53
	NOP
	NOP
L_end_delete_user:
	RETURN
; end of _delete_user

_login_mode:

	CLRF       _i+0
	CLRF       _slot+0
	CLRF       _addr+0
	CLRF       _match_found+0
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	BCF        PORTC+0, 0
	BCF        PORTC+0, 1
	BSF        PORTC+0, 2
	BCF        PORTC+0, 3
	MOVF       _user+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_login_mode54
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_col+0
	MOVLW      _msg_user_mode+0
	MOVWF      FARG_Lcd_Out_Const_text+0
	MOVLW      hi_addr(_msg_user_mode+0)
	MOVWF      FARG_Lcd_Out_Const_text+1
	CALL       _Lcd_Out_Const+0
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_login_mode55:
	DECFSZ     R13+0, 1
	GOTO       L_login_mode55
	DECFSZ     R12+0, 1
	GOTO       L_login_mode55
	DECFSZ     R11+0, 1
	GOTO       L_login_mode55
	NOP
	MOVLW      1
	MOVWF      _user+0
	CLRF       _admin+0
L_login_mode54:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_col+0
	MOVLW      _msg_enter_key+0
	MOVWF      FARG_Lcd_Out_Const_text+0
	MOVLW      hi_addr(_msg_enter_key+0)
	MOVWF      FARG_Lcd_Out_Const_text+1
	CALL       _Lcd_Out_Const+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_Const_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_col+0
	MOVLW      _msg_empty+0
	MOVWF      FARG_Lcd_Out_Const_text+0
	MOVLW      hi_addr(_msg_empty+0)
	MOVWF      FARG_Lcd_Out_Const_text+1
	CALL       _Lcd_Out_Const+0
	MOVLW      _stored_pass+0
	MOVWF      FARG_memset_p1+0
	CLRF       FARG_memset_character+0
	MOVLW      5
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
	CALL       _read_password+0
	MOVLW      255
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__login_mode129
	MOVLW      255
	XORWF      R0+0, 0
L__login_mode129:
	BTFSS      STATUS+0, 2
	GOTO       L_login_mode56
	GOTO       L_end_login_mode
L_login_mode56:
	CLRF       _slot+0
L_login_mode57:
	MOVLW      128
	XORWF      _slot+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      64
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_login_mode58
	MOVF       _slot+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      _addr+0
	MOVF       R0+0, 0
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L_login_mode60
	GOTO       L_login_mode59
L_login_mode60:
	CLRF       _i+0
L_login_mode61:
	MOVLW      128
	XORWF      _i+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      4
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_login_mode62
	MOVF       _i+0, 0
	ADDLW      _stored_pass+0
	MOVWF      FLOC__login_mode+0
	MOVF       _i+0, 0
	ADDWF      _addr+0, 0
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       FLOC__login_mode+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_login_mode64:
	DECFSZ     R13+0, 1
	GOTO       L_login_mode64
	DECFSZ     R12+0, 1
	GOTO       L_login_mode64
	NOP
	INCF       _i+0, 1
	GOTO       L_login_mode61
L_login_mode62:
	MOVLW      _password_input+0
	MOVWF      FARG_strcmp_s1+0
	MOVLW      _stored_pass+0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__login_mode130
	MOVLW      0
	XORWF      R0+0, 0
L__login_mode130:
	BTFSS      STATUS+0, 2
	GOTO       L_login_mode65
	MOVLW      1
	MOVWF      _match_found+0
	GOTO       L_login_mode58
L_login_mode65:
L_login_mode59:
	INCF       _slot+0, 1
	GOTO       L_login_mode57
L_login_mode58:
	MOVF       _match_found+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_login_mode66
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_Const_col+0
	MOVLW      _msg_welcome+0
	MOVWF      FARG_Lcd_Out_Const_text+0
	MOVLW      hi_addr(_msg_welcome+0)
	MOVWF      FARG_Lcd_Out_Const_text+1
	CALL       _Lcd_Out_Const+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_Const_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_Const_col+0
	MOVLW      _msg_access+0
	MOVWF      FARG_Lcd_Out_Const_text+0
	MOVLW      hi_addr(_msg_access+0)
	MOVWF      FARG_Lcd_Out_Const_text+1
	CALL       _Lcd_Out_Const+0
	BSF        PORTC+0, 0
	BSF        PORTC+0, 1
	BCF        PORTC+0, 2
	CLRF       _i+0
L_login_mode67:
	MOVLW      128
	XORWF      _i+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      50
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_login_mode68
	MOVLW      180
	MOVWF      FARG_Servo_Move_angle+0
	CLRF       FARG_Servo_Move_angle+1
	CALL       _Servo_Move+0
	INCF       _i+0, 1
	GOTO       L_login_mode67
L_login_mode68:
	MOVLW      102
	MOVWF      R11+0
	MOVLW      118
	MOVWF      R12+0
	MOVLW      193
	MOVWF      R13+0
L_login_mode70:
	DECFSZ     R13+0, 1
	GOTO       L_login_mode70
	DECFSZ     R12+0, 1
	GOTO       L_login_mode70
	DECFSZ     R11+0, 1
	GOTO       L_login_mode70
	CLRF       _i+0
L_login_mode71:
	MOVLW      128
	XORWF      _i+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      50
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_login_mode72
	CLRF       FARG_Servo_Move_angle+0
	CLRF       FARG_Servo_Move_angle+1
	CALL       _Servo_Move+0
	INCF       _i+0, 1
	GOTO       L_login_mode71
L_login_mode72:
	GOTO       L_login_mode74
L_login_mode66:
	DECF       _tries_left+0, 1
	MOVLW      128
	XORLW      0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _tries_left+0, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_login_mode75
	MOVLW      2
	MOVWF      _current_state+0
	GOTO       L_end_login_mode
L_login_mode75:
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_col+0
	MOVLW      _msg_wrong+0
	MOVWF      FARG_Lcd_Out_Const_text+0
	MOVLW      hi_addr(_msg_wrong+0)
	MOVWF      FARG_Lcd_Out_Const_text+1
	CALL       _Lcd_Out_Const+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_Const_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_col+0
	MOVLW      _msg_tries+0
	MOVWF      FARG_Lcd_Out_Const_text+0
	MOVLW      hi_addr(_msg_tries+0)
	MOVWF      FARG_Lcd_Out_Const_text+1
	CALL       _Lcd_Out_Const+0
	MOVF       _tries_left+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      _str+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
	MOVLW      _str+0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
	MOVLW      _str+0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_login_mode76:
	DECFSZ     R13+0, 1
	GOTO       L_login_mode76
	DECFSZ     R12+0, 1
	GOTO       L_login_mode76
	DECFSZ     R11+0, 1
	GOTO       L_login_mode76
	NOP
L_login_mode74:
L_end_login_mode:
	RETURN
; end of _login_mode

_admin_mode:

	CLRF       _i+0
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	BCF        PORTC+0, 0
	BCF        PORTC+0, 1
	BCF        PORTC+0, 2
	BCF        PORTC+0, 3
	MOVF       _admin+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_admin_mode77
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_col+0
	MOVLW      _msg_admin_mode+0
	MOVWF      FARG_Lcd_Out_Const_text+0
	MOVLW      hi_addr(_msg_admin_mode+0)
	MOVWF      FARG_Lcd_Out_Const_text+1
	CALL       _Lcd_Out_Const+0
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_admin_mode78:
	DECFSZ     R13+0, 1
	GOTO       L_admin_mode78
	DECFSZ     R12+0, 1
	GOTO       L_admin_mode78
	DECFSZ     R11+0, 1
	GOTO       L_admin_mode78
	NOP
	MOVLW      1
	MOVWF      _admin+0
	CLRF       _user+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_col+0
	MOVLW      _msg_enter_admin+0
	MOVWF      FARG_Lcd_Out_Const_text+0
	MOVLW      hi_addr(_msg_enter_admin+0)
	MOVWF      FARG_Lcd_Out_Const_text+1
	CALL       _Lcd_Out_Const+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_Const_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_col+0
	MOVLW      _msg_empty+0
	MOVWF      FARG_Lcd_Out_Const_text+0
	MOVLW      hi_addr(_msg_empty+0)
	MOVWF      FARG_Lcd_Out_Const_text+1
	CALL       _Lcd_Out_Const+0
	CALL       _read_password+0
	MOVLW      255
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__admin_mode132
	MOVLW      255
	XORWF      R0+0, 0
L__admin_mode132:
	BTFSS      STATUS+0, 2
	GOTO       L_admin_mode79
	GOTO       L_end_admin_mode
L_admin_mode79:
	GOTO       L_admin_mode80
L_admin_mode77:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_col+0
	MOVLW      _msg_opt1+0
	MOVWF      FARG_Lcd_Out_Const_text+0
	MOVLW      hi_addr(_msg_opt1+0)
	MOVWF      FARG_Lcd_Out_Const_text+1
	CALL       _Lcd_Out_Const+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_Const_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_col+0
	MOVLW      _msg_opt2+0
	MOVWF      FARG_Lcd_Out_Const_text+0
	MOVLW      hi_addr(_msg_opt2+0)
	MOVWF      FARG_Lcd_Out_Const_text+1
	CALL       _Lcd_Out_Const+0
L_admin_mode81:
	CALL       _get_mapped_key+0
	MOVF       R0+0, 0
	MOVWF      _key+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_admin_mode81
	MOVF       _key+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L_admin_mode84
	CALL       _add_user+0
	GOTO       L_admin_mode85
L_admin_mode84:
	MOVF       _key+0, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L_admin_mode86
	CALL       _delete_user+0
	GOTO       L_admin_mode87
L_admin_mode86:
	MOVF       _key+0, 0
	XORLW      77
	BTFSS      STATUS+0, 2
	GOTO       L_admin_mode88
	CLRF       _current_state+0
L_admin_mode88:
L_admin_mode87:
L_admin_mode85:
	GOTO       L_end_admin_mode
L_admin_mode80:
	MOVLW      _password_input+0
	MOVWF      FARG_strcmp_s1+0
	MOVLW      _ADMIN_KEY+0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__admin_mode133
	MOVLW      0
	XORWF      R0+0, 0
L__admin_mode133:
	BTFSS      STATUS+0, 2
	GOTO       L_admin_mode89
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_Const_col+0
	MOVLW      _msg_welcome+0
	MOVWF      FARG_Lcd_Out_Const_text+0
	MOVLW      hi_addr(_msg_welcome+0)
	MOVWF      FARG_Lcd_Out_Const_text+1
	CALL       _Lcd_Out_Const+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_Const_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_Const_col+0
	MOVLW      _msg_elhefnawy+0
	MOVWF      FARG_Lcd_Out_Const_text+0
	MOVLW      hi_addr(_msg_elhefnawy+0)
	MOVWF      FARG_Lcd_Out_Const_text+1
	CALL       _Lcd_Out_Const+0
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_admin_mode90:
	DECFSZ     R13+0, 1
	GOTO       L_admin_mode90
	DECFSZ     R12+0, 1
	GOTO       L_admin_mode90
	DECFSZ     R11+0, 1
	GOTO       L_admin_mode90
	NOP
	MOVLW      3
	MOVWF      _tries_left+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_col+0
	MOVLW      _msg_opt1+0
	MOVWF      FARG_Lcd_Out_Const_text+0
	MOVLW      hi_addr(_msg_opt1+0)
	MOVWF      FARG_Lcd_Out_Const_text+1
	CALL       _Lcd_Out_Const+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_Const_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_col+0
	MOVLW      _msg_opt2+0
	MOVWF      FARG_Lcd_Out_Const_text+0
	MOVLW      hi_addr(_msg_opt2+0)
	MOVWF      FARG_Lcd_Out_Const_text+1
	CALL       _Lcd_Out_Const+0
L_admin_mode91:
	CALL       _get_mapped_key+0
	MOVF       R0+0, 0
	MOVWF      _key+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_admin_mode91
	MOVF       _key+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L_admin_mode94
	CALL       _add_user+0
	GOTO       L_admin_mode95
L_admin_mode94:
	MOVF       _key+0, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L_admin_mode96
	CALL       _delete_user+0
	GOTO       L_admin_mode97
L_admin_mode96:
	MOVF       _key+0, 0
	XORLW      77
	BTFSS      STATUS+0, 2
	GOTO       L_admin_mode98
	CLRF       _current_state+0
L_admin_mode98:
L_admin_mode97:
L_admin_mode95:
	GOTO       L_end_admin_mode
L_admin_mode89:
	DECF       _tries_left+0, 1
	MOVLW      128
	XORLW      0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _tries_left+0, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_admin_mode100
	MOVLW      2
	MOVWF      _current_state+0
	GOTO       L_end_admin_mode
L_admin_mode100:
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_col+0
	MOVLW      _msg_wrong+0
	MOVWF      FARG_Lcd_Out_Const_text+0
	MOVLW      hi_addr(_msg_wrong+0)
	MOVWF      FARG_Lcd_Out_Const_text+1
	CALL       _Lcd_Out_Const+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_Const_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_col+0
	MOVLW      _msg_tries+0
	MOVWF      FARG_Lcd_Out_Const_text+0
	MOVLW      hi_addr(_msg_tries+0)
	MOVWF      FARG_Lcd_Out_Const_text+1
	CALL       _Lcd_Out_Const+0
	MOVF       _tries_left+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      _str+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
	MOVLW      _str+0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
	MOVLW      _str+0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_admin_mode101:
	DECFSZ     R13+0, 1
	GOTO       L_admin_mode101
	DECFSZ     R12+0, 1
	GOTO       L_admin_mode101
	DECFSZ     R11+0, 1
	GOTO       L_admin_mode101
	NOP
L_end_admin_mode:
	RETURN
; end of _admin_mode

_suspended_mode:

	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_col+0
	MOVLW      _msg_locked+0
	MOVWF      FARG_Lcd_Out_Const_text+0
	MOVLW      hi_addr(_msg_locked+0)
	MOVWF      FARG_Lcd_Out_Const_text+1
	CALL       _Lcd_Out_Const+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_Const_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_col+0
	MOVLW      _msg_timer+0
	MOVWF      FARG_Lcd_Out_Const_text+0
	MOVLW      hi_addr(_msg_timer+0)
	MOVWF      FARG_Lcd_Out_Const_text+1
	CALL       _Lcd_Out_Const+0
	BCF        PORTC+0, 0
	BCF        PORTC+0, 1
	BSF        PORTC+0, 2
	BSF        PORTC+0, 3
	MOVLW      60
	MOVWF      _seconds+0
L_suspended_mode102:
	MOVLW      128
	XORLW      0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _seconds+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_suspended_mode103
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      15
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_MyProject2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVF       _seconds+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      _str+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
	MOVLW      _str+0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      15
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _str+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	CLRF       _i+0
L_suspended_mode104:
	MOVLW      128
	XORWF      _i+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      31
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_suspended_mode105
	BTFSS      INTCON+0, 2
	GOTO       L_suspended_mode106
	BCF        INTCON+0, 2
	INCF       _i+0, 1
L_suspended_mode106:
	GOTO       L_suspended_mode104
L_suspended_mode105:
	DECF       _seconds+0, 1
	GOTO       L_suspended_mode102
L_suspended_mode103:
	MOVLW      3
	MOVWF      _tries_left+0
	CLRF       _current_state+0
L_end_suspended_mode:
	RETURN
; end of _suspended_mode

_main:

	MOVLW      135
	MOVWF      OPTION_REG+0
	CLRF       TMR0+0
	BCF        INTCON+0, 2
	CLRF       TRISC+0
	CLRF       PORTC+0
	BSF        PORTC+0, 2
	CALL       _Lcd_Init+0
	CALL       _Keypad_Init+0
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_col+0
	MOVLW      _msg_main_welcome+0
	MOVWF      FARG_Lcd_Out_Const_text+0
	MOVLW      hi_addr(_msg_main_welcome+0)
	MOVWF      FARG_Lcd_Out_Const_text+1
	CALL       _Lcd_Out_Const+0
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_main107:
	DECFSZ     R13+0, 1
	GOTO       L_main107
	DECFSZ     R12+0, 1
	GOTO       L_main107
	DECFSZ     R11+0, 1
	GOTO       L_main107
	NOP
L_main108:
	GOTO       L_main110
L_main112:
	CALL       _login_mode+0
	GOTO       L_main111
L_main113:
	CALL       _admin_mode+0
	GOTO       L_main111
L_main114:
	CALL       _suspended_mode+0
	GOTO       L_main111
L_main110:
	MOVF       _current_state+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main112
	MOVF       _current_state+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main113
	MOVF       _current_state+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main114
L_main111:
	GOTO       L_main108
L_end_main:
	GOTO       $+0
; end of _main
