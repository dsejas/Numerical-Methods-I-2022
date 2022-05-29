 def newton(f, x0, tol=10^-6):
    """
    Implementación del método de Newton-Raphson para hallar raíces de una
    función.
    ---------------------------------------------
    f  : función de la que se quiere hallar un cero
    x0 : aproximación inicial de la raíz
    tol: tolerancia del error
    ---------------------------------------------
    Ejemplos de uso:
    ---------------------------------------------
    f(x) = x^3 + 4*x^2 - 10
    newton(f, 1.4)
    ---------------------------------------------
    f(x) = x^3 + 4*x^2 - 10
    newton(f, 1.4, 10^-12)
    ---------------------------------------------
    """
    df(x) = f.diff(x)  # derivada de f
    err = float('inf')
    x_ant = x0
    while (err >= tol):
        x_sig = x_ant - f(x_ant) / df(x_ant)  # fórmula de Newton
        err = abs(x_sig - x_ant)  # error absoluto
        x_ant = x_sig
    return x_sig
