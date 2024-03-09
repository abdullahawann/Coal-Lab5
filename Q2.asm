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

Printstr: 
push bp 
mov bp, sp 
push es 
push ax 
push bx 
push cx 
push dx 
push di 
mov ax, 0xb800 
mov es, ax  
mov ax, [bp+4]  
mov bx, 10  
mov cx, 0  
nextdigit: 
mov dx, 0  
div bx   
push dx  
inc cx  
cmp ax, 0  
jnz nextdigit  
mov di, 0
nextpos:
pop dx  
mov dh, 0x07  
mov [es:di], dx  
add di, 2  
loop nextpos 
pop di 
pop dx 
pop cx 
pop bx 
pop ax 
pop es 
pop bp 
ret 2 

start: 
call clr_scr  
mov ax, 0x5663
push ax 
call Printstr

mov ax, 0x4c00 
int 0x21