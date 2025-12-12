jmp Start

org 100h

Start:

    mov ah, 09h
    lea dx, msg1
    int 21h

    mov ah, 0ah
    lea dx, str1
    int 21h

    mov ah, 09H
    lea dx, msg2
    int 21H

    mov ah, 0ah
    lea dx, str2
    int 21h

    mov cx, 7
    lea si, str1 + 8
    lea di, str2 + 8

    Compare:

        mov al, [si]
        mov ah, [di]

        cmp al, ah
        jne NotEqual

        dec si
        dec di

        dec cx
        cmp cx, 0
        jne Compare

Equal:

    mov ah, 09h
    lea dx, msg3
    int 21h
    int 20h

NotEqual:

    mov ah, 09h
    lea dx, msg4
    int 21h
    int 20h
    
msg1 db 0Dh, 0Ah, 'Enter First String: $'
msg2 db 0Dh, 0Ah, 'Enter Second String: $'
msg3 db 0Dh, 0Ah, 'Equal$'
msg4 db 0Dh, 0Ah, 'Not Equal$'

str1 db 8, 0, 8 dup(0)
str2 db 8, 0, 8 dup(0)
