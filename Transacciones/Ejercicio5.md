# Ejercicio 5
Para las siguientes transacciones T6 y T7 con A = B = 25:
- a) ¿Cuáles son los resultados posibles con la ejecución en serie de estas transacciones? Justificar.
- b) Armar dos planificaciones no serie serializables en cuanto a conflictos. Justificar.
- c) Armar una planificación no serie NO serializable en cuanto a conflictos.

|      T6      |      T7     |
| :----------: | :---------: |
|    Read(A)   |   Read(A)   |
| A := A + 100 | A := A \* 2 |
|   Write(A)   |   Write(A)  |
|    Read(B)   |   Read(B)   |
| B := B + 100 | B := B \* 2 |
|   Write(B)   |   Write(B)  |

---

## A) Resultados de las ejecuciones en serie

> Los posibles resultados con la ejecucion en serie de estas transacciones son 2!=2, ya que la cantidad de transacciones posibles son n!


Dado A = B = 25, los dos órdenes posibles y sus resultados son:

1. **Orden T₆ → T₇**  
   - Tras ejecutar **T₆**:  
     - A = 25 + 100 = 125  
     - B = 25 + 100 = 125  
   - Tras ejecutar **T₇**:  
     - A = 125 × 2 = 250  
     - B = 125 × 2 = 250  
   **Resultado final:** (A, B) = **(250, 250)**

2. **Orden T₇ → T₆**  
   - Tras ejecutar **T₇**:  
     - A = 25 × 2 = 50  
     - B = 25 × 2 = 50  
   - Tras ejecutar **T₆**:  
     - A = 50 + 100 = 150  
     - B = 50 + 100 = 150  
   **Resultado final:** (A, B) = **(150, 150)**

## B) Planificaciones conflict-serializables (en tablas)

| Planificación | Operaciones en orden                                                                                       | Conflictos y aristas                                              | Grafo equivalente |
|--------------:|:------------------------------------------------------------------------------------------------------------|:------------------------------------------------------------------|:------------------|
| **S₁** (T₆→T₇) | `R6(A), W6(A), R6(B), W6(B), R7(A), W7(A), R7(B), W7(B)`                                                   | **A**: W6(A)→R7(A), W6(A)→W7(A)  <br> **B**: W6(B)→R7(B), W6(B)→W7(B) | T₆ → T₇           |
| **S₂** (T₇→T₆) | `R7(A), W7(A), R7(B), W7(B), R6(A), W6(A), R6(B), W6(B)`                                                   | **A**: W7(A)→R6(A), W7(A)→W6(A)  <br> **B**: W7(B)→R6(B), W7(B)→W6(B) | T₇ → T₆           |

- **Operaciones**: lectura (`R`) y escritura (`W`) de cada transacción sobre A y B.
- **Conflictos**: pares de operaciones sobre la misma variable donde al menos una es escritura, indicando el orden forzado.
- El **grafo** muestra que no hay ciclos, por lo que ambas planificaciones son conflict-serializables.  

