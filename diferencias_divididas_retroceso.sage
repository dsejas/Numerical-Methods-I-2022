def diferencias_divididas_retroceso(datos, x=var('x')):
    """
    Subrutina para calcular el polinomio de interpolación de diferencias
    divididas de retroceso (ADVERTANCIA: NO TESTEADO; USE BAJO SU PROPIO
    RIESGO)
    ---------------------------------------------
    datos: nube de puntos
    x    : punto de evaluación (opcional; si no se especifica, la subrutina
           devuelve el polinomio en la variable $x$)
    ---------------------------------------------
    Ejemplos de uso:
    ---------------------------------------------
    datos = [(1,0), (1.35,0.3001), (1.7,0.53063), (1.9, 0.64185), (3,1.09861)]
    diferencias_divididas_retroceso(datos)
    ---------------------------------------------
    datos = [(1,0), (1.35,0.3001), (1.7,0.53063), (1.9, 0.64185), (3,1.09861)]
    diferencias_divididas_retroceso(datos, 2.3)
    ---------------------------------------------
    """
    n = len(datos)  # cantidad de datos
    dif_div_x = [0.0] * n  # valores en x para diferencia divididas
    dif_div_y = [0.0] * n  # diferencia divididas
    #  LLenado inicial:
    for i in range(n):
        dif_div_x[i] = datos[i][0]
        dif_div_y[i] = datos[i][1]

    # Cálculo de las diferencias divididas para el polinomio (los valores
    # no necesarios se sobreescriben):
    for k in range(1, n):
        for i in range(0, n-k):
            dif_div_y[i] = (dif_div_y[i+1] - dif_div_y[i]) \
                           / (dif_div_x[i+k] - dif_div_x[i])

    # Polinomio de interpolación:
    P = 0.0
    # Esta es una forma eficiente de evaluar polinomios (se conoce como el
    # algoritmo de Horner):
    for i in range(n-1):
        P += dif_div_y[i]
        P *= (x - dif_div_x[i+1])
    P += dif_div_y[n-1]
    # Si x no es un valor numérico, desarrollar y simplificar P:
    if (x == var('x')):
        P = P.expand()
    return P
