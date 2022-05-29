formula_aitken(xn2, xn1, xn) = xn - (xn1 - xn)^2 / (xn2 - 2*xn1 + xn)

def steffenson(g, x0, tol=10^-6):
    """
    Implementación del método de Steffenson para hallar raíces de una función.
    ---------------------------------------------
    g  : función tal que f(x) = 0 se escribe como x = g(x).
    x0 : aproximación inicial de la raíz.
    tol: tolerancia del error
    ---------------------------------------------
    NOTA: Debe cumplirse |g'(x0)| < 1
    ---------------------------------------------

    Ejemplos de uso:
    ---------------------------------------------
    g(x) = 1/2 * (10 - x^3)^(1/2)  # para  f(x) = x^3 + 4*x^2 - 10
    steffenson(g, 1.4)
    ---------------------------------------------
    g(x) = 1/2 * (10 - x^3)^(1/2)  # para  f(x) = x^3 + 4*x^2 - 10
    steffenson(g, 1.4, 10^-12)
    ---------------------------------------------
    """
    err = float('inf')
    x_ant = x0
    while (err >= tol):
        # Tres iteraciones del punto fijo:
        xn = g(x_ant)
        xn1 = g(xn)
        xn2 = g(xn1)
        # Fórmula de aceleración de Aitken
        x_sig = formula_aitken(xn2, xn1, xn)  # puede escribir la fórmula misma
        err = abs(x_sig - x_ant)  # error absoluto
        x_ant = x_sig  # para la siguiente iteración del punto fijo
    return x_sig
