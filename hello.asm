section .data
    ; Define pi as a single-precision floating-point number (32-bit)
    pi dd 3.14159

    ; Define variables R, b, and result
    R dd 0.0            ; R is a single-precision floating-point number
    b dd 0.0            ; b is a single-precision floating-point number
    result dd 0.0       ; result is a single-precision floating-point number

section .text
    global _start

_start:
    ; Load value of pi into an SSE register
    movss xmm0, dword [pi]

    ; Multiply pi by 2
    movss xmm1, xmm0    ; Load pi into xmm1
    movss xmm2, dword [two] ; Load 2 into xmm2
    mulss xmm1, xmm2    ; xmm1 = pi * 2

    ; Load value of R
    movss xmm2, dword [R]

    ; Square R
    mulss xmm2, xmm2    ; xmm2 = R^2

    ; Multiply pi by 2 * R^2
    mulss xmm1, xmm2    ; xmm1 = pi * 2 * R^2

    ; Load value of b
    movss xmm2, dword [b]

    ; Divide pi * 2 * R^2 by b
    divss xmm1, xmm2    ; xmm1 = (pi * 2 * R^2) / b

    ; Store the result in memory
    movss [result], xmm1

    ; Exit the program
    mov eax, 1          ; syscall number for exit
    xor ebx, ebx        ; return 0 status
    int 0x80            ; make syscall

section .data
    ; Define constant 2 as a single-precision floating-point number
    two dd 2.0
