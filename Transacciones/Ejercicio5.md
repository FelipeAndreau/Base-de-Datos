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
