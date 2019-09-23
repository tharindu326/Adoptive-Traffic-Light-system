
#INCLUDE<P16F877A.INC>
ORG		0X00
GOTO START1


COUNT EQU  0X20
ADC_RESULT EQU  0X21 
Count1 equ 0x20
Count2 equ 0x21
Count3 equ 0x22
TGREEN1 EQU 0X25
TGREEN2 EQU 0X26 
count4 equ 0x23
count5 equ 0x24
count6 equ 0x27
 
START1
	
	BCF		STATUS,6    ; SELECT BANK 1 (01)
	BSF		STATUS,5

	CLRF		TRISA	    ; PORTA IS CONFIGURED AS OUTPUT
        CLRF		TRISD	    ; PORTD IS CONFIGURED AS OUTPUT
	MOVLW		0XFF	    ; PORTB IS CONFIGURED AS INPUT
	MOVWF		TRISB
	
	MOVLW		0XFF	    ; PORTC IS CONFIGURED AS INPUT
	MOVWF		TRISC

	BCF		STATUS,5    ; SELECT BANK 0(00)
        BSF             PORTA,4
	CLRF		PORTA	    ; PORTA IS CLEARED
		                       ;	NTAL RED LGHT
	CLRF            PORTD
	movlw           b'00001001'
	movwf           PORTA
	;BSF             PORTA,3
	;BSF             PORTA,0
	CALL    DELAY
	CALL    DELAY
	CALL    DELAY
	GOTO LOOP			    
    
	
LOOP
    btfsc PORTB,0
    goto START2
    btfsc PORTB,1
    call OUTPUT1
    btfsc PORTB,2
    call OUTPUT2
    call OUTPUT3
    

START2 
        CLRF		PORTD	
	CLRF		PORTA	    ; PORTA IS CLEARED
	movlw           b'00001001'
        movwf           PORTA
	CALL    DELAY
	CALL    DELAY
	CALL    DELAY
	
	GOTO LOOP2			    
LOOP2
    
    btfsc PORTC,0
    goto START1
    btfsc PORTC,1
    call OUTPUT4
    btfsc PORTC,2
    call OUTPUT5
    call OUTPUT6
    ;goto START1

    
			;CHEC PORTB(012 BTS)
			;STORE VALUE TGREEN1 REGTER
    		;CALL OUTPUT1
			
				    
   OUTPUT1
    movlw           b'00001000'
    movwf           PORTA
    movlw           b'00001010'
    movwf           PORTA	;YELLOW LGHT ON
    CALL            DELAY	;DELAY FOR TWO SECONDS WTH YELLOW ON
    CALL            DELAY
    movlw           b'00001000'
    movwf           PORTA	;YELLOW LGHT OFF
    movlw           b'00001100'
    movwf           PORTA    ;TURN GREEN LGHT ON
    
    movlw   b'00000101'
    movwf   count4
    call    D1	;DELAY FOR APPROPRATE TME
    
  
    movlw           b'00001010'
    movwf           PORTA	;TURN YELLOW ON
    CALL    DELAY
    
    movlw           b'00001100'
    movwf           PORTA	;TURN YELLOW AND GREEN OFF
    movlw           b'00001000'
    movwf           PORTA			
    movlw           b'00001001'
    movwf           PORTA   ;TURN RED ON
    CALL    DELAY
   
    goto    START2
    
    OUTPUT2
    movlw           b'00001000'
    movwf           PORTA
    movlw           b'00001010'
    movwf           PORTA	;YELLOW LGHT ON
    CALL            DELAY	;DELAY FOR TWO SECONDS WTH YELLOW ON
    CALL            DELAY
    movlw           b'00001000'
    movwf           PORTA	;YELLOW LGHT OFF
    movlw           b'00001100'
    movwf           PORTA    ;TURN GREEN LGHT ON
    
    movlw   b'00001010'
    movwf   count5
    call    D2	;DELAY FOR APPROPRATE TME
    
    movlw           b'00001010'
    movwf           PORTA	;TURN YELLOW ON
    CALL    DELAY
    
    movlw           b'00001100'
    movwf           PORTA	;TURN YELLOW AND GREEN OFF
    movlw           b'00001000'
    movwf           PORTA			
    movlw           b'00001001'
    movwf           PORTA   ;TURN RED ON
    CALL    DELAY
   
    goto    START2
     
OUTPUT3
    movlw           b'00001000'
    movwf           PORTA
    movlw           b'00001010'
    movwf           PORTA	;YELLOW LGHT ON
    CALL            DELAY	;DELAY FOR TWO SECONDS WTH YELLOW ON
    CALL            DELAY
    movlw           b'00001000'
    movwf           PORTA	;YELLOW LGHT OFF
    movlw           b'00001100'
    movwf           PORTA    ;TURN GREEN LGHT ON
    
    movlw   b'00001111'
    movwf   count6
    call    D3	;DELAY FOR APPROPRATE TME
    
  
    movlw           b'00001010'
    movwf           PORTA	;TURN YELLOW ON
    CALL    DELAY
    
    movlw           b'00001100'
    movwf           PORTA	;TURN YELLOW AND GREEN OFF
    movlw           b'00001000'
    movwf           PORTA			
    movlw           b'00001001'
    movwf           PORTA   ;TURN RED ON
    CALL    DELAY
    
    goto    START2
    
    OUTPUT4
    call     DELAY
    movlw    b'00000001'
    movwf    PORTA
    movlw    b'00010001';;;;;;;;;;;;;;;;
    movwf    PORTA
    bsf      PORTD,0
    ;BCF     PORTA,3
    ;BSF	    PORTA,4	;YELLOW LGHT ON
    CALL    DELAY	;DELAY FOR TWO SECONDS WTH YELLOW ON
    CALL    DELAY
    
    movlw    b'00000001'
    movwf    PORTA
    bcf      PORTD,0
    movlw    b'00100001'
    movwf    PORTA
    ;BCF     PORTA,4	;YELLOW LGHT OFF
    ;BSF	    PORTA,5     ;TURN GREEN LGHT ON
    
    movlw   b'00000101'
    movwf   count4
    call    D1	;DELAY FOR APPROPRATE TME
    
  
    movlw    b'00010001'
    movwf    PORTA	;TURN YELLOW ON
    bsf      PORTD,0
    CALL    DELAY
    
    	                ;TURN YELLOW AND GREEN OFF
    movlw    b'00010001'
    movwf    PORTA
    movlw    b'00000001'
    movwf    PORTA
    bcf      PORTD,0    ;yellow off
    movlw    b'00001001'
    movwf    PORTA     ;TURN RED ON
    CALL    DELAY
   
    goto    START1
    
OUTPUT5
    call     DELAY
    movlw    b'00000001'
    movwf    PORTA
    movlw    b'00010001'
    movwf    PORTA
    ;BCF     PORTA,3
    ;BSF	    PORTA,4	;YELLOW LGHT ON
    bsf      PORTD,0  ;;;;;;;;;;;;;;;;;;;;;;;;;
    CALL    DELAY	;DELAY FOR TWO SECONDS WTH YELLOW ON
    CALL    DELAY
    movlw    b'00000001'
    movwf    PORTA
    bcf      PORTD,0     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    movlw    b'00100001'
    movwf    PORTA
    ;BCF     PORTA,4	;YELLOW LGHT OFF
    ;BSF	    PORTA,5     ;TURN GREEN LGHT ON
    
    movlw   b'00001010'
    movwf   count5
    call    D2	;DELAY FOR APPROPRATE TME
    
  
    movlw    b'00010001'
    movwf    PORTA	;TURN YELLOW ON
    bsf      PORTD,0    ;turn on yellow;;;;;;;;;;;;;;;;;;;;;;;;;
    CALL    DELAY
    
    	                ;TURN YELLOW AND GREEN OFF
    movlw    b'00010001'
    movwf    PORTA
    movlw    b'00000001'
    movwf    PORTA
    bcf      PORTD,0;;;;;;;;;;;;;;;;;;;;;;;
    movlw    b'00001001'
    movwf    PORTA     ;TURN RED ON
    CALL    DELAY
   
    goto    START1
    
OUTPUT6
    call     DELAY
    movlw    b'00000001'
    movwf    PORTA
    movlw    b'00010001'
    movwf    PORTA
    bsf      PORTD,0  ;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;BCF     PORTA,3
    ;BSF	    PORTA,4	;YELLOW LGHT ON
    CALL    DELAY	;DELAY FOR TWO SECONDS WTH YELLOW ON
    CALL    DELAY
    movlw    b'00000001'
    movwf    PORTA
    BCF      PORTD,0 ;;;;;;;;;;;;;;;;;;;;;
    movlw    b'00100001'
    movwf    PORTA
    ;BCF     PORTA,4	;YELLOW LGHT OFF
    ;BSF	    PORTA,5     ;TURN GREEN LGHT ON
    
    movlw   b'00001111'
    movwf   count6
    call    D3	;DELAY FOR APPROPRATE TME
    
  
    movlw    b'00010001'
    movwf    PORTA	;TURN YELLOW ON
    BSF      PORTD,0  ;;;;;;;;;;;;;;;;;;;;
    CALL    DELAY
    
    	                ;TURN YELLOW AND GREEN OFF
    movlw    b'00010001'
    movwf    PORTA
    movlw    b'00000001'
    movwf    PORTA
    BCF      PORTD,0;;;;;;;;;;;;;;;
    movlw    b'00001001'
    movwf    PORTA     ;TURN RED ON
    CALL    DELAY
   
    goto    START1
        
  D1:
    CALL    DELAY
    decfsz    count4,1 
    goto    D1
    return 
	
  D2:
    CALL    DELAY
    decfsz    count5,1 
    goto    D2
    return 	
 D3:
    CALL    DELAY
    decfsz    count6,1 
    goto    D3
    return 	
	
	
	
;DELAY LOOP---------------------------------------------------------------------
    DELAY:
   
    loop1:
     decfsz Count1,1
     goto loop2
     return
     
     
   loop2:
     decfsz Count2,1
     goto loop3
     movlw   b'00001111'  
     movwf   Count2
     goto loop1
    
    
   loop3:
    decfsz Count3,1
    goto loop3
    movlw   b'00010111'  
    movwf   Count3
    goto loop2

	
END