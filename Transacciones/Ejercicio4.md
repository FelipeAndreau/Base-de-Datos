# Ejercicio 4
Para cada una de las siguientes planificaciones no serie, indicar si es serializable en cuanto a conflictos.
Justificar.

# Planificacion 1

|  T1  |  T2  |  T3  |  T4  |
| :--: | :--: | :--: | :--: |
| R(A) |      |      |      |
|      |      | R(C) |      |
|      | R(B) |      |      |
| W(A) |      |      | R(D) |
|      |      | W(C) |      |
|      | W(B) |      |      |
|      |      |      | W(D) |

# Planificacion 2

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

# Planificacion 3

|      T1     |    T2    |      T3     |
| :---------: | :------: | :---------: |
|             |  C := 10 |             |
|             | write(C) |             |
|             |          |   read(C)   |
|             |          |   read(A)   |
|             |          | A := A \* C |
|   read(B)   |          |             |
|  A := B + 2 |          |             |
|             |          |  write(A)   |
| B := B \* 2 |          |             |
| write(A)    |          |             |
|             | A := 100 |             |
|             | write(A) |             |

---


- La planificacion 1 es serializable por conflicto ya que no contiene ciclos.

![image](https://github.com/user-attachments/assets/7a573dd8-7eb6-406d-a427-23a28669952e)


- La planificacion 2 es serializable por conflicto ya que no contiene ciclos.

![image](https://github.com/user-attachments/assets/a10a1bde-a021-4ef2-830d-2070fb390925)

- La planificacion 3 no es serializable por conflicto ya que contiene ciclos.

![image](https://github.com/user-attachments/assets/96ccae6a-8a28-4229-b41b-944f67fe0c42)






