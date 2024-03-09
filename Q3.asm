[org 0x0100]
jmp start
message: db ' My name is Abdullah Awan, My roll # is 21L-5663, I love praying five times a day.'
length: dw 82

clr_scr:
push es
push ax
push di
mov ax,0xb800
mov es,ax
mov di,0
next:
mov word[es:di],0x0720
add di,2
cmp di,4000
jne next
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
mov ax, [bp+8]  
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
mov word[es:di],0x0720
add di,2
mov si, [bp+6] 
mov cx, [bp+4] 
mov ah, 0x07 
nextchar: 
mov al, [si] 
mov [es:di], ax 
add di, 2
add si, 1 
loop nextchar
pop di
pop si
pop cx
pop ax
pop es
pop bp
ret 6


start: 
call clr_scr 
mov ax,0x5663
push ax
mov ax, message
push ax 
push word [length] 
call Printstr
 
mov ax, 0x4c00 
int 0x21