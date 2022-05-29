def posicion_falsa(f, a, b, tol=10^-6):
    """
    Implementación del método de la posición false para hallar raíces de una
    función.
    ---------------------------------------------
    f  : función de la cual se buscan ceros
    a  : aproximación inicial de la raíz
    b  : aproximación inicial de la raíz
    tol: tolerancia del error
    ---------------------------------------------
    NOTA: la raíz debe estar en el intervalo (a,b) y f(a)f(b) < 0
    ---------------------------------------------
    Ejemplos de uso:
    ---------------------------------------------
    f(x) = x^3 + 4*x^2 - 10
    posicion_falsa(f, 1.2, 1.4)
    ---------------------------------------------
    f(x) = x^3 + 4*x^2 - 10
    posicion_falsa(f, 1.2, 1.4, 10^-12)
    ---------------------------------------------
    """
    err = float('inf')
    while (err >= tol):
        x_sig = b - f(b) * (b - a) / (f(b) - f(a))
        if (f(a) * f(x_sig)) < 0:
            b = x_sig
        else:
            a = x_sig
        err = abs(b - a)
    return x_sig
