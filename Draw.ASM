;set the video mode, 320x200, mode 13h

mov ah, 00h         ;set video mode
mov al, 13h         ;set color graphics mode
int 10h             ;execute config

;for the background

mov ah, 0bh         ;set the config
mov bh, 00h         ;this will make it go to the background color
mov bl, 00h         ;set the background as blac
int 10h             ;execute these again

mov si, 0fh

;for the drawing part

mov ax, 00h         ;initialize the mouse
int 33h             ;the mouse interupt

cmp ax, 0h          ;this is to check if the mouse exists (oh if none)
jz Exit             ;so, exit the program if none

MainLoop:

        mov ah, 01h ;detector for keypress
        int 16h     ;interupt for keypresses
        jz Draw     ;if no keyboard presses, proceed to draw loop 

        mov ah, 00h ;get the keypress
        int 16h     ;interupt for keypress

        cmp al, '1' ;if 1 is pressed
        je SetWhite ;set it to white

        cmp al, '2' ;if 2 is pressed
        je SetGreen ;set it to green

        cmp al, '3' ;if 3
        je SetRed   ;set it to red

        cmp al, '4' ;if 4
        je SetBlue  lto blue

        cmp al, 01xb    ;if esc is pressed
        je Exit         ;exit program

    SetWhite:
        mov si, 0fh     ;ascii for white
        jmp Draw

    SetGreen:
        mov si, 02h     ;ascii for grees
        jmp Draw

    SetRed:
        mov si, 04h     ;ascii for red
        jmp Draw

    SetBlue:
        mov si, 01h     ;ascii for blue
        jmp Draw

    Draw:

        mov ax, 03h     ;gets the mouse position and status
        int 33h

        cmp bx, 01h     ;check if the left click is pressed
        jne MainLoop    ;if no click, then just go back here

        cmp bx, 02h
        je Exit

        shr cx, 1

        mov ax, si
        mov ah, 0ch     ;set this to "write" gprahics pixel
        mov bh, 00h     ;set page number (?)
        int 10h
            
        jmp MainLoop


Exit:
    mov ax, 03h
    int 10h
    int 20h
