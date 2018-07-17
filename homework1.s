


  main: nop
      	SUB SP, SP, #(4 * 4)

          	LDR R0,=prompt0         
          	BL _print

          	LDR R0,=get0            
          	BL _scan
          	PUSH {R0}               

          	LDR R0,=get1            
          	BL _scan
          	PUSH {R0}               

          	LDR R0,=get0            
          	BL _scan
          	PUSH {R0}              

          	POP {R3}                
          	POP {R2}               
          	POP {R1}                

          	CMP R2, #'+'
          	BEQ ADD
          	CMP R2, #'-'
          	BEQ SUB
          	CMP R2, #'*'
          	BEQ MUL
		B _exit

    ADD:
          	ADD R5, R1, R3
          	B output
    SUB: 
          	SUB R5, R1, R3
         	B output
    MUL:
         	MUL R5, R1, R3

    output:
	    
         	LDR R0,=prompt1
	   	ADD sp, sp, #(4 * 4)
	    	MOV R1, R5
          	BL _print


            

    _exit:
         	MOV R7, #1
	    	SWI 0		

    _print:
            PUSH {R0, LR}            
            BL printf
            POP {R0, PC}
	    @SWI 0

    _scan:
            PUSH {LR}
            SUB SP, SP, #4
            MOV R1, SP
            BL scanf
            DR R0, [SP]
            ADD SP, SP, #4
            POP {PC}
    .end

.data

 	prompt0: .asciz "" 
 	get0: .asciz "%d" 
	get1: .asciz "%s" 
	prompt1: .asciz "%d\n"

 .align 4 
 .text
 .global main 
 .extern scanf, printf, exit
