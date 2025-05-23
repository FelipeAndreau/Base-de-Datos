## Ejercicio 9

**A) ¿El protocolo de bloqueo garantiza planificaciones serializables? Justificar.**

Sí, el protocolo de bloqueo garantiza planificaciones serializables si se implementa correctamente, especialmente bajo el enfoque del **protocolo de bloqueo en dos fases (2PL - Two-Phase Locking)**. Este protocolo asegura la serializabilidad conflictiva porque impone una disciplina en la que cada transacción debe adquirir todos los bloqueos antes de liberar alguno. Se compone de dos fases:

- **Fase de crecimiento:** la transacción puede adquirir bloqueos pero no liberarlos.
- **Fase de decrecimiento:** la transacción solo puede liberar bloqueos, pero no adquirir nuevos.

Al seguir esta estrategia, se evita que ocurran intercalamientos no serializables entre las transacciones.

---

**B) ¿Qué ventajas y desventajas proporciona la alternativa de bloqueo de dos fases estricto?**

**Ventajas:**

- **Evita lecturas sucias:** Al mantener los bloqueos de escritura hasta el final de la transacción, se evita que otras transacciones lean datos intermedios que podrían ser revertidos.
- **Fácil recuperación ante fallos:** Las transacciones pueden deshacerse de forma segura sin afectar a otras, lo que facilita la implementación del protocolo de recuperación.
- **Mantiene el orden serializable:** Garantiza serializabilidad conflictiva y recuperabilidad.

**Desventajas:**

- **Posibilidad de interbloqueos (deadlocks):** Dado que los bloqueos se retienen por más tiempo, aumenta la probabilidad de que dos o más transacciones se bloqueen mutuamente.
- **Menor concurrencia:** Al retener bloqueos hasta el final, puede reducirse la eficiencia y el paralelismo del sistema.

