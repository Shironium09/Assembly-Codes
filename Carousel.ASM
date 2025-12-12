mov ax, 0b800h
mov es, ax

gotoLoop:

call delay

    FirstCol:

        mov si, 3840
        mov dl, b[es:si]

        mov di, 3840
        mov si, 3680

        mov cx, 25


        Shift_Go_Down:

            mov dh, b[es:si]
            mov b[es:di], dh

            sub di, 160
            sub si, 160

            dec cx
            cmp cx, 0
            jne Shift_Go_Down

        mov di, 0
        mov b[es:di], dl

    pusha

    SecondCol:

        mov si, 0
        mov dl, b[es:si]

        mov di, 2
        mov si, 162

        mov cx, 25

        Shift_Go_Up:

            mov dh, b[es:si]
            mov b[es:di], dh

            add di, 160
            add si, 160

            dec cx
            cmp cx, 0
            jne Shift_Go_Up

        mov di, 3842
        mov b[es:di], dl

    popa

    jmp gotoLoop

delay:

    push cx

    mov cx, 2500
    
    delayInner:
        dec cx
        cmp cx, 0
        jne delayInner

    pop cx
    ret

End:
    
    int 20h
