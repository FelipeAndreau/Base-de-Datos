# Ejercicio 4
Para cada una de las siguientes planificaciones no serie, indicar si es serializable en cuanto a conflictos.
Justificar.

|  T1  |  T2  |  T3  |  T4  |
| :--: | :--: | :--: | :--: |
| R(A) |      |      |      |
|      |      | R(C) |      |
|      | R(B) |      | R(D) |
| W(A) |      |      |      |
|      |      | W(C) |      |
|      | W(B) |      |      |
|      |      |      | W(D) |


|  T1  |  T2  |  T3  |  T4  |
| :--: | :--: | :--: | :--: |
|      | R(A) |      |      |
|      | W(B) |      |      |
|      |      |      | R(B) |
|      |      |      | W(B) |
|      |      | R(C) |      |
|      |      | W(B) |      |
| R(A) |      |      |      |
| R(B) |      |      |      |
| R(D) |      |      |      |
| W(A) |      |      |      |
| W(D) |      |      |      |



|      T1     |    T2    |      T3     |
| :---------: | :------: | :---------: |
|             |  C := 10 |             |
|             | write(C) |             |
|             |          |   read(C)   |
|             |          |   read(A)   |
|             |          | A := A \* C |
|             |          |   write(A)  |
|   read(B)   |          |             |
|  A := B + 2 |          |             |
| B := B \* 2 |          |             |
|   write(A)  |          |             |
|             | A := 100 |             |
|             | write(A) |             |
