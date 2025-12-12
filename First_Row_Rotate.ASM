mov ax, 0b800h
mov es, ax
mov ds, ax

start_shift:

    shift:

    mov si, 156
    mov di, 158

    mov dl, b[es:158]

    mov cx, 79

    shift_right:

        call reset_shift

        mov al, b[es:si]
        mov b[es:di], al

        sub si, 2
        sub di, 2

        call delay

        dec cx
        cmp cx, 0
        jne shift_right

    mov b[es:0], dl

    jmp shift

reset_shift:

    cmp si, -4
    je reset_si

    cmp di, -2
    je reset_di

    ret


delay:

    push cx

    mov cx, 500
    
    delayInner:
        dec cx
        cmp cx, 0
        jne delayInner

    pop cx
    ret

reset_si:

    mov si, 156

    jmp reset_shift

reset_di:

    mov di, 158

    jmp reset_shift


exit:
    int 20h     
