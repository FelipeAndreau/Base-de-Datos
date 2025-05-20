## Ejercicio 6

Sean las transacciones **T₈**, **T₉** y **T₁₀** definidas de la siguiente forma:

| Transacción | Operaciones                        |
|:-----------:|:----------------------------------|
| **T₈**      | `Read(A)`          |       
|             | `A := A + 1`       |
|             | `Write(A)`         |
| **T₉**      | `Read(A)`          |  
|             | `A := A * 2`       |
|             | `Write(A)`         |
| **T₁₀**     | `Read(A)`          |
|             | `Mostrar(A)`       |
|             | `A := 1`           |

Suponiendo que las transacciones **T₈**, **T₉** y **T₁₀** se pueden ejecutar **concurrentemente** y que inicialmente `A = 0`,  
**¿cuántos y cuáles resultados correctos posibles se pueden tener?**

---

### Caso 1: Resultado = 1

| **T8**         | **T9** | **T10**      |
|:---------------|:-------|:-------------|
| Read(A)        |        | Read(A)      |
| A := A + 1     |        | Mostrar(A)   |
| Write(A)       |        | A := 1       |

Aquí el resultado que devuelve A es **1**

---

### Caso 2: Resultado = 3

| **T8** | **T9**         | **T10**      |
|:-------|:---------------|:-------------|
|        | Read(A)        | Read(A)      |
|        | A := A * 2     | Mostrar(A)   |
|        | Write(A)       | A := 1       |

Aquí el resultado que devuelve A es **3**

---

### Caso 3: Resultado = 2

| **T8**         | **T9**         | **T10**      |
|:---------------|:---------------|:-------------|
| Read(A)        | Read(A)        | Read(A)      |
| A := A + 1     | A := A * 2     | Mostrar(A)   |
| Write(A)       | Write(A)       | A := 1       |

En este caso el resultado que devuelve A es **2**

