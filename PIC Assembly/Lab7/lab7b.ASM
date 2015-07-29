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
result		  EQU	  0x0E		  ; variable used to store the result







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
	clrf result			; clear the result

	; add 1 ten times
	incf result,f		; add 1 to the result
	incf result,f		; add 1 to the result
	incf result,f		; add 1 to the result
	incf result,f		; add 1 to the result
	incf result,f		; add 1 to the result
	incf result,f		; add 1 to the result
	incf result,f		; add 1 to the result
	incf result,f		; add 1 to the result
	incf result,f		; add 1 to the result
	incf result,f		; add 1 to the result

	; move 3 to the working register
	movlw 3

	; subtract 3 four times
	subwf result,f		; subtract 3 from the result
	subwf result,f		; subtract 3 from the result
	subwf result,f		; subtract 3 from the result
	subwf result,f		; subtract 3 from the result

	movlw 1				; move 1 to the working registry 
	xorwf result,f		; xor the result with 1 (equivalent to xnor with -2)

fin:
	goto fin ; loop




		END                     ; directive 'end of program'

