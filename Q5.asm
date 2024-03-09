[org 0x0100]

jmp start

r: dw 0
l: dw 0
f: dd 0

digit_separator:
push ax
mov bx,0x000F
mov cx,0x00F0
mov dx,0x0F00
mov si,0xF000
and bx,ax
and cx,ax
and dx,ax
and si,ax
shr cx,4
shr dx,8
shr si,12
pop ax
ret

RandL:
push ax
push bx
push cx
push dx
add bx,cx
add bx,dx
add bx,si
shr bx,2
mov [r],bx
add bx,3
mov [l],bx
pop dx
pop cx
pop bx
pop ax
ret

addition:
push ax
push word[r]
push word[l]
push bp
mov bp,sp
mov bx,[bp+2]
l2:
mov ax,[bp+4]
mov cx,bx
l1:
mul word[bp+4]
dec cx
cmp cx,1
jne l1
add word[f+2],ax
adc word[f],dx
dec bx
cmp bx,0
jne l2
mov bx,[f]
mov cx,[f+2]
pop bp
pop word[l]
pop word[r]
pop ax
ret

start:
mov ax,0x5663
call digit_separator
call RandL
call addition

mov ax,0x4c00
int 0x21