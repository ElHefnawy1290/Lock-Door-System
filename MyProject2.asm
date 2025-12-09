
_Lcd_Out_Const:

	CLRF       Lcd_Out_Const_i_L0+0
L_Lcd_Out_Const0:
	MOVLW      16
	SUBWF      Lcd_Out_Const_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Lcd_Out_Const1
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
	GOTO       L_Lcd_Out_Const1
L__Lcd_Out_Const101:
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
	GOTO       L_Lcd_Out_Const0
L_Lcd_Out_Const1:
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
	GOTO       L_get_mapped_key5
	CLRF       R0+0
	GOTO       L_end_get_mapped_key
L_get_mapped_key5:
	MOVF       _key+0, 0
	XORLW      16
	BTFSS      STATUS+0, 2
	GOTO       L_get_mapped_key6
	MOVLW      77
	MOVWF      R0+0
	GOTO       L_end_get_mapped_key
L_get_mapped_key6:
	MOVF       _key+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_get_mapped_key7
	MOVLW      55
	MOVWF      R0+0
	GOTO       L_end_get_mapped_key
L_get_mapped_key7:
	MOVF       _key+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_get_mapped_key8
	MOVLW      56
	MOVWF      R0+0
	GOTO       L_end_get_mapped_key
L_get_mapped_key8:
	MOVF       _key+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_get_mapped_key9
	MOVLW      57
	MOVWF      R0+0
	GOTO       L_end_get_mapped_key
L_get_mapped_key9:
	MOVF       _key+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_get_mapped_key10
	MOVLW      52
	MOVWF      R0+0
	GOTO       L_end_get_mapped_key
L_get_mapped_key10:
	MOVF       _key+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_get_mapped_key11
	MOVLW      53
	MOVWF      R0+0
	GOTO       L_end_get_mapped_key
L_get_mapped_key11:
	MOVF       _key+0, 0
	XORLW      7
	BTFSS      STATUS+0, 2
	GOTO       L_get_mapped_key12
	MOVLW      54
	MOVWF      R0+0
	GOTO       L_end_get_mapped_key
L_get_mapped_key12:
	MOVF       _key+0, 0
	XORLW      9
	BTFSS      STATUS+0, 2
	GOTO       L_get_mapped_key13
	MOVLW      49
	MOVWF      R0+0
	GOTO       L_end_get_mapped_key
L_get_mapped_key13:
	MOVF       _key+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_get_mapped_key14
	MOVLW      50
	MOVWF      R0+0
	GOTO       L_end_get_mapped_key
L_get_mapped_key14:
	MOVF       _key+0, 0
	XORLW      11
	BTFSS      STATUS+0, 2
	GOTO       L_get_mapped_key15
	MOVLW      51
	MOVWF      R0+0
	GOTO       L_end_get_mapped_key
L_get_mapped_key15:
	MOVF       _key+0, 0
	XORLW      14
	BTFSS      STATUS+0, 2
	GOTO       L_get_mapped_key16
	MOVLW      48
	MOVWF      R0+0
	GOTO       L_end_get_mapped_key
L_get_mapped_key16:
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
L_read_password17:
	MOVLW      128
	XORWF      _i+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      4
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_read_password18
L_read_password20:
	CALL       _get_mapped_key+0
	MOVF       R0+0, 0
	MOVWF      _key+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_read_password20
	MOVF       _key+0, 0
	XORLW      77
	BTFSS      STATUS+0, 2
	GOTO       L_read_password23
	MOVF       read_password_toggleState_L0+0, 0
	MOVWF      _current_state+0
	MOVLW      255
	MOVWF      R0+0
	MOVLW      255
	MOVWF      R0+1
	GOTO       L_end_read_password
L_read_password23:
	MOVF       _i+0, 0
	ADDLW      _password_input+0
	MOVWF      FSR
	MOVF       _key+0, 0
	MOVWF      INDF+0
	MOVLW      42
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	INCF       _i+0, 1
	GOTO       L_read_password17
L_read_password18:
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
	GOTO       L__add_user106
	MOVLW      255
	XORWF      R0+0, 0
L__add_user106:
	BTFSS      STATUS+0, 2
	GOTO       L_add_user24
	GOTO       L_end_add_user
L_add_user24:
	CLRF       _slot+0
L_add_user25:
	MOVLW      128
	XORWF      _slot+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      64
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_add_user26
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
	GOTO       L_add_user28
	CLRF       _is_full+0
	GOTO       L_add_user26
L_add_user28:
	INCF       _id+0, 1
	INCF       _slot+0, 1
	GOTO       L_add_user25
L_add_user26:
	MOVF       _is_full+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_add_user29
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
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_add_user30:
	DECFSZ     R13+0, 1
	GOTO       L_add_user30
	DECFSZ     R12+0, 1
	GOTO       L_add_user30
	DECFSZ     R11+0, 1
	GOTO       L_add_user30
	NOP
	NOP
	GOTO       L_end_add_user
L_add_user29:
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
L_add_user31:
	MOVLW      128
	XORWF      _i+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      4
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_add_user32
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
L_add_user34:
	DECFSZ     R13+0, 1
	GOTO       L_add_user34
	DECFSZ     R12+0, 1
	GOTO       L_add_user34
	DECFSZ     R11+0, 1
	GOTO       L_add_user34
	NOP
	INCF       _i+0, 1
	GOTO       L_add_user31
L_add_user32:
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
	GOTO       L_add_user35
	MOVLW      48
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
L_add_user35:
	MOVLW      _str+0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_add_user36:
	DECFSZ     R13+0, 1
	GOTO       L_add_user36
	DECFSZ     R12+0, 1
	GOTO       L_add_user36
	DECFSZ     R11+0, 1
	GOTO       L_add_user36
	NOP
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
L_delete_user37:
	MOVLW      128
	XORWF      _i+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      2
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_delete_user38
L_delete_user40:
	CALL       _get_mapped_key+0
	MOVF       R0+0, 0
	MOVWF      _key+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_delete_user40
	MOVF       _key+0, 0
	XORLW      77
	BTFSS      STATUS+0, 2
	GOTO       L_delete_user43
	CLRF       _current_state+0
	GOTO       L_end_delete_user
L_delete_user43:
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
	GOTO       L_delete_user37
L_delete_user38:
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
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_col+0
	MOVLW      _msg_deleting+0
	MOVWF      FARG_Lcd_Out_Const_text+0
	MOVLW      hi_addr(_msg_deleting+0)
	MOVWF      FARG_Lcd_Out_Const_text+1
	CALL       _Lcd_Out_Const+0
	MOVLW      2
	MOVWF      R11+0
	MOVLW      160
	MOVWF      R12+0
	MOVLW      146
	MOVWF      R13+0
L_delete_user44:
	DECFSZ     R13+0, 1
	GOTO       L_delete_user44
	DECFSZ     R12+0, 1
	GOTO       L_delete_user44
	DECFSZ     R11+0, 1
	GOTO       L_delete_user44
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
L_delete_user45:
	DECFSZ     R13+0, 1
	GOTO       L_delete_user45
	DECFSZ     R12+0, 1
	GOTO       L_delete_user45
	DECFSZ     R11+0, 1
	GOTO       L_delete_user45
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
	MOVF       _user+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_login_mode46
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_col+0
	MOVLW      _msg_user_mode+0
	MOVWF      FARG_Lcd_Out_Const_text+0
	MOVLW      hi_addr(_msg_user_mode+0)
	MOVWF      FARG_Lcd_Out_Const_text+1
	CALL       _Lcd_Out_Const+0
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_login_mode47:
	DECFSZ     R13+0, 1
	GOTO       L_login_mode47
	DECFSZ     R12+0, 1
	GOTO       L_login_mode47
	DECFSZ     R11+0, 1
	GOTO       L_login_mode47
	NOP
	NOP
	MOVLW      1
	MOVWF      _user+0
	CLRF       _admin+0
L_login_mode46:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_col+0
	MOVLW      _msg_enter_key+0
	MOVWF      FARG_Lcd_Out_Const_text+0
	MOVLW      hi_addr(_msg_enter_key+0)
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
	GOTO       L__login_mode109
	MOVLW      255
	XORWF      R0+0, 0
L__login_mode109:
	BTFSS      STATUS+0, 2
	GOTO       L_login_mode48
	GOTO       L_end_login_mode
L_login_mode48:
	CLRF       _slot+0
L_login_mode49:
	MOVLW      128
	XORWF      _slot+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      64
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_login_mode50
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
	GOTO       L_login_mode52
	GOTO       L_login_mode51
L_login_mode52:
	CLRF       _i+0
L_login_mode53:
	MOVLW      128
	XORWF      _i+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      4
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_login_mode54
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
L_login_mode56:
	DECFSZ     R13+0, 1
	GOTO       L_login_mode56
	DECFSZ     R12+0, 1
	GOTO       L_login_mode56
	NOP
	INCF       _i+0, 1
	GOTO       L_login_mode53
L_login_mode54:
	MOVLW      _password_input+0
	MOVWF      FARG_strcmp_s1+0
	MOVLW      _stored_pass+0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__login_mode110
	MOVLW      0
	XORWF      R0+0, 0
L__login_mode110:
	BTFSS      STATUS+0, 2
	GOTO       L_login_mode57
	MOVLW      1
	MOVWF      _match_found+0
	GOTO       L_login_mode50
L_login_mode57:
L_login_mode51:
	INCF       _slot+0, 1
	GOTO       L_login_mode49
L_login_mode50:
	MOVF       _match_found+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_login_mode58
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
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_login_mode59:
	DECFSZ     R13+0, 1
	GOTO       L_login_mode59
	DECFSZ     R12+0, 1
	GOTO       L_login_mode59
	DECFSZ     R11+0, 1
	GOTO       L_login_mode59
	NOP
	NOP
	MOVLW      3
	MOVWF      _tries_left+0
	GOTO       L_login_mode60
L_login_mode58:
	DECF       _tries_left+0, 1
	MOVLW      128
	XORLW      0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _tries_left+0, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_login_mode61
	MOVLW      2
	MOVWF      _current_state+0
	GOTO       L_end_login_mode
L_login_mode61:
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
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_login_mode62:
	DECFSZ     R13+0, 1
	GOTO       L_login_mode62
	DECFSZ     R12+0, 1
	GOTO       L_login_mode62
	DECFSZ     R11+0, 1
	GOTO       L_login_mode62
	NOP
	NOP
L_login_mode60:
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
	MOVF       _admin+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_admin_mode63
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_col+0
	MOVLW      _msg_admin_mode+0
	MOVWF      FARG_Lcd_Out_Const_text+0
	MOVLW      hi_addr(_msg_admin_mode+0)
	MOVWF      FARG_Lcd_Out_Const_text+1
	CALL       _Lcd_Out_Const+0
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_admin_mode64:
	DECFSZ     R13+0, 1
	GOTO       L_admin_mode64
	DECFSZ     R12+0, 1
	GOTO       L_admin_mode64
	DECFSZ     R11+0, 1
	GOTO       L_admin_mode64
	NOP
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
	GOTO       L__admin_mode112
	MOVLW      255
	XORWF      R0+0, 0
L__admin_mode112:
	BTFSS      STATUS+0, 2
	GOTO       L_admin_mode65
	GOTO       L_end_admin_mode
L_admin_mode65:
	GOTO       L_admin_mode66
L_admin_mode63:
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
L_admin_mode67:
	CALL       _get_mapped_key+0
	MOVF       R0+0, 0
	MOVWF      _key+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_admin_mode67
	MOVF       _key+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L_admin_mode70
	CALL       _add_user+0
	GOTO       L_admin_mode71
L_admin_mode70:
	MOVF       _key+0, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L_admin_mode72
	CALL       _delete_user+0
	GOTO       L_admin_mode73
L_admin_mode72:
	MOVF       _key+0, 0
	XORLW      77
	BTFSS      STATUS+0, 2
	GOTO       L_admin_mode74
	CLRF       _current_state+0
L_admin_mode74:
L_admin_mode73:
L_admin_mode71:
	GOTO       L_end_admin_mode
L_admin_mode66:
	MOVLW      _password_input+0
	MOVWF      FARG_strcmp_s1+0
	MOVLW      _ADMIN_KEY+0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__admin_mode113
	MOVLW      0
	XORWF      R0+0, 0
L__admin_mode113:
	BTFSS      STATUS+0, 2
	GOTO       L_admin_mode75
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
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_admin_mode76:
	DECFSZ     R13+0, 1
	GOTO       L_admin_mode76
	DECFSZ     R12+0, 1
	GOTO       L_admin_mode76
	DECFSZ     R11+0, 1
	GOTO       L_admin_mode76
	NOP
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
L_admin_mode77:
	CALL       _get_mapped_key+0
	MOVF       R0+0, 0
	MOVWF      _key+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_admin_mode77
	MOVF       _key+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L_admin_mode80
	CALL       _add_user+0
	GOTO       L_admin_mode81
L_admin_mode80:
	MOVF       _key+0, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L_admin_mode82
	CALL       _delete_user+0
	GOTO       L_admin_mode83
L_admin_mode82:
	MOVF       _key+0, 0
	XORLW      77
	BTFSS      STATUS+0, 2
	GOTO       L_admin_mode84
	CLRF       _current_state+0
L_admin_mode84:
L_admin_mode83:
L_admin_mode81:
	GOTO       L_end_admin_mode
L_admin_mode75:
	DECF       _tries_left+0, 1
	MOVLW      128
	XORLW      0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _tries_left+0, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_admin_mode86
	MOVLW      2
	MOVWF      _current_state+0
	GOTO       L_end_admin_mode
L_admin_mode86:
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
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_admin_mode87:
	DECFSZ     R13+0, 1
	GOTO       L_admin_mode87
	DECFSZ     R12+0, 1
	GOTO       L_admin_mode87
	DECFSZ     R11+0, 1
	GOTO       L_admin_mode87
	NOP
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
	MOVLW      60
	MOVWF      _seconds+0
L_suspended_mode88:
	MOVLW      128
	XORLW      0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _seconds+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_suspended_mode89
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
L_suspended_mode90:
	MOVLW      128
	XORWF      _i+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      31
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_suspended_mode91
	BTFSS      INTCON+0, 2
	GOTO       L_suspended_mode92
	BCF        INTCON+0, 2
	INCF       _i+0, 1
L_suspended_mode92:
	GOTO       L_suspended_mode90
L_suspended_mode91:
	DECF       _seconds+0, 1
	GOTO       L_suspended_mode88
L_suspended_mode89:
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
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main93:
	DECFSZ     R13+0, 1
	GOTO       L_main93
	DECFSZ     R12+0, 1
	GOTO       L_main93
	DECFSZ     R11+0, 1
	GOTO       L_main93
	NOP
	NOP
L_main94:
	GOTO       L_main96
L_main98:
	CALL       _login_mode+0
	GOTO       L_main97
L_main99:
	CALL       _admin_mode+0
	GOTO       L_main97
L_main100:
	CALL       _suspended_mode+0
	GOTO       L_main97
L_main96:
	MOVF       _current_state+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main98
	MOVF       _current_state+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main99
	MOVF       _current_state+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main100
L_main97:
	GOTO       L_main94
L_end_main:
	GOTO       $+0
; end of _main
