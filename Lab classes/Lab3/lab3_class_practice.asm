.model small
.stack 100h

.data
    n1   db ?
    n2   db ?
    sum  db ?
    dif  db ?
    mult db ?
    quot db ?
    rem  db ?

.code
main proc

    mov ax, @data
    mov ds, ax

    mov ah, 1
    int 21h
    sub al, 30h
    mov n1, al

    mov ah, 2
    mov dl, 32
    int 21h

    mov ah, 1
    int 21h
    sub al, 30h
    mov n2, al

    mov al, n1
    add al, n2
    mov sum, al

    mov al, n1
    sub al, n2
    mov dif, al

    mov al, n1
    mov bl, n2
    mul bl
    mov mult, al

    mov al, n1
    mov ah, 0
    mov bl, n2
    div bl

    mov quot, al
    mov rem, ah

    mov ah, 2
    mov dl, 13
    int 21h

    mov dl, 10
    int 21h

    mov dl, sum
    add dl, 30h
    mov ah, 2
    int 21h

    mov dl, 32
    int 21h

    mov dl, dif
    add dl, 30h
    mov ah, 2
    int 21h

    mov dl, 32
    int 21h

    mov dl, mult
    add dl, 30h
    mov ah, 2
    int 21h

    mov dl, 32
    int 21h

    mov dl, quot
    add dl, 30h
    mov ah, 2
    int 21h

    mov dl, 32
    int 21h

    mov dl, rem
    add dl, 30h
    mov ah, 2
    int 21h

    mov ah, 4ch
    int 21h

main endp
end main