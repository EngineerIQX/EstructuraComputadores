.data
    prompt1:    .asciiz "Ingresa el primer número: "
    prompt2:    .asciiz "Ingresa el segundo número: "
    prompt3:    .asciiz "Ingresa el tercer número: "
    result:     .asciiz "El número mayor es: "

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

        # Compara los tres números
        bge $t0, $t1, mayor_t0  # Salta a mayor_t0 si $t0 >= $t1
        move $t3, $t1          # Si no, $t1 es mayor, almacena $t1 en $t3
        j comparar_t2

    mayor_t0:
        move $t3, $t0          # $t0 es mayor, almacena $t0 en $t3

    comparar_t2:
        bge $t3, $t2, imprimir_resultado  # Salta a imprimir_resultado si $t3 >= $t2
        move $t3, $t2          # $t2 es mayor, almacena $t2 en $t3

    imprimir_resultado:
        # Imprime el resultado
        li $v0, 4
        la $a0, result
        syscall

        # Imprime el número mayor almacenado en $t3
        li $v0, 1
        move $a0, $t3
        syscall

        # Termina el programa
        li $v0, 10
        syscall
