def gauss(A, b):
    """
    Implementación computacional del método de reudcción Gaussiana para sistemas
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
    n = len(b)
    b = matrix(n,1,b)
    for i in range(n):
        piv = abs(A[i,i])
        r_piv = i
        for j in range(i+1, n):
            if (abs(A[j,i]) > piv):
                piv = A[j,i]
                r_piv = j
        b = b.with_swapped_rows(i, r_piv)
        A = A.with_swapped_rows(i, r_piv)
        for k in range(i+1, n):
            b = b.with_added_multiple_of_row(k, i, -A[k,i]/A[i,i])
            A = A.with_added_multiple_of_row(k, i, -A[k,i]/A[i,i])
    x = vector(RR, n)
    for i in range(n-1, -1, -1):
        x[i] = b[i,0]
        for j in range(i+1, n):
            x[i] -= A[i,j] * x[j]
        x[i] /= A[i,i]
    return x
