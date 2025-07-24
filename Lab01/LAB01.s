	AREA RESEST, DATA, READONLY
	EXPORT __Vectors
	
__Vectors
	DCD 0x10001000
	DCD Reset_Handler
	
	ALIGN
	
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler

Reset_Handler
	LDR R0, =nigg8u
	LDR R1, [R0]
	STR R1, [R0]

STOP
	B STOP
	
nigg8u DCD 0x12345678
	AREA DATASEG, DATA, READWRITE
	
DST DCD 0
	END