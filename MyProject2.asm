
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
L__Lcd_Out_Const97:
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
	MOVLW      _password_input+0
	MOVWF      FARG_memset_p1+0
	CLRF       FARG_memset_character+0
	MOVLW      5
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
	CLRF       _i+0
L_add_user17:
	MOVLW      128
	XORWF      _i+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      4
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_add_user18
L_add_user20:
	CALL       _get_mapped_key+0
	MOVF       R0+0, 0
	MOVWF      _key+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_add_user20
	MOVF       _key+0, 0
	XORLW      77
	BTFSS      STATUS+0, 2
	GOTO       L_add_user23
	MOVLW      1
	MOVWF      _current_state+0
	GOTO       L_end_add_user
L_add_user23:
	MOVF       _i+0, 0
	ADDLW      _password_input+0
	MOVWF      FSR
	MOVF       _key+0, 0
	MOVWF      INDF+0
	MOVLW      42
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	INCF       _i+0, 1
	GOTO       L_add_user17
L_add_user18:
	CLRF       _slot+0
L_add_user24:
	MOVLW      128
	XORWF      _slot+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      64
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_add_user25
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
	GOTO       L_add_user27
	CLRF       _is_full+0
	GOTO       L_add_user25
L_add_user27:
	INCF       _id+0, 1
	INCF       _slot+0, 1
	GOTO       L_add_user24
L_add_user25:
	MOVF       _is_full+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_add_user28
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
L_add_user29:
	DECFSZ     R13+0, 1
	GOTO       L_add_user29
	DECFSZ     R12+0, 1
	GOTO       L_add_user29
	DECFSZ     R11+0, 1
	GOTO       L_add_user29
	NOP
	NOP
	GOTO       L_end_add_user
L_add_user28:
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
L_add_user30:
	MOVLW      128
	XORWF      _i+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      4
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_add_user31
	MOVF       _i+0, 0
	ADDWF      _addr+0, 0
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _i+0, 0
	ADDLW      _password_input+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_add_user33:
	DECFSZ     R13+0, 1
	GOTO       L_add_user33
	DECFSZ     R12+0, 1
	GOTO       L_add_user33
	NOP
	NOP
	INCF       _i+0, 1
	GOTO       L_add_user30
L_add_user31:
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
	GOTO       L_add_user34
	MOVLW      48
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
L_add_user34:
	MOVLW      _str+0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_add_user35:
	DECFSZ     R13+0, 1
	GOTO       L_add_user35
	DECFSZ     R12+0, 1
	GOTO       L_add_user35
	DECFSZ     R11+0, 1
	GOTO       L_add_user35
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
L_delete_user36:
	MOVLW      128
	XORWF      _i+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      2
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_delete_user37
L_delete_user39:
	CALL       _get_mapped_key+0
	MOVF       R0+0, 0
	MOVWF      _key+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_delete_user39
	MOVF       _key+0, 0
	XORLW      77
	BTFSS      STATUS+0, 2
	GOTO       L_delete_user42
	MOVLW      1
	MOVWF      _current_state+0
	GOTO       L_end_delete_user
L_delete_user42:
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
	GOTO       L_delete_user36
L_delete_user37:
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
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_delete_user43:
	DECFSZ     R13+0, 1
	GOTO       L_delete_user43
	DECFSZ     R12+0, 1
	GOTO       L_delete_user43
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
L_delete_user44:
	DECFSZ     R13+0, 1
	GOTO       L_delete_user44
	DECFSZ     R12+0, 1
	GOTO       L_delete_user44
	DECFSZ     R11+0, 1
	GOTO       L_delete_user44
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
	BCF        PORTC+0, 1
	BSF        PORTC+0, 2
	MOVF       _user+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_login_mode45
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_col+0
	MOVLW      _msg_user_mode+0
	MOVWF      FARG_Lcd_Out_Const_text+0
	MOVLW      hi_addr(_msg_user_mode+0)
	MOVWF      FARG_Lcd_Out_Const_text+1
	CALL       _Lcd_Out_Const+0
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_login_mode46:
	DECFSZ     R13+0, 1
	GOTO       L_login_mode46
	DECFSZ     R12+0, 1
	GOTO       L_login_mode46
	DECFSZ     R11+0, 1
	GOTO       L_login_mode46
	MOVLW      1
	MOVWF      _user+0
	CLRF       _admin+0
L_login_mode45:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_col+0
	MOVLW      _msg_enter_key+0
	MOVWF      FARG_Lcd_Out_Const_text+0
	MOVLW      hi_addr(_msg_enter_key+0)
	MOVWF      FARG_Lcd_Out_Const_text+1
	CALL       _Lcd_Out_Const+0
	MOVLW      _password_input+0
	MOVWF      FARG_memset_p1+0
	CLRF       FARG_memset_character+0
	MOVLW      5
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
	MOVLW      _stored_pass+0
	MOVWF      FARG_memset_p1+0
	CLRF       FARG_memset_character+0
	MOVLW      5
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
	CLRF       _i+0
L_login_mode47:
	MOVLW      128
	XORWF      _i+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      4
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_login_mode48
L_login_mode50:
	CALL       _get_mapped_key+0
	MOVF       R0+0, 0
	MOVWF      _key+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_login_mode50
	MOVF       _key+0, 0
	XORLW      77
	BTFSS      STATUS+0, 2
	GOTO       L_login_mode53
	MOVLW      1
	MOVWF      _current_state+0
	GOTO       L_end_login_mode
L_login_mode53:
	MOVF       _i+0, 0
	ADDLW      _password_input+0
	MOVWF      FSR
	MOVF       _key+0, 0
	MOVWF      INDF+0
	MOVLW      42
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	INCF       _i+0, 1
	GOTO       L_login_mode47
L_login_mode48:
	CLRF       _slot+0
L_login_mode54:
	MOVLW      128
	XORWF      _slot+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      64
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_login_mode55
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
	GOTO       L_login_mode57
	GOTO       L_login_mode56
L_login_mode57:
	CLRF       _i+0
L_login_mode58:
	MOVLW      128
	XORWF      _i+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      4
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_login_mode59
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
L_login_mode61:
	DECFSZ     R13+0, 1
	GOTO       L_login_mode61
	DECFSZ     R12+0, 1
	GOTO       L_login_mode61
	NOP
	INCF       _i+0, 1
	GOTO       L_login_mode58
L_login_mode59:
	MOVLW      _password_input+0
	MOVWF      FARG_strcmp_s1+0
	MOVLW      _stored_pass+0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__login_mode103
	MOVLW      0
	XORWF      R0+0, 0
L__login_mode103:
	BTFSS      STATUS+0, 2
	GOTO       L_login_mode62
	MOVLW      1
	MOVWF      _match_found+0
	GOTO       L_login_mode55
L_login_mode62:
L_login_mode56:
	INCF       _slot+0, 1
	GOTO       L_login_mode54
L_login_mode55:
	MOVF       _match_found+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_login_mode63
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
	BSF        PORTC+0, 1
	BCF        PORTC+0, 2
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_login_mode64:
	DECFSZ     R13+0, 1
	GOTO       L_login_mode64
	DECFSZ     R12+0, 1
	GOTO       L_login_mode64
	DECFSZ     R11+0, 1
	GOTO       L_login_mode64
	MOVLW      3
	MOVWF      _tries_left+0
	GOTO       L_login_mode65
L_login_mode63:
	DECF       _tries_left+0, 1
	MOVLW      128
	XORLW      0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _tries_left+0, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_login_mode66
	MOVLW      2
	MOVWF      _current_state+0
	GOTO       L_end_login_mode
L_login_mode66:
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
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_login_mode67:
	DECFSZ     R13+0, 1
	GOTO       L_login_mode67
	DECFSZ     R12+0, 1
	GOTO       L_login_mode67
	DECFSZ     R11+0, 1
	GOTO       L_login_mode67
L_login_mode65:
L_end_login_mode:
	RETURN
; end of _login_mode

_admin_mode:

	CLRF       _i+0
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	BCF        PORTC+0, 1
	BCF        PORTC+0, 2
	MOVF       _admin+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_admin_mode68
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_Const_col+0
	MOVLW      _msg_admin_mode+0
	MOVWF      FARG_Lcd_Out_Const_text+0
	MOVLW      hi_addr(_msg_admin_mode+0)
	MOVWF      FARG_Lcd_Out_Const_text+1
	CALL       _Lcd_Out_Const+0
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_admin_mode69:
	DECFSZ     R13+0, 1
	GOTO       L_admin_mode69
	DECFSZ     R12+0, 1
	GOTO       L_admin_mode69
	DECFSZ     R11+0, 1
	GOTO       L_admin_mode69
	NOP
	MOVLW      1
	MOVWF      _admin+0
	CLRF       _user+0
L_admin_mode68:
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
	MOVLW      _password_input+0
	MOVWF      FARG_memset_p1+0
	CLRF       FARG_memset_character+0
	MOVLW      5
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
	CLRF       _i+0
L_admin_mode70:
	MOVLW      128
	XORWF      _i+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      4
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_admin_mode71
L_admin_mode73:
	CALL       _get_mapped_key+0
	MOVF       R0+0, 0
	MOVWF      _key+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_admin_mode73
	MOVF       _key+0, 0
	XORLW      77
	BTFSS      STATUS+0, 2
	GOTO       L_admin_mode76
	MOVLW      1
	MOVWF      _current_state+0
	GOTO       L_end_admin_mode
L_admin_mode76:
	MOVF       _i+0, 0
	ADDLW      _password_input+0
	MOVWF      FSR
	MOVF       _key+0, 0
	MOVWF      INDF+0
	MOVLW      42
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	INCF       _i+0, 1
	GOTO       L_admin_mode70
L_admin_mode71:
	MOVLW      _password_input+0
	MOVWF      FARG_strcmp_s1+0
	MOVLW      _ADMIN_KEY+0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__admin_mode105
	MOVLW      0
	XORWF      R0+0, 0
L__admin_mode105:
	BTFSS      STATUS+0, 2
	GOTO       L_admin_mode77
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
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_admin_mode78:
	DECFSZ     R13+0, 1
	GOTO       L_admin_mode78
	DECFSZ     R12+0, 1
	GOTO       L_admin_mode78
	DECFSZ     R11+0, 1
	GOTO       L_admin_mode78
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
L_admin_mode79:
	CALL       _get_mapped_key+0
	MOVF       R0+0, 0
	MOVWF      _key+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_admin_mode79
	MOVF       _key+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L_admin_mode82
	CALL       _add_user+0
	GOTO       L_admin_mode83
L_admin_mode82:
	CALL       _delete_user+0
L_admin_mode83:
	GOTO       L_admin_mode84
L_admin_mode77:
	DECF       _tries_left+0, 1
	MOVLW      128
	XORLW      0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _tries_left+0, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_admin_mode85
	MOVLW      2
	MOVWF      _current_state+0
	GOTO       L_end_admin_mode
L_admin_mode85:
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
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_admin_mode86:
	DECFSZ     R13+0, 1
	GOTO       L_admin_mode86
	DECFSZ     R12+0, 1
	GOTO       L_admin_mode86
	DECFSZ     R11+0, 1
	GOTO       L_admin_mode86
L_admin_mode84:
	CLRF       _current_state+0
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
	MOVLW      _msg_contact+0
	MOVWF      FARG_Lcd_Out_Const_text+0
	MOVLW      hi_addr(_msg_contact+0)
	MOVWF      FARG_Lcd_Out_Const_text+1
	CALL       _Lcd_Out_Const+0
L_suspended_mode87:
	BSF        PORTC+0, 2
	GOTO       L_suspended_mode87
L_end_suspended_mode:
	RETURN
; end of _suspended_mode

_main:

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
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main89:
	DECFSZ     R13+0, 1
	GOTO       L_main89
	DECFSZ     R12+0, 1
	GOTO       L_main89
	DECFSZ     R11+0, 1
	GOTO       L_main89
L_main90:
	GOTO       L_main92
L_main94:
	CALL       _login_mode+0
	GOTO       L_main93
L_main95:
	CALL       _admin_mode+0
	GOTO       L_main93
L_main96:
	CALL       _suspended_mode+0
	GOTO       L_main93
L_main92:
	MOVF       _current_state+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main94
	MOVF       _current_state+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main95
	MOVF       _current_state+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main96
L_main93:
	GOTO       L_main90
L_end_main:
	GOTO       $+0
; end of _main
