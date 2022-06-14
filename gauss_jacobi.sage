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
    b = vector([1,0.8484,0.6867])
    gauss_jacobi(A, b)
    ---------------------------------------------
    """
    n = len(b)
    b = matrix(n, 1, b)
    x = vector(RR, n)
    for i in range(n):
        b = b.with_rescaled_row(i, 1/A[i,i])
        A = A.with_rescaled_row(i, -1/A[i,i])
        A[i,i] = 0.0
    show(A)

    x_ant = x
    err = float('inf')
    b = vector(b)
    while (err >= tol):
        x = A*x + b
        err = (x - x_ant).norm()
        x_ant = x
    return x
