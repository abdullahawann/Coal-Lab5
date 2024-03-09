[org 0x0100]

jmp start

clr_scr:
push es
push ax
push di

mov ax,0xb800
mov es,ax
mov di,0

nextchar:
mov word[es:di],0x0720
add di,2
cmp di,4000
jne nextchar

pop di
pop ax
pop es
ret

start:
call clr_scr

mov ax , 0x4c00
int 0x21
