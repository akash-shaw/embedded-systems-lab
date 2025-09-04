	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT L4Q1

L4Q1
	LDR     R0, =hexVal      ; R0 = address of hexVal
	LDRB    R1, [R0]         ; R1 = 0x3A (example hex value)

	MOV     R2, R1, LSR #4   ; Shift right 4 bits ? R2 = 0x03
	BL      toASCII          ; Convert high nibble to ASCII
	STRB    R0, highDigit    ; Store ASCII char

	MOV     R2, R1           ; R2 = original value
	AND     R2, R2, #0x0F    ; Mask to keep last 4 bits ? R2 = 0x0A
	BL      toASCII          ; Convert low nibble to ASCII
	STRB    R0, lowDigit     ; Store ASCII char

STOP B STOP             ; Infinite loop


toASCII
	CMP     R2, #9           ; If 0–9 ? '0' to '9'
	ADDLE   R0, R2, #'0'     ; ASCII for numbers
	ADDGT   R0, R2, #('A' - 10) ; ASCII for A–F
	BX      LR               ; Return

	AREA mydata, DATA, READWRITE
hexVal DCB 0x3A              ; Example 2-digit hex number
highDigit DCB 0
lowDigit DCB 0

	END
