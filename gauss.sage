def gauss(A, b):
    """
    Implementación computacional del método de reducción Gaussiana para sistemas
    de ecauciones lineales.
    ---------------------------------------------
    A: matriz asociada del sistema
    b: vector de términos independientes
    ---------------------------------------------
    Ejemplos de uso:
    ---------------------------------------------
    A = matrix([[0.331,1.30,0.7],[0.729,0.81,1.6],[2.431,1.21,1.1]])
    b = vector([0.8484,0.6867,1])
    x = gauss(A, b)
    ---------------------------------------------
    """
    n = len(b)  # tamaño del sistema
    b = matrix(n, 1, b)  # para poder realizar operaciones elementales por filas
    for i in range(n):
        piv = A[i,i]  # pivote
        f_piv = i  # fila del pivote
        for k in range(i+1, n):
            if (abs(A[k,i]) > abs(piv)):
                piv = A[k,i]
                f_piv = k
        # Pivote a la diagonal:
        b = b.with_swapped_rows(i, f_piv)
        A = A.with_swapped_rows(i, f_piv)
        # Eliminación de elementos debajo del pivote:
        for k in range(i+1, n):
            b = b.with_added_multiple_of_row(k, i, -A[k,i]/A[i,i])
            A = A.with_added_multiple_of_row(k, i, -A[k,i]/A[i,i])

    # Sustitución inversa:
    x = vector(RR, n)
    b = vector(b)
    for i in range(n-1, -1, -1):
        x[i] = b[i]
        for k in range(i+1, n):
            x[i] -= A[i,k] * x[k]
        x[i] /= A[i,i]
    return x
