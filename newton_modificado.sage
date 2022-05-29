def newton_modificado(f, x0, m, tol=10^-6):
    """
    Implementación del método del método de Newton modificado para hallar raíces
    de multiplicidad >1 de una función.
    ---------------------------------------------
    f  : función de la cual se buscan ceros
    x0 : aproximación inicial de la raíz
    m  : multiplicidad de la raíz
    tol: tolerancia del error
    ---------------------------------------------
    Ejemplos de uso:
    ---------------------------------------------
    f(x) = x^3 - 6.4*x^2 + 11.04*x - 5.76
    newton_modificado(f, 1.15, 2)
    ---------------------------------------------
    f(x) = x^3 - 6.4*x^2 + 11.04*x - 5.76
    newton_modificado(f, 1.15, 2, 10^-12)
    ---------------------------------------------
    """
    df(x) = f.diff(x)
    err = float('inf')
    x_ant = x0
    while (err >= tol):
        x_sig = x_ant - m * f(x_ant) / df(x_ant)  # fórmula modificada de Newton
        err = abs(x_sig - x_ant)
        x_ant = x_sig
    return x_sig
