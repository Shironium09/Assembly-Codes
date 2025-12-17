org 100h

start:

    ;to print the first message (printf)
    mov ah, 09h
    lea dx, message_1
    int 21h

    ;to scan an input and put it to number_1 (scanf)
    mov ah, 0ah
    lea dx, number_1
    int 21h

    ;to print the second message (printf)
    mov ah, 09h
    lea dx, message_2
    int 21h

    ;to scan an input and put it to number_1 (scanf)
    mov ah, 0ah
    lea dx, number_2
    int 21h

    ;set si and di to point to the very last "address" of num 1 and num 2 (last address of num 1 and num 2)
    lea si, number_1 + 6
    lea di, number_2 + 6

    ;same with the sum, set it to the last (last address of sum)
    lea bx, sum + 5

    ;the loop counter and and clear dx as we will use dl for the carry
    mov cx, 5
    mov dx, 0

    add_loop:

        ;assign the address of the num 1 and num 2 to al and ah respectively
        mov al, [si]
        mov ah, [di]

        ;ASCII to number
        sub al, 30h
        sub ah, 30h

        ;add al and ah, also add al with the carry (0 in the first iteration)
        add al, ah
        add al, dl

        ;check if the sum is less than 9, if it is, perfom no carry with jle (jump if less or equal), else, go jump to the one with carry
        cmp al, 9
        jle no_carry
        jmp with_carry


no_carry:

    mov dl, 0       ;no carry (carry = 0)
    jmp save_digit

with_carry:

    sub al, 10      ;sub al with 10 to get the difference (eg. 15 will be 5 because 15 - 10 = 5)
    mov dl, 1       ;then the carry will be 1 (static set to one because largest possible is 9 + 9, which is 18, so 1 still counts)
    jmp save_digit

save_digit:

    add al, 30h     ;convert it back to ASCII
    mov [bx], al    ;put al (the sum) to the last digit

    dec si
    dec di
    dec bx
    dec cx

    cmp cx, 0       ;if it has not iterated 5 times yet ()
    jne add_loop    ;if still not 0, then go back to adding


    ;this is for the remainding digit (if the sum of all has more than 5 digits, it will be 1, otherwise, it will be 0)
    add dl, 30h     ;convert the carry to ASCII
    mov [bx], dl    ;put the carry to the first address

    ;print the message as well as the sum
    mov ah, 09h
    lea dx, message_3
    int 21h

    mov ah, 09h
    lea dx, sum
    int 21h

int 20h

message_1 db 0Dh, 0Ah, 'Enter first 5 digits number: $'
message_2 db 0Dh, 0Ah, 'Enter second 5 digits number: $'
message_3 db 0Dh, 0Ah, 'Sum of both: $'

number_1 db 6, 0, 6 dup(0)
number_2 db 6, 0, 6 dup(0)
sum  db ' ', ' ', ' ', ' ', ' ', ' ', '$'
