#make_exe#

dseg    segment 'data'


dseg    ends

sseg    segment stack   'stack'
        dw      100h    dup(?)
sseg    ends

cseg    segment 'code'


start   proc    far

; store return address to os:
 	push    ds
 	mov     ax, 0
 	push    ax

; set segment registers:
	mov     ax, dseg
 	mov     ds, ax
 	mov     es, ax


	mov dx, 2070h

mainloop:  
 
    mov al, 01h
	mov cx, 7        
	
	
	; Red light -> Yellow light -> Green light -> Yellow light -> Red light
	             
	;red     cx=  7 (10 sec)
	                            
	;yellow  cx=  6 (5 sec)
	;green   cx=  5 (15 sec)   
	
	
led:                      
	
    out dx, al
	rol al, 1 
	
	cmp cx,7
	je delay10
	
	cmp cx,6
	je delay5
	
	cmp cx,5
	je delay15

	jmp mainloop
	
	
	
delay5: ;yellow light 5sec delay
    mov bx,cx    
    mov cx,004ch
    mov dx,4b40h
    mov ah,86h
    int 15h
    mov cx,bx
    mov dx, 2070h
    
    loop led  


delay10: ;red light 10 sec delay
    mov bx,cx    
    mov cx,0098h
    mov dx,9680h
    mov ah,86h
    int 15h
    mov cx,bx
    mov dx, 2070h
    
    loop led    
    
    
delay15: ;green light 15 sec delay
    mov bx,cx    
    mov cx,004ch
    mov dx,4b40h
    mov ah,86h
    int 15h
    mov cx,bx
    
    
    mov bx,cx    
    mov cx,0098h
    mov dx,9680h
    mov ah,86h
    int 15h

    mov cx,bx
    mov dx, 2070h
    
    jmp mainloop   
    
	

; return to operating system:

	ret
start   endp

cseg  ends 

end    start    ; set entry point.
