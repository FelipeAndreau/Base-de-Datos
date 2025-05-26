# Ejercicio 10
Para cada conjunto de transacciones, construir una planificación no serie usando bloqueo de dos fases
estricto. Interpolar las instrucciones entre todas las transacciones participantes en cada planificación.
---

a) T1 = R(A), R(B), W(B), W(C)
T2 = R(D),R(E),W(E),W(D)
T3 = R(B),R(D),W(B),W(D)
T4 = R(A),W(B),R(C),W(D)

![image](https://github.com/user-attachments/assets/825a5287-6e60-4ad9-922e-cd55ee35bd43)


b) T1 = R(A), W(A), W(B), R(C), W(C)
T2 = R(C), W(C)
T3 = R(B),W(B),W(C),R(D),W(D)

![image](https://github.com/user-attachments/assets/1c873398-8321-4a61-a5e7-be11298c5621)
