## Ejercicio 6

Sean las transacciones **T₈**, **T₉** y **T₁₀** definidas de la siguiente forma:

| Transacción | Operaciones                        |
|:-----------:|:----------------------------------|
| **T₈**      | `Read(A)`  
               `A := A + 1`  
               `Write(A)`         |
| **T₉**      | `Read(A)`  
               `A := A * 2`  
               `Write(A)`         |
| **T₁₀**     | `Read(A)`  
               `Mostrar(A)`  
               `A := 1`           |

Suponiendo que las transacciones **T₈**, **T₉** y **T₁₀** se pueden ejecutar **concurrentemente** y que inicialmente `A = 0`,  
**¿cuántos y cuáles resultados correctos posibles se pueden tener?**

---

