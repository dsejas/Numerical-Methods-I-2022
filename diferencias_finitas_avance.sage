def diferencias_finitas_avance(datos, s=var('s')):
    """
    Subrutina para calcular el polinomio de interpolación de diferencias
    finitas de avance (ADVERTANCIA: NO TESTEADO; USE BAJO SU PROPIO
    RIESGO)
    ---------------------------------------------
    datos: nube de puntos
    s    : punto de evaluación (opcional; si no se especifica, la subrutina
           devuelve el polinomio en la variable $s$)
    ---------------------------------------------
    Ejemplos de uso:
    ---------------------------------------------
    datos = [(1.2,0.079181), (1.6,0.204120), (2,0.301030), (2.4,0.380211),
             (2.8,0.447158)]
    diferencias_finitas_avance(datos)
    ---------------------------------------------
    datos = [(1.2,0.079181), (1.6,0.204120), (2,0.301030), (2.4,0.380211),
             (2.8,0.447158)]
    diferencias_finitas_avance(datos, 2.75)
    ---------------------------------------------
    """
    n = len(datos)  # cantidad de datos
    dif_fin = [0.0] * n  # diferencias finitas
    # Llenado inicial:
    for i in range(n):
        dif_fin[i] = datos[i][1]

    # Cálculo de las diferencias finitas para el polinomio (los valores
    # no necesarios se sobreescriben):
    for k in range(0, n):
        for i in range(n-1, k, -1):
            dif_fin[i] = dif_fin[i] - dif_fin[i-1]

    # Polinomio de interpolación:
    P = 0.0
    # Esta es una forma eficiente de evaluar polinomios (se conoce como el
    # algoritmo de Horner):
    for i in range(n-1, 0, -1):
        P += dif_fin[i]
        P *= (s - i + 1) / i
    P += dif_fin[0]
    # Si s no es un valor numérico, desarrollar y simplificar P:
    if (s == var('s')):
        P = P.expand()
    return P
