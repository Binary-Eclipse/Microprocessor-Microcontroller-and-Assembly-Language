.model small
.stack 100h

.data

myInput db 'Input:$'
myOutput db 'Output:$'

.code

main proc

mov ax, @data
mov ds, ax

mov dx, offset myInput
mov ah, 09h
int 21h

mov ah, 02h
mov dl, 13
int 21h
mov dl, 10
int 21h

mov ah, 01h
int 21h
mov bl, al

mov ah, 02h
mov dl, 13
int 21h
mov dl, 10
int 21h

mov ah, 01h
int 21h
mov bh, al

mov ah, 02h
mov dl, 13
int 21h
mov dl, 10
int 21h

mov dx, offset myOutput
mov ah, 09h
int 21h

mov ah, 02h
mov dl, 13
int 21h
mov dl, 10
int 21h

mov dl, bl
int 21h

mov dl, 13
int 21h
mov dl, 10
int 21h

mov dl, bh
int 21h

mov ah, 4Ch
int 21h

main endp
end main