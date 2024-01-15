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

	mov dx, 2030h	; first seven segment display

continue:
	mov cx, 2

display: 

	;e
	mov al,01111001b
	out dx,al
	
    mov bx,cx    
    mov cx,004ch
    mov dx,4b40h
    mov ah,86h
    int 15h
    mov cx,bx
    mov dx, 2030h
                 
                 
    ;f
    mov al,01110001b
	out dx,al
	
    mov bx,cx    
    mov cx,004ch
    mov dx,4b40h
    mov ah,86h
    int 15h
    mov cx,bx
    mov dx, 2030h
    
    
    ;h
    mov al,01110110b
	out dx,al
	
    mov bx,cx    
    mov cx,004ch
    mov dx,4b40h
    mov ah,86h
    int 15h
    mov cx,bx
    mov dx, 2030h
    
                 
                 
	loop display
	
	jmp continue

; return to operating system:
    ret
start   endp

cseg    ends 

end    start    ; set entry point.

