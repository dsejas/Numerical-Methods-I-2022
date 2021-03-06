def gauss_jacobi(A, b, tol=10^-5):
    """
    Implementación computacional del método de Gauss-Jacobi para sistemas de
    ecuaciones lineales.
    ---------------------------------------------
    A  : matriz asociadad del sistema
    b  : vector de términos independientes
    tol: tolerancia del error
    ---------------------------------------------
    Ejemplos de uso:
    ---------------------------------------------
    A = matrix([[2.431,1.21,1.1], [0.331,1.30,0.7], [0.729,0.81,1.6]])
    b = vector([1, 0.8484, 0.6867])
    gauss_jacobi(A, b)
    ---------------------------------------------
    A = matrix([[2.431,1.21,1.1], [0.331,1.30,0.7], [0.729,0.81,1.6]])
    b = vector([1, 0.8484, 0.6867])
    gauss_jacobi(A, b, 10^-12)
    ---------------------------------------------
    """
    n = len(b)  # tamaño del sistema
    # Reescritura del sistema en la forma x = Cx + D:
    C = A[:,:]  # copia sin alias
    D = matrix(n, 1, b)
    for i in range(n):
        D = D.with_rescaled_row(i, 1/A[i,i])
        C = C.with_rescaled_row(i, -1/A[i,i])
        C[i,i] = 0.0

    # Cálculo de aproximaciones de la solución:
    D = vector(D)
    x = vector(RR, n)  # aproximación incial (vector nulo)
    x_ant = x[:]  # copia sin alias
    err = float('inf')  # esto garantiza una iteración del bucle
    while (err >= tol):
        x = C*x_ant + D
        err = (x - x_ant).norm()  # error absoluto
        x_ant = x[:]  # copia sin alias
    return x
