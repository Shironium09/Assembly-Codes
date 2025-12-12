mov es, 0b800   
mov di, 0
mov al, 'A'

gotoLoop:

    mov b[es:di], al

    call delay

    mov b[es:di], ' '
    add di, 2
    cmp di, 158
    jne gotoLoop   
    

delay:

    mov cx, 0ffff
    
    delayInner:
        dec cx
        cmp cx, 0
        jne delayInner

    ret

int 20h