def biseccion(f, a, b, tol=10^-6):
    """
    Implementación del método de bisección para hallar raíces de una función.
    ---------------------------------------------
    f  : función de la que se busca una raíz
    a  : extremo izquierdo del intervalo inicial
    b  : extremo derecho del intervalo inicial
    tol: tolerancia del error
    ---------------------------------------------
    Ejemplos de uso:
    ---------------------------------------------
    f(x) = x^3 + 4*x^2 - 10
    biseccion(f, -2, 2)
    ---------------------------------------------
    f(x) = x^3 + 4*x^2 - 10
    biseccion(f, -2, 2, 10^-12)
    ---------------------------------------------
    """
    err = float('inf') # valor incial del error (asegura 1 iteración)
    x_m = b # la aproximación previa
    while (err >= tol):
        x_prev = x_m # la aproximación actual (punto medio)
        x_m = numerical_approx((a + b) / 2)
        if f(a) * f(x_m) < 0:
            b = x_m
        else:
            a = x_m
        err = abs(x_m - x_prev) # error absoluto
    return x_m

f(x) = x^3 + 4*x^2 - 10
biseccion(f, -2, 2)
