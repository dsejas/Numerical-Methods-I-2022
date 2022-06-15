def newton2(f1, f2, x0, y0, tol=10^-5):
    """
    Implementación computacional del método de Newton para sistemas
    de dos ecauciones no lineales con dos incógnitas
    ---------------------------------------------
    f1, f2: funciones no lineales del sistema en forma canónica
    x0, y0: aproximación incial de la solución
    tol   : tolerancia del error
    ---------------------------------------------
    Ejemplos de uso:
    ---------------------------------------------
    f1(x,y) = x^2 - y - 0.2
    f2(x,y) = y^2 - x - 0.3
    (x0, y0) = (-0.3, -0.1)
    newton2(f1, f2, x0, y0)
    ---------------------------------------------
    f1(x,y) = x^2 - y - 0.2
    f2(x,y) = y^2 - x - 0.3
    (x0, y0) = (-0.3, -0.1)
    newton2(f1, f2, x0, y0, 10^-12)
    ---------------------------------------------
    """
    var('dx dy')  # variables del sistema (deltas)
    # Derivadas de f1 y primera ecuación del sistema:
    df1x(x,y) = f1.diff(x)
    df1y(x,y) = f1.diff(y)
    ec1(x,y) = df1x(x,y) * dx + df1y(x,y) * dy == -f1(x,y) # depende de x, y
    # Derivadas de f1 y primera ecuación del sistema:
    df2x(x,y) = f2.diff(x)
    df2y(x,y) = f2.diff(y)
    ec2(x,y) = df2x(x,y) * dx + df2y(x,y) * dy == -f2(x,y) # depende de x, y
    err = float('inf')  # garantiza una iteración del bucle
    while (err >= tol):
        sol = solve([ec1(x0,y0),ec2(x0,y0)], dx, dy)[0]  # hallamos deltas
        # Valores numéricos de los deltas:
        delta_x = numerical_approx(sol[0].rhs())
        delta_y = numerical_approx(sol[1].rhs())
        # Nuevas aproximaciones:
        x0 += delta_x
        y0 += delta_y
        err = sqrt(delta_x^2 + delta_y^2)  # error absoluto
    return (x0, y0)
