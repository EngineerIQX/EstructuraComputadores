.data
    numero_terminos: .word 10    # Cambia este valor para obtener más o menos términos
    resultado: .space 40         # Espacio para almacenar los resultados

.text
.globl main

main:
    # Leer el número de términos deseado
    lw $t0, numero_terminos

    # Validar si el número de términos es menor o igual a 0
    blez $t0, fin

    # Inicializar los dos primeros términos de la serie
    li $t1, 0    # Primer término
    li $t2, 1    # Segundo término

    # Imprimir los dos primeros términos
    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 11
    li $a0, ' '
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    # Calcular y mostrar los términos restantes
    sub $t0, $t0, 2  # Restar 2 debido a que ya hemos mostrado 2 términos

    loop:
        # Calcular el siguiente término de Fibonacci: t3 = t1 + t2
        add $t3, $t1, $t2

        # Imprimir el resultado
        li $v0, 11
        li $a0, ' '
        syscall

        li $v0, 1
        move $a0, $t3
        syscall

        # Actualizar los términos t1 y t2 para el siguiente cálculo
        move $t1, $t2
        move $t2, $t3

        # Decrementar el contador de términos restantes
        subi $t0, $t0, 1

        # Comprobar si hemos alcanzado el número deseado de términos
        bnez $t0, loop

    fin:
    # Salir del programa
    li $v0, 10
    syscall
