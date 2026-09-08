
.model small
.stack 100h
.data
    msg1 db "Enter a letter: $"
    msg2 db 13,10,"Converted letter: $"

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Display message
    lea dx, msg1
    mov ah, 09h
    int 21h

    ; Take character input
    mov ah, 01h
    int 21h

    ; Character is stored in AL

    ; Check if uppercase
    cmp al, 'A'
    jl exit

    cmp al, 'Z'
    jle uppercase

    ; Check if lowercase
    cmp al, 'a'
    jl exit

    cmp al, 'z'
    jg exit

    ; Lowercase to uppercase
    sub al, 32
    jmp display

uppercase:
    ; Uppercase to lowercase
    add al, 32

display:
    mov bl, al

    ; Display result message
    lea dx, msg2
    mov ah, 09h
    int 21h

    ; Display converted character
    mov dl, bl
    mov ah, 02h
    int 21h

exit:
    mov ah, 4Ch
    int 21h

main endp
end main

