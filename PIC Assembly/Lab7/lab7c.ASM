; MPLab Tutorial Lab
; Modified by Jonathan Monreal


	list      p=16F84A            ; list directive to define processor
	#include <p16F84A.inc>        ; processor specific variable definitions

	__CONFIG   _CP_OFF & _WDT_OFF & _PWRTE_ON & _RC_OSC

; '__CONFIG' directive is used to embed configuration data within .asm file.
; The lables following the directive are located in the respective .inc file.
; See respective data sheet for additional information on configuration word.

; Macros

movlf macro l,r	; move a literal to a register
	movlw l
	movwf r
	  endm

xor macro l,r	; xor a literal with a register's value and save to that register
	movlw 1
	xorwf r,f
	  endm



;***** VARIABLE DEFINITIONS
w_temp        EQU     0x0C        ; variable used for context saving 
status_temp   EQU     0x0D        ; variable used for context saving
result		  EQU	  0x0E		  ; variable used to store the result
num_add		  EQU	  0x0F		  ; used to store the number of times to add
num_sub		  EQU	  0x10		  ; used to store the number of times to subtract







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
	clrf result				; clear the result
	movlf d'10',num_add		; move 10 to num_add
	movlf 4,num_sub			; move 4 to num_sub

add:
	incf result,f			; increment the result
	decfsz num_add			; decrement the num_add counter
	goto add				; while the counter > 0, loop

	movlw 3					; move 3 to the working register

sub:
	subwf result,f			; subtract 3 from the result
	decfsz num_sub			; decrement the num_sub counter
	goto sub				; while the counter > 0, loop

xor_step:
	xor 1,result			; xor the result with 1

fin:
	goto fin


		END                     ; directive 'end of program'

