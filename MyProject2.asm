
_get_mapped_key:

	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _key+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_get_mapped_key0
	CLRF       R0+0
	GOTO       L_end_get_mapped_key
L_get_mapped_key0:
	MOVF       _key+0, 0
	XORLW      16
	BTFSS      STATUS+0, 2
	GOTO       L_get_mapped_key1
	MOVLW      77
	MOVWF      R0+0
	GOTO       L_end_get_mapped_key
L_get_mapped_key1:
	MOVF       _key+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_get_mapped_key2
	MOVLW      55
	MOVWF      R0+0
	GOTO       L_end_get_mapped_key
L_get_mapped_key2:
	MOVF       _key+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_get_mapped_key3
	MOVLW      56
	MOVWF      R0+0
	GOTO       L_end_get_mapped_key
L_get_mapped_key3:
	MOVF       _key+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_get_mapped_key4
	MOVLW      57
	MOVWF      R0+0
	GOTO       L_end_get_mapped_key
L_get_mapped_key4:
	MOVF       _key+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_get_mapped_key5
	MOVLW      52
	MOVWF      R0+0
	GOTO       L_end_get_mapped_key
L_get_mapped_key5:
	MOVF       _key+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_get_mapped_key6
	MOVLW      53
	MOVWF      R0+0
	GOTO       L_end_get_mapped_key
L_get_mapped_key6:
	MOVF       _key+0, 0
	XORLW      7
	BTFSS      STATUS+0, 2
	GOTO       L_get_mapped_key7
	MOVLW      54
	MOVWF      R0+0
	GOTO       L_end_get_mapped_key
L_get_mapped_key7:
	MOVF       _key+0, 0
	XORLW      9
	BTFSS      STATUS+0, 2
	GOTO       L_get_mapped_key8
	MOVLW      49
	MOVWF      R0+0
	GOTO       L_end_get_mapped_key
L_get_mapped_key8:
	MOVF       _key+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_get_mapped_key9
	MOVLW      50
	MOVWF      R0+0
	GOTO       L_end_get_mapped_key
L_get_mapped_key9:
	MOVF       _key+0, 0
	XORLW      11
	BTFSS      STATUS+0, 2
	GOTO       L_get_mapped_key10
	MOVLW      51
	MOVWF      R0+0
	GOTO       L_end_get_mapped_key
L_get_mapped_key10:
	MOVF       _key+0, 0
	XORLW      14
	BTFSS      STATUS+0, 2
	GOTO       L_get_mapped_key11
	MOVLW      48
	MOVWF      R0+0
	GOTO       L_end_get_mapped_key
L_get_mapped_key11:
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
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_MyProject2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      _password_input+0
	MOVWF      FARG_memset_p1+0
	CLRF       FARG_memset_character+0
	MOVLW      5
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
	CLRF       _i+0
L_add_user12:
	MOVLW      4
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_add_user13
L_add_user15:
	CALL       _get_mapped_key+0
	MOVF       R0+0, 0
	MOVWF      _key+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_add_user15
	MOVF       _key+0, 0
	XORLW      77
	BTFSS      STATUS+0, 2
	GOTO       L_add_user18
	MOVLW      1
	MOVWF      _current_state+0
	GOTO       L_end_add_user
L_add_user18:
	MOVF       _i+0, 0
	ADDLW      _password_input+0
	MOVWF      FSR
	MOVF       _key+0, 0
	MOVWF      INDF+0
	MOVLW      ?lstr2_MyProject2+0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
	INCF       _i+0, 1
	GOTO       L_add_user12
L_add_user13:
	CLRF       _slot+0
L_add_user19:
	MOVLW      64
	SUBWF      _slot+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_add_user20
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
	GOTO       L_add_user22
	CLRF       _is_full+0
	GOTO       L_add_user20
L_add_user22:
	INCF       _id+0, 1
	INCF       _slot+0, 1
	GOTO       L_add_user19
L_add_user20:
	MOVF       _is_full+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_add_user23
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_MyProject2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_add_user24:
	DECFSZ     R13+0, 1
	GOTO       L_add_user24
	DECFSZ     R12+0, 1
	GOTO       L_add_user24
	DECFSZ     R11+0, 1
	GOTO       L_add_user24
	NOP
	NOP
	GOTO       L_end_add_user
L_add_user23:
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_MyProject2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	CLRF       _i+0
L_add_user25:
	MOVLW      4
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_add_user26
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
L_add_user28:
	DECFSZ     R13+0, 1
	GOTO       L_add_user28
	DECFSZ     R12+0, 1
	GOTO       L_add_user28
	NOP
	NOP
	INCF       _i+0, 1
	GOTO       L_add_user25
L_add_user26:
	MOVF       _id+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      _str+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
	MOVLW      _str+0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_MyProject2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_MyProject2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      10
	SUBWF      _id+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_add_user29
	MOVLW      ?lstr7_MyProject2+0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
L_add_user29:
	MOVLW      _str+0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
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
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_MyProject2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	CLRF       _i+0
L_delete_user31:
	MOVLW      2
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_delete_user32
L_delete_user34:
	CALL       _get_mapped_key+0
	MOVF       R0+0, 0
	MOVWF      _key+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_delete_user34
	MOVF       _key+0, 0
	XORLW      77
	BTFSS      STATUS+0, 2
	GOTO       L_delete_user37
	MOVLW      1
	MOVWF      _current_state+0
	GOTO       L_end_delete_user
L_delete_user37:
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
	MOVLW      ?lstr9_MyProject2+0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
	INCF       _i+0, 1
	GOTO       L_delete_user31
L_delete_user32:
	CLRF       _slot+0
L_delete_user38:
	MOVLW      64
	SUBWF      _slot+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_delete_user39
	MOVF       _slot+0, 0
	MOVWF      _addr+0
	RLF        _addr+0, 1
	BCF        _addr+0, 0
	RLF        _addr+0, 1
	BCF        _addr+0, 0
	MOVF       _id+0, 0
	XORWF      _slot+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_delete_user41
	MOVF       _addr+0, 0
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVLW      255
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr10_MyProject2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_delete_user42:
	DECFSZ     R13+0, 1
	GOTO       L_delete_user42
	DECFSZ     R12+0, 1
	GOTO       L_delete_user42
	NOP
	NOP
	GOTO       L_delete_user39
L_delete_user41:
	INCF       _id+0, 1
	INCF       _slot+0, 1
	GOTO       L_delete_user38
L_delete_user39:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr11_MyProject2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_delete_user43:
	DECFSZ     R13+0, 1
	GOTO       L_delete_user43
	DECFSZ     R12+0, 1
	GOTO       L_delete_user43
	DECFSZ     R11+0, 1
	GOTO       L_delete_user43
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
	GOTO       L_login_mode44
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr12_MyProject2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_login_mode45:
	DECFSZ     R13+0, 1
	GOTO       L_login_mode45
	DECFSZ     R12+0, 1
	GOTO       L_login_mode45
	DECFSZ     R11+0, 1
	GOTO       L_login_mode45
	MOVLW      1
	MOVWF      _user+0
	CLRF       _admin+0
L_login_mode44:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr13_MyProject2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
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
L_login_mode46:
	MOVLW      4
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_login_mode47
L_login_mode49:
	CALL       _get_mapped_key+0
	MOVF       R0+0, 0
	MOVWF      _key+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_login_mode49
	MOVF       _key+0, 0
	XORLW      77
	BTFSS      STATUS+0, 2
	GOTO       L_login_mode52
	MOVLW      1
	MOVWF      _current_state+0
	GOTO       L_end_login_mode
L_login_mode52:
	MOVF       _i+0, 0
	ADDLW      _password_input+0
	MOVWF      FSR
	MOVF       _key+0, 0
	MOVWF      INDF+0
	MOVLW      ?lstr14_MyProject2+0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
	INCF       _i+0, 1
	GOTO       L_login_mode46
L_login_mode47:
	CLRF       _slot+0
L_login_mode53:
	MOVLW      64
	SUBWF      _slot+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_login_mode54
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
	GOTO       L_login_mode56
	GOTO       L_login_mode55
L_login_mode56:
	CLRF       _i+0
L_login_mode57:
	MOVLW      4
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_login_mode58
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
L_login_mode60:
	DECFSZ     R13+0, 1
	GOTO       L_login_mode60
	DECFSZ     R12+0, 1
	GOTO       L_login_mode60
	NOP
	INCF       _i+0, 1
	GOTO       L_login_mode57
L_login_mode58:
	MOVLW      _password_input+0
	MOVWF      FARG_strcmp_s1+0
	MOVLW      _stored_pass+0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__login_mode100
	MOVLW      0
	XORWF      R0+0, 0
L__login_mode100:
	BTFSS      STATUS+0, 2
	GOTO       L_login_mode61
	MOVLW      1
	MOVWF      _match_found+0
	GOTO       L_login_mode54
L_login_mode61:
L_login_mode55:
	INCF       _slot+0, 1
	GOTO       L_login_mode53
L_login_mode54:
	MOVF       _match_found+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_login_mode62
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr15_MyProject2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr16_MyProject2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	BSF        PORTC+0, 1
	BCF        PORTC+0, 2
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_login_mode63:
	DECFSZ     R13+0, 1
	GOTO       L_login_mode63
	DECFSZ     R12+0, 1
	GOTO       L_login_mode63
	DECFSZ     R11+0, 1
	GOTO       L_login_mode63
	MOVLW      3
	MOVWF      _tries_left+0
	GOTO       L_login_mode64
L_login_mode62:
	DECF       _tries_left+0, 1
	MOVF       _tries_left+0, 0
	SUBLW      0
	BTFSS      STATUS+0, 0
	GOTO       L_login_mode65
	MOVLW      2
	MOVWF      _current_state+0
	GOTO       L_end_login_mode
L_login_mode65:
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr17_MyProject2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr18_MyProject2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
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
L_login_mode66:
	DECFSZ     R13+0, 1
	GOTO       L_login_mode66
	DECFSZ     R12+0, 1
	GOTO       L_login_mode66
	DECFSZ     R11+0, 1
	GOTO       L_login_mode66
L_login_mode64:
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
	GOTO       L_admin_mode67
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr19_MyProject2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_admin_mode68:
	DECFSZ     R13+0, 1
	GOTO       L_admin_mode68
	DECFSZ     R12+0, 1
	GOTO       L_admin_mode68
	DECFSZ     R11+0, 1
	GOTO       L_admin_mode68
	NOP
	MOVLW      1
	MOVWF      _admin+0
	CLRF       _user+0
L_admin_mode67:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr20_MyProject2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr21_MyProject2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      _password_input+0
	MOVWF      FARG_memset_p1+0
	CLRF       FARG_memset_character+0
	MOVLW      5
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
	CLRF       _i+0
L_admin_mode69:
	MOVLW      4
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_admin_mode70
L_admin_mode72:
	CALL       _get_mapped_key+0
	MOVF       R0+0, 0
	MOVWF      _key+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_admin_mode72
	MOVF       _key+0, 0
	XORLW      77
	BTFSS      STATUS+0, 2
	GOTO       L_admin_mode75
	MOVLW      1
	MOVWF      _current_state+0
	GOTO       L_end_admin_mode
L_admin_mode75:
	MOVF       _i+0, 0
	ADDLW      _password_input+0
	MOVWF      FSR
	MOVF       _key+0, 0
	MOVWF      INDF+0
	MOVLW      ?lstr22_MyProject2+0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
	INCF       _i+0, 1
	GOTO       L_admin_mode69
L_admin_mode70:
	MOVLW      _password_input+0
	MOVWF      FARG_strcmp_s1+0
	MOVLW      _ADMIN_KEY+0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__admin_mode102
	MOVLW      0
	XORWF      R0+0, 0
L__admin_mode102:
	BTFSS      STATUS+0, 2
	GOTO       L_admin_mode76
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr23_MyProject2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr24_MyProject2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_admin_mode77:
	DECFSZ     R13+0, 1
	GOTO       L_admin_mode77
	DECFSZ     R12+0, 1
	GOTO       L_admin_mode77
	DECFSZ     R11+0, 1
	GOTO       L_admin_mode77
	MOVLW      3
	MOVWF      _tries_left+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr25_MyProject2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr26_MyProject2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L_admin_mode78:
	CALL       _get_mapped_key+0
	MOVF       R0+0, 0
	MOVWF      _key+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_admin_mode78
	MOVF       _key+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L_admin_mode81
	CALL       _add_user+0
	GOTO       L_admin_mode82
L_admin_mode81:
	CALL       _delete_user+0
L_admin_mode82:
	GOTO       L_admin_mode83
L_admin_mode76:
	DECF       _tries_left+0, 1
	MOVF       _tries_left+0, 0
	SUBLW      0
	BTFSS      STATUS+0, 0
	GOTO       L_admin_mode84
	MOVLW      2
	MOVWF      _current_state+0
	GOTO       L_end_admin_mode
L_admin_mode84:
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr27_MyProject2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr28_MyProject2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
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
L_admin_mode85:
	DECFSZ     R13+0, 1
	GOTO       L_admin_mode85
	DECFSZ     R12+0, 1
	GOTO       L_admin_mode85
	DECFSZ     R11+0, 1
	GOTO       L_admin_mode85
L_admin_mode83:
	CLRF       _current_state+0
L_end_admin_mode:
	RETURN
; end of _admin_mode

_suspended_mode:

	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr29_MyProject2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr30_MyProject2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L_suspended_mode86:
	BSF        PORTC+0, 2
	GOTO       L_suspended_mode86
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
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr31_MyProject2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main88:
	DECFSZ     R13+0, 1
	GOTO       L_main88
	DECFSZ     R12+0, 1
	GOTO       L_main88
	DECFSZ     R11+0, 1
	GOTO       L_main88
L_main89:
	GOTO       L_main91
L_main93:
	CALL       _login_mode+0
	GOTO       L_main92
L_main94:
	CALL       _admin_mode+0
	GOTO       L_main92
L_main95:
	CALL       _suspended_mode+0
	GOTO       L_main92
L_main91:
	MOVF       _current_state+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main93
	MOVF       _current_state+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main94
	MOVF       _current_state+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main95
L_main92:
	GOTO       L_main89
L_end_main:
	GOTO       $+0
; end of _main
