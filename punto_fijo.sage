def punto_fijo(g, x0, tol=10^-6):
    """
    Implementación del método del punto fijo para hallar raíces de una función
    ---------------------------------------
    g  : función tal que f(x) = 0 se reescribe como x = g(x)
    x0 : aproximación inicial del cero de la función
    tol: tolerancia del error
    Recuérdese que |g'(x0)| < 1
    ---------------------------------------
    Ejemplos de uso:
    ---------------------------------------
    f(x) = x^3 + 4*x^2 - 10
    g(x) = 1/2 * (10 - x^3)^(1/2)
    punto_fijo(g, 1.5)
    ---------------------------------------
    f(x) = x^3 + 4*x^2 - 10
    g(x) = 1/2 * (10 - x^3)^(1/2)
    punto_fijo(g, 1.5, 10^-12)
    ---------------------------------------
    """
    err = float('inf')
    x_prev = x0
    while err >= tol:
        x_sig = numerical_approx(g(x_prev))
        err = abs(x_sig - x_prev)
        x_prev = x_sig
    return x_sig
