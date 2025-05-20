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

![image](https://github.com/user-attachments/assets/684ec6f0-883e-4c00-a4e1-ffeef4e09b7f)


---

### Caso 2: Resultado = 3

![image](https://github.com/user-attachments/assets/35a72435-fc6a-4868-991b-7204eac0fe07)

---

### Caso 3: Resultado = 2

![image](https://github.com/user-attachments/assets/597ef034-cfb5-4d10-b1aa-cd6bc467b792)


