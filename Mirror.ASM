mov ax, 0b800h
mov es, ax
mov si, 160
mov di, 318
mov cx, 24

gotoPalindrome:

    mov ah, b[es:si]
    mov b[es:di], ah
    add si, 2
    sub di, 2
    cmp si, di
    jle gotoPalindrome

gotoNextRow:

    add si, 80
    add di, 240
    dec cx
    cmp cx, 0
    jne gotoPalindrome

int 20h