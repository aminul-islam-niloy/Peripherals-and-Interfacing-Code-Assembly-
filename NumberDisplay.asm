

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

	;1
	mov al,00000110b
	out dx,al
	
    mov bx,cx    
    mov cx,004ch
    mov dx,4b40h
    mov ah,86h
    int 15h
    mov cx,bx
    mov dx, 2030h
                 
                 
    ;2
    mov al,01011011b
	out dx,al
	
    mov bx,cx    
    mov cx,004ch
    mov dx,4b40h
    mov ah,86h
    int 15h
    mov cx,bx
    mov dx, 2030h
    
    
    ;3
    mov al,01001111b
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


; 0 mov al, 00111111b ; binary representation for 0

; 1 mov al, 00000110b ; binary representation for 1

; 2 mov al, 01011011b ; binary representation for 2

; 3 mov al, 01001111b ; binary representation for 3

; 4 mov al, 01100110b ; binary representation for 4

; 5 mov al, 01101101b ; binary representation for 5

; 6 mov al, 01111101b ; binary representation for 6

; 7 mov al, 00000111b ; binary representation for 7

; 8 mov al, 01111111b ; binary representation for 8

; 9 mov al, 01101111b ; binary representation for 9


