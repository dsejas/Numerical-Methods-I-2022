def multiplicidad(f, x0):
    """
    Estimación de la multiplicidad de la raíz de una función por medio del
    del método de Newton-Raphson.
    ---------------------------------------------
    f : función de la cual se buscan ceros
    x0: aproximación inicial de la raíz
    ---------------------------------------------
    Ejemplos de uso:
    ---------------------------------------------
    f(x) = x^3 - 6.4*x^2 + 11.04*x - 5.76
    multiplicidad(f, 1.15)
    ---------------------------------------------
    """
    df(x) = f.diff(x)

    # Cuatro iteraciones de Newton-Raphson:
    x1 = x0 - f(x0) / df(x0)
    x2 = x1 - f(x1) / df(x1)
    x3 = x2 - f(x2) / df(x2)
    x4 = x3 - f(x3) / df(x3)

    # Tres estimaciones de la multiplicidad:
    print((1 - (x2 - x1) / (x1 - x0))^-1)
    print((1 - (x3 - x2) / (x2 - x1))^-1)
    print((1 - (x4 - x3) / (x3 - x2))^-1)
