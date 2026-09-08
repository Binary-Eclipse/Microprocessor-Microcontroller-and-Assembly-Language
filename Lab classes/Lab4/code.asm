.model small
.stack 100h

.data
    and_result db ?
    or_result  db ?
    shl_result db ?
    shr_result db ?
    rol_result db ?
    ror_result db ?

.code
main proc

    mov ax, @data
    mov ds, ax

    mov al, 18h
    and al, 0Fh
    mov and_result, al

    mov al, 2Ah
    or al, 0D1h
    mov or_result, al

    mov al, 0C4h
    mov cl, 3
    shl al, cl
    mov shl_result, al

    mov al, 6Bh
    mov cl, 6
    shr al, cl
    mov shr_result, al

    mov al, 0FFh
    mov cl, 2
    rol al, cl
    mov rol_result, al

    mov al, 7Ah
    mov cl, 7
    ror al, cl
    mov ror_result, al

    mov dl, 13
    mov ah, 2
    int 21h

    mov dl, 10
    int 21h

    mov al, and_result
    call print_hex

    mov dl, 32
    mov ah, 2
    int 21h

    mov al, or_result
    call print_hex

    mov dl, 32
    mov ah, 2
    int 21h

    mov al, shl_result
    call print_hex

    mov dl, 32
    mov ah, 2
    int 21h

    mov al, shr_result
    call print_hex

    mov dl, 32
    mov ah, 2
    int 21h

    mov al, rol_result
    call print_hex

    mov dl, 32
    mov ah, 2
    int 21h

    mov al, ror_result
    call print_hex

    mov ah, 4ch
    int 21h

main endp

print_hex proc

    mov bl, al

    mov cl, 4
    shr al, cl

    cmp al, 9
    jbe digit1
    add al, 7

digit1:
    add al, 30h
    mov dl, al
    mov ah, 2
    int 21h

    mov al, bl
    and al, 0Fh

    cmp al, 9
    jbe digit2
    add al, 7

digit2:
    add al, 30h
    mov dl, al
    mov ah, 2
    int 21h

    ret

print_hex endp

end main