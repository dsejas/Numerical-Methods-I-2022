def secante(f, a, b, tol=10^-6):
    """
    Implementación del método de la secante para hallar raíces de una función.
    ---------------------------------------------
    f  : función de la cual se buscan ceros
    a  : aproximación inicial de la raíz
    b  : aproximación inicial de la raíz
    tol: tolerancia del error
    ---------------------------------------------
    NOTA: la raíz debe estar en el intervalo (a,b)
    ---------------------------------------------
    Ejemplos de uso:
    ---------------------------------------------
    f(x) = x^3 + 4*x^2 - 10
    secante(f, 1.2, 1.4)
    ---------------------------------------------
    f(x) = x^3 + 4*x^2 - 10
    secante(f, 1.2, 1.4, 10^-12)
    ---------------------------------------------
    """
    err = float('inf')
    xn = a
    xn1 = b
    while (err >= tol):
        xn2 = xn1 - f(xn1) * (xn1 - xn) / (f(xn1) - f(xn))
        err = abs(xn2 - xn1)
        xn = xn1
        xn1 = xn2
    return xn2
