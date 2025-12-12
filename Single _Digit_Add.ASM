mov ax, 0b800h
mov es, ax
mov di, 8

mov ah, 1
int 21h 
mov dl, al
sub dl, 30h

mov ah, 1
int 21h
mov bl, al
sub bl, 30h

add bl, dl

mov ax, 10
div bl

mov dl, ah
add dl, 30h
mov ah, 2
int 21h

mov dl, al
add dl, 30h
mov ah, 2
int 21h

int 20h