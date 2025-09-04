	AREA MyCode, CODE, READONLY
	ENTRY
	EXPORT __L3Q1A

__L3Q1A
	LDR R0, =SRC       
	LDR R1, =DST      
	MOV R2, #10        

CopyLoop
	LDR R3, [R0], #4   
	STR R3, [R1], #4   
	SUBS R2, R2, #1    
	BNE CopyLoop       

	B .                

SRC DCD 1,2,3,4,5,6,7,8,9,10 
	AREA MyData, DATA, READWRITE
DST SPACE 40                 
	
	END
