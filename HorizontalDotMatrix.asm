title   8086 code template (for exe file)

; directive to make exe output:
#make_exe#

dseg    segment 'data'

dots db	0000001b,	0000001b,	0000001b,	0000001b,	0000001b  ;1  
    
    db	0000010b,	0000010b,	0000010b,	0000010b,	0000010b  ; 2
    
    db	0000100b,	0000100b,	0000100b,	0000100b,	0000100b  ; 3 
    
    db	0001000b,	0001000b,	0001000b,	0001000b,	0001000b  ; 4
    
    db	0010000b,	0010000b,	0010000b,	0010000b,	0010000b  ; 5
    
    db	0100000b,	0100000b,	0100000b,	0100000b,	0100000b  ; 6
    
    db	1000000b,	1000000b,	1000000b,	1000000b,	1000000b  ; 7
    

	

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


	;mov dx,2000h	; first dot matrix digit
	 mov bx, 0

mainloop: 
	mov si, 0
	mov dx,2000h
	mov cx, 5

next:
	mov al,dots[bx][si]
	out dx,al
	inc si
	inc dx
	

	cmp si, 5
	loopne next

	
	mov dots [35][0],cl
	mov dots [35][1],ch
	

	mov dots [35][2],dl
	mov dots [35][3],dh
	
	   
    mov cx,004ch
    mov dx,4b40h
    mov ah,86h
    int 15h
    
    
    mov cl, dots [35][0]
	mov ch, dots [35][1]
	
	 
	mov dl, dots [35][2]
	mov dh, dots [35][3]

	add bx, 5
	cmp bx, 35
	jne mainloop
	
	mov bx, 0
	jmp mainloop

; return to operating system:
    ret
start   endp

cseg    ends 

        end    start    ; set entry point.

