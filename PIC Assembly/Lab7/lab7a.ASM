; MPLab Tutorial Lab
; Modified by Jonathan Monreal


	list      p=16F84A            ; list directive to define processor
	#include <p16F84A.inc>        ; processor specific variable definitions

	__CONFIG   _CP_OFF & _WDT_OFF & _PWRTE_ON & _RC_OSC

; '__CONFIG' directive is used to embed configuration data within .asm file.
; The lables following the directive are located in the respective .inc file.
; See respective data sheet for additional information on configuration word.




;***** VARIABLE DEFINITIONS
w_temp        EQU     0x0C        ; variable used for context saving 
status_temp   EQU     0x0D        ; variable used for context saving








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
	clrw		; clear the working register

	; add 1 ten times
	addlw 1		; add 1
	addlw 1		; add 1
	addlw 1		; add 1
	addlw 1		; add 1
	addlw 1		; add 1
	addlw 1		; add 1
	addlw 1		; add 1
	addlw 1		; add 1
	addlw 1		; add 1
	addlw 1		; add 1

	; subtract 3 four times
	addlw -3	; subtract 3
	addlw -3	; subtract 3
	addlw -3	; subtract 3
	addlw -3	; subtract 3

	xorlw 1		; xor with 1 (equivalent to xnor with 0)

fin:
	goto fin ; loop


		END                     ; directive 'end of program'

