def punto_fijo2(g1, g2, x0, y0, tol=10^-5):
    """
    Implementación computacional del método del punto fijo para sistemas
    de dos ecauciones no lineales con dos incógnitas
    ---------------------------------------------
    f1, f2: funciones no lineales del sistema en forma canónica
    x0, y0: aproximación incial de la solución
    tol   : tolerancia del error
    ---------------------------------------------
    Ejemplos de uso:
    ---------------------------------------------
    g1(x, y) = sqrt(2*x + y - 0.5)
    g2(x, y) = 1/2 * sqrt(4 - x^2)
    (x0, y0) = (1.6, 0.1)
    punto_fijo2(g1, g2, x0, y0)
    ---------------------------------------------
    g1(x, y) = sqrt(2*x + y - 0.5)
    g2(x, y) = 1/2 * sqrt(4 - x^2)
    (x0, y0) = (1.6, 0.1)
    punto_fijo2(g1, g2, x0, y0, 10^-12)
    ---------------------------------------------
    """
    # Derivadas parciales de g1:
    dg1x(x,y) = g1.diff(x)
    dg1y(x,y) = g1.diff(y)
    # Derivadas parciales de g2:
    dg2x(x,y) = g2.diff(x)
    dg2y(x,y) = g2.diff(y)
    # Verificamos convergencia tentativa:
    test1 = abs(dg1x(x0,y0)) + abs(dg1y(x0,y0))
    test2 = abs(dg2x(x0,y0)) + abs(dg2y(x0,y0))
    if (test1 >= 1) or (test2 >= 1):
        print('¡No es una buena elección de funciones!')
        return

    err = float('inf')  # garantiza una iteraci ón del bucle
    while (err >= tol):
        x_sig = g1(x0, y0)
        y_sig = g2(x0, y0)
        err = sqrt((x_sig - x0)^2 + (y_sig - y0)^2)  # error absoluto
        x0 = x_sig
        y0 = y_sig
    return (x_sig, y_sig)
