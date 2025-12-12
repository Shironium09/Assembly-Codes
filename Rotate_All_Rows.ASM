mov ax, 0b800h
mov es, ax


gotoLoop:

    mov ax, -160

    mov cx, 25

    shift_go_down:

        add ax, 160

        mov di, ax
        add di, 158

        mov si, di
        sub si, 2

        mov dl, b[es:di]
        
        mov bx, 79

        start_shift:

            mov dh, b[es:si]
            mov b[es:di], dh

            sub di, 2
            sub si, 2

            dec bx
            cmp bx, 0
            jne start_shift  

        mov di, ax
        mov b[es:di], dl

        call delay

        dec cx
        cmp cx, 0
        jne shift_go_down        

    jmp gotoLoop

delay:

    push cx

    mov cx, 500
    
    delayInner:
        dec cx
        cmp cx, 0
        jne delayInner

    pop cx
    ret

int 20h
