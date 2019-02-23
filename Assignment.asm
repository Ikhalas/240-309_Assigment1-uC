.INCLUDE "m328Pdef.inc"

.DEF VAR_A       = R16
.DEF TMP         = R18

.DEF TMP_2       = R20
.DEF VAR_X       = R21
.DEF VAR_Y       = R22
.DEF select      = R23
.DEF test        = R24

.CSEG
.ORG 0x0000
                             ;0=input  1=output

	ldi VAR_A,0xff
	out DDRB,VAR_A			 ;B output

	ldi VAR_A,0xf0           ;1111 0000
	out DDRC,VAR_A           ;C input : pc4-pc5  output : pc0-pc3


	ldi VAR_A,0x00
	out DDRD,VAR_A       	 ;D input
	
	ldi VAR_X,0x00
	ldi VAR_Y,0x00
	   


MAIN:
	ldi  select,0x01       ;   0=HAN  , 1= KOON   yang rab ka mai dai  WTF!! 
	;in   select,PIND
	;andi select,0x80
	;lsl   select
	;rol   select

	cpi  select,0x00
	breq KOON
	rjmp HAN

KOON:
 	in   VAR_X,PINC       ;read switch from PORTC
	andi VAR_X,0x0f

 	in   VAR_Y,PIND       ;read switch from PORTD
	lsr  VAR_Y
 	lsr  VAR_Y
	andi VAR_Y,0x0f

 	mul  VAR_X,VAR_Y
 	movw TMP,R0

	mov  TMP_2,TMP
    lsr  TMP_2         ;PC4
	lsr  TMP_2         ;PC5

	out PORTB,TMP
	out PORTC,TMP_2	   ;PC4-PC5 --> bit6,bit7

	rjmp MAIN

HAN:
	in   VAR_X,PINC       ;read switch from PORTC
	andi VAR_X,0x0f

	
	lsr VAR_X
	mov TMP,VAR_X
	out PORTB,TMP

	rjmp MAIN 
	

.DSEG
.ESEG
