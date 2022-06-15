def diferencias_divididas_avance(datos, x=var('x')):
    """
    Subrutina para calcular el polinomio de interpolación de diferencias
    divididas de avance (ADVERTANCIA: NO TESTEADO; USE BAJO SU PROPIO
    RIESGO)
    ---------------------------------------------
    datos: nube de puntos
    x    : punto de evaluación (opcional; si no se especifica, la subrutina
           devuelve el polinomio en la variable $x$)
    ---------------------------------------------
    Ejemplos de uso:
    ---------------------------------------------
    datos = [(1,0), (1.35,0.3001), (1.7,0.53063), (1.9, 0.64185), (3,1.09861)]
    diferencias_divididas_avance(datos)
    ---------------------------------------------
    datos = [(1,0), (1.35,0.3001), (1.7,0.53063), (1.9, 0.64185), (3,1.09861)]
    diferencias_divididas_avance(datos, 2.3)
    ---------------------------------------------
    """
    n = len(datos)  # cantidad de puntos
    dif_div_x = [0.0] * n  # valores en x para diferencia divididas
    dif_div_y = [0.0] * n  # diferencias divididas
    #  LLenado inicial:
    for i in range(n):
        dif_div_x[i] = datos[i][0]
        dif_div_y[i] = datos[i][1]

    # Cálculo de las diferencias divididas para el polinomio (los valores
    # no necesarios se sobreescriben):
    for k in range(0, n):
        for i in range(n-1, k, -1):
            dif_div_y[i] = (dif_div_y[i] - dif_div_y[i-1]) \
                           / (dif_div_x[i] - dif_div_x[i-k-1])

    # Polinomio de interpolación:
    P = 0.0
    # Esta es una forma eficiente de evaluar polinomios (se conoce como el
    # algoritmo de Horner):
    for i in range(n-1, 0, -1):
        P += dif_div_y[i]
        P *= (x - dif_div_x[i-1])
    P += dif_div_y[0]
    # Si x no es un valor numérico, desarrollar y simplificar P:
    if (x == var('x')):
        P = P.expand()
    return P
