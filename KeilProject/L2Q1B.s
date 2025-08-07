	AREA MyCode, CODE, READONLY
	ENTRY
	EXPORT __L3Q1B
	
__L3Q1B
	LDR R0, =SRC
	LDR R1, =DST
	ADD R0, R0, #36
	ADD R1, R1, #36
	MOV R2, #10
	
CopyBackward
	LDR R3, [R0], #-4
	STR R3, [R1], #-4         
	SUBS R2, R2, #1
	BNE CopyBackward
		
STOP
	B STOP

SRC DCD 11,12,13,14,15,16,17,18,19,20 
	
	AREA MyData, DATA, READWRITE
DST	SPACE 40
	END