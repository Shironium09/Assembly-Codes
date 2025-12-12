
mov al, 'B'
mov es, 0b800
mov di, 0
mov cx, 2000

gotoHaters:
	mov b[es:di],al
	add di, 2
	dec cx
	cmp cx, 0
	jne gotoHaters

int 20h
