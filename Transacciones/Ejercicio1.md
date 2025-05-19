
# Ejercicio 1
Durante su ejecución una transacción pasa a través de varios estados hasta que se compromete o aborta.
Listar todas las secuencias posibles de estados por los que puede pasar una transacción. Explicar por qué
puede ocurrir cada una de las transiciones de estados.

--- 

![image](https://github.com/user-attachments/assets/b00e90f6-fe89-4371-aba5-f9abccc42008)

- Una transacción entra en **estado activo** inmediatamente después de iniciarse su ejecución; en este estado puede emitir operaciones LEER y ESCRIBIR. Cuando la transacción termina, pasa al **estado de parcialmente confirmada**.
- En ese punto, se necesitan algunos protocolos para comprobar que los cambios de la transacción sean efectivos y una vez que esta comprobación es satisfactoria, se dice que la transacción ha alcanzado su punto de confirmación y entra en el **estado de confirmada**.
- No obstante, una transacción puede entrar en el **estado de fallo** si falla alguna de las comprobaciones o si la transacción es cancelada durante su estado activo.
- El **estado terminado** se alcanza cuando la transacción abandona el sistema.
