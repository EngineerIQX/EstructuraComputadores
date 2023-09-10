.data
    prompt1:    .asciiz "Ingresa el primer número: "
    prompt2:    .asciiz "Ingresa el segundo número: "
    prompt3:    .asciiz "Ingresa el tercer número: "
    result_menor: .asciiz "El número menor es: "

.text
    main:
        # Imprime el primer mensaje de solicitud
        li $v0, 4
        la $a0, prompt1
        syscall

        # Lee el primer número desde la entrada estándar (teclado)
        li $v0, 5
        syscall
        move $t0, $v0  # Almacena el primer número en $t0

        # Imprime el segundo mensaje de solicitud
        li $v0, 4
        la $a0, prompt2
        syscall

        # Lee el segundo número desde la entrada estándar (teclado)
        li $v0, 5
        syscall
        move $t1, $v0  # Almacena el segundo número en $t1

        # Imprime el tercer mensaje de solicitud
        li $v0, 4
        la $a0, prompt3
        syscall

        # Lee el tercer número desde la entrada estándar (teclado)
        li $v0, 5
        syscall
        move $t2, $v0  # Almacena el tercer número en $t2

        # Compara los tres números para encontrar el menor
        move $t3, $t0  # Supongamos que $t0 es el menor temporalmente
        ble $t3, $t1, menor_t1  # Salta a menor_t1 si $t1 <= $t3
        move $t3, $t1          # Si no, $t1 es menor, almacena $t1 en $t3

    menor_t1:
        ble $t3, $t2, imprimir_resultado  # Salta a imprimir_resultado si $t2 <= $t3
        move $t3, $t2          # Si no, $t2 es menor, almacena $t2 en $t3

    imprimir_resultado:
        # Imprime el número menor
        li $v0, 4
        la $a0, result_menor
        syscall

        li $v0, 1
        move $a0, $t3  # Carga el número menor en $a0
        syscall

        # Termina el programa
        li $v0, 10
        syscall

