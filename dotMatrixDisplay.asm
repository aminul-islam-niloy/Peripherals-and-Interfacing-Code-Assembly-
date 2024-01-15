title   8086 code template (for exe file)

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


mainloop:
   
	mov dx,2000h	; first dot matrix digit
	mov si, 0
	mov cx, 7

next:
	
	mov al,1111111b
	out dx,al
	
	
	;delay 5 sec
	 
	mov bx,cx 
	mov si,dx   
    mov cx,004ch
    mov dx,4b40h
    mov ah,86h
    int 15h
    mov cx,bx
    mov dx,si
	 

	mov al,0000000b
	out dx,al 

	;inc si                          
	inc dx
	
	

	loop next

	jmp mainloop
	    	

; return to operating system:
    ret
start   endp


cseg    ends 

end    start    ; set entry point.

