def polinomio_leggrange(datos, x=var('x')):
    """
    Subrutina para calcular el polinomio de interpolación de Lagrange
    ---------------------------------------------
    datos: nube de puntos
    x    : punto de evaluación (opcional; si no se especifica, la subrutina
           devuelve el polinomio en la variable $x$)
    ---------------------------------------------
    Ejemplos de uso:
    ---------------------------------------------
    datos = [(1.2,0.079181), (1.6,0.204120), (2.1,0.322219), (2.5, 0.397940),
             (2.7,0.431364)]
    polinomio_lagrange(datos)
    ---------------------------------------------
    datos = [(1.2,0.079181), (1.6,0.204120), (2.1,0.322219), (2.5, 0.397940),
             (2.7,0.431364)]
    polinomio_lagrange(datos, 2.3)
    ---------------------------------------------
    """
    n = len(datos)  # cantidad de puntos
    L = 0  # polinomio de interpolacidón de Lagrange
    for i in range(n):
        # i-ésimo polinomio de Lagrange:
        L_i = 1
        for j in range(n):
            if (j != i):
                L_i *= (x - datos[j][0]) / (datos[i][0] - datos[j][0])
        L += datos[i][1] * L_i
    # Si x no es valor numérico, desarrollar y simplificar L:
    if (x == var('x')):
        L = L.expand()
    return L
