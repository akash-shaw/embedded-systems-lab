	AREA MyCode, CODE, READONLY
	ENTRY
	EXPORT __L3Q1A

__L3Q1A
	LDR R0, =SRC       ; R0 = pointer to source
	LDR R1, =DST       ; R1 = pointer to destination
	MOV R2, #10        ; R2 = loop counter (10 numbers)

CopyLoop
	LDR R3, [R0], #4   ; Load word from [R0] into R3, then R0 += 4
	STR R3, [R1], #4   ; Store word from R3 into [R1], then R1 += 4
	SUBS R2, R2, #1    ; R2 = R2 - 1, update flags
	BNE CopyLoop       ; If R2 ? 0, loop again

	B .                ; Infinite loop to stop execution

SRC DCD 1,2,3,4,5,6,7,8,9,10 ; Source block (10 words)
	AREA MyData, DATA, READWRITE
DST SPACE 40                 ; 10 words × 4 bytes = 40 bytes
	
	END
