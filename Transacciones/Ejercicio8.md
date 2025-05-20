## Ejercicio 8

Considere las transacciones **T₁**, **T₂** y **T₃** y las planificaciones **P₁** y **P₂** que aparecen a continuación.  
Dibujar los grafos de precedencia para **P₁** y **P₂** y explicar si cada planificación es serializable.  
Para las serializables, indicar la serie equivalente.  

---

### Transacciones

| Transacción | Operaciones                          |
|:-----------:|:-------------------------------------|
| **T₁**      | 1. `r₁(X)` <br> 2. `r₁(Z)` <br> 3. `w₁(X)` |
| **T₂**      | 1. `r₂(Z)` <br> 2. `r₂(Y)` <br> 3. `w₂(Z)` <br> 4. `w₂(Y)` |
| **T₃**      | 1. `r₃(X)` <br> 2. `r₃(Y)` <br> 3. `w₃(Y)` |

---

### Planificación P₁

| Paso | **T₁**    | **T₂**    | **T₃**    |
|-----:|:----------|:----------|:----------|
| 1    | `r₁(X)`   |           |           |
| 2    |           | `r₂(Z)`   |           |
| 3    | `r₁(Z)`   |           |           |
| 4    |           |           | `r₃(X)`   |
| 5    |           |           | `r₃(Y)`   |
| 6    | `w₁(X)`   |           |           |
| 7    |           |           | `w₃(Y)`   |
| 8    |           | `r₂(Y)`   |           |
| 9    |           | `w₂(Z)`   |           |
| 10   |           | `w₂(Y)`   |           |

#### Grafo de precedencia de P₁

```mermaid
graph LR
  T3 --> T1
  T1 --> T2
  T3 --> T2
