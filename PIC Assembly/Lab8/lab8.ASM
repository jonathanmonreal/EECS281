; Lab 8
; Template modified by Jonathan Monreal


	list      p=16F84A            ; list directive to define processor
	#include <p16F84A.inc>        ; processor specific variable definitions

	__CONFIG   _CP_OFF & _WDT_OFF & _PWRTE_ON & _RC_OSC

; '__CONFIG' directive is used to embed configuration data within .asm file.
; The lables following the directive are located in the respective .inc file.
; See respective data sheet for additional information on configuration word.

; Macros

movlf macro l,r
	movlw l
	movwf r
	  endm

ifeq macro r,l
	movlw l
	xorwf r,w
	btfsc STATUS,Z
	  endm

ifeqf macro r1,r2
	movf r1,w
	xorwf r2,w
	btfsc STATUS,Z
	  endm

; state definition for no input

NOIN equ b'00000000'

; state definitions for outputs

L1  equ b'00000001'				  ; L1 corresponding to S1
L2  equ b'00000010'				  ; L2 corresponding to S2
L3  equ b'00000100'				  ; L3 corresponding to S3
L4  equ b'00001000'				  ; L4 corresponding to S4
ERR equ b'10000000'				  ; ERR corresponding to errS
OK  equ b'00001111'				  ; OK corresponding to okS

;***** VARIABLE DEFINITIONS
w_temp        EQU     0x0C        ; variable used for context saving 
status_temp   EQU     0x0D        ; variable used for context saving
olctr		  EQU	  0x0E		  ; outer loop counter for delay
ilctr		  EQU	  0x0F		  ; inner loop counter for delay







;**********************************************************************
		ORG     0x000             ; processor reset vector
  		goto    main              ; go to beginning of program


		ORG     0x004             ; interrupt vector location
		movwf   w_temp            ; save off current W register contents
		movf	STATUS,w          ; move status register into W register
		movwf	status_temp       ; save off contents of STATUS register


; isr code can go here or be located as a call subroutine elsewhere


		movf    status_temp,w     ; retrieve copy of STATUS register
		movwf	STATUS            ; restore pre-isr STATUS register contents
		swapf   w_temp,f
		swapf   w_temp,w          ; restore pre-isr W register contents
		retfie                    ; return from interrupt


; Jonathan Monreal

main:
	bsf STATUS,RP0			; switch to bank 1
	clrf TRISB				; set PORTB as output
	bcf STATUS,RP0			; switch to bank 0

S1:
	movlf L1,PORTB			; set RB0 as output (0x01)
	goto delay

S2:
	movlf L2,PORTB			; set RB1 as output(0x02)
	goto delay

S3:
	movlf L3,PORTB			; set RB2 as output (0x04)
	goto delay

S4:
	movlf L4,PORTB			; set RB3 as output (0x08)
	goto delay

errS:
	movlf ERR,PORTB			; set RB7 as output (0x80)
	goto delay

okS:
	movlf OK,PORTB			; set RB3-0 as output (0x0F)
	goto delay

delay:
	movlf 0x20,olctr		; move 32 to outer loop counter
loop1:
	clrf ilctr				; clear inner loop counter
	; add an additional 9 no operations for every outer loop for more precise timing
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
loop2:
	decfsz ilctr,f			; while (--ilctr > 0)
	goto loop2
	decfsz olctr,f			; while (--olctr > 0)
	goto loop1
end_loop:
	ifeqf PORTA,PORTB		; if (PORTA == PORTB)
	goto okS				; 	goto win state
	ifeq PORTA,NOIN			; if (no input to PORTA)
	goto nextS				; 	goto next state S1-S4
	goto errS				; else goto error state (either wrong or > 1 input)

nextS:
	ifeq PORTB,L1			; if (current state == S1)
	goto S2					; 	goto S2
	ifeq PORTB,L2			; else if (current state == S2)
	goto S3					; 	goto S3
	ifeq PORTB,L3			; else if (current state == S3)
	goto S4					; 	goto S4
	ifeq PORTB,L4			; else if (current state == S4)
	goto S1					; 	goto S1
	goto S1					; else (covers current state == errS | current state == okS)
	

		END                     ; directive 'end of program'

