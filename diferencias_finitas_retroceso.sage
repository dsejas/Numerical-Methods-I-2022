def diferencias_finitas_retroceso(datos, s=var('s')):
    """
    Subrutina para calcular el polinomio de interpolación de diferencias
    finitas de retroceso (ADVERTANCIA: NO TESTEADO; USE BAJO SU PROPIO
    RIESGO)
    ---------------------------------------------
    datos: nube de puntos
    s    : punto de evaluación (opcional; si no se especifica, la subrutina
           devuelve el polinomio en la variable $s$)
    ---------------------------------------------
    Ejemplos de uso:
    ---------------------------------------------
    datos = [(50,24.94), (60,30.11), (70,36.05), (80,42.84), (90,50.57),
             (100,59.30)]
    diferencias_finitas_retroceso(datos)
    ---------------------------------------------
    datos = [(50,24.94), (60,30.11), (70,36.05), (80,42.84), (90,50.57),
             (100,59.30)]
    diferencias_finitas_retroceso(datos, -2.6)
    ---------------------------------------------
    """
    n = len(datos)  # cantidad de datos
    dif_fin = [0.0] * n  # diferencias finitas
    #  LLenado inicial:
    for i in range(n):
        dif_fin[i] = datos[i][1]

    # Cálculo de las diferencias finitas para el polinomio (los valores
    # no necesarios se sobreescriben):
    for k in range(1, n):
        for i in range(n-k):
            dif_fin[i] = dif_fin[i+1] - dif_fin[i]

    # Polinomio de interpolación:
    P = 0.0
    # Esta es una forma eficiente de evaluar polinomios (se conoce como el
    # algoritmo de Horner):
    for i in range(n-1):
        P += dif_fin[i]
        P *= (s + n - i - 2) / (n - i - 1)
    P += dif_fin[n-1]
    # Si s no es un valor numérico, desarrollar y simplificar P:
    if (s == var('s')):
        P = P.expand()
    return P
