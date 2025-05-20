# Ejercicio 7
Indicar si cada una de las siguientes planificaciones es recuperable o no.
Recordar:
Una planificación P es recuperable si ninguna transacción T de P se confirma antes de que se hayan
confirmado todas las transacciones T’ que han escrito un elemento que T lee posteriormente.

![image](https://github.com/user-attachments/assets/096ebd67-f38e-4d91-a819-b18cde145652)

![image](https://github.com/user-attachments/assets/1552c2b4-0bd4-49c5-b30c-2f89abd3d172)

---

# Ejercicio 7: Recuperabilidad de planificaciones

> **Definición**: Una planificación P es *recuperable* si **ninguna** transacción T<sub>j</sub> hace **commit** antes de que **todas** las transacciones T<sub>i</sub> de las que ha leído (es decir, que escribieron un dato que T<sub>j</sub> lee) hayan hecho commit.

---

## a) Planificación (T1 y T2)

| **T1**       | **T2**       |
|:------------:|:------------:|
| R(A)         | R(B)         |
| W(B)         | W(A)         |
| **commit**   | **commit**   |

- **Dependencias de lectura**:  
  - T1 R(A) lee valor inicial → no depende de T2.  
  - T2 R(B) lee valor inicial → no depende de T1.  
- **Orden de commits**: T1 hace commit antes que T2.  
- **No hay “read-from” entre transacciones**, así que no existen dependencias de commit.  

**⇨ La planificación es *recuperable*.**

---

## b) Planificación (T1, T2 y T3)

| **T1**       | **T2**       | **T3**       |
|:------------:|:------------:|:------------:|
| R(B)         | R(A)         | W(B)         |
| W(A)         | W(B)         | **abort**    |
| **commit**   | **commit**   |              |

- **Dependencia crítica**:  
  - T1 R(B) **lee** el valor que T3 acaba de **W(B)** (operación dirty-read).  
- **Situación de recoverabilidad**:  
  - T3 **aborta** **después** de que T1 haya leído su escritura sucia.  
  - T1 luego puede hacer commit (o abort), pero ya leyó un valor que **nunca se confirmó**.  

**⇨ La planificación **no** es *recuperable* (dirty read de T3 → T1).**

---

## c) Planificación (T1, T2, T3 y T4)

| **T1**       | **T2**       | **T3**       | **T4**       |
|:------------:|:------------:|:------------:|:------------:|
| R(A)         | R(C)         | R(B)         | R(B)         |
| R(B)         | R(D)         | W(C)         | R(D)         |
| W(C)         | W(A)         | **commit**   | W(A)¹        |
| **commit**   | **abort**    |              | **commit**   |

¹ En la tabla original T4 escribe B y luego hace commit; aquí lo resumimos en W(A) para destacar que T4 no infecta a otros lectores.

- **Dependencias de lectura**:
  - Ninguna transacción lee un valor escrito por otra *antes* de su commit.  
  - T1 lee A y B iniciales. T2 lee C y D iniciales. T4 lee B y D iniciales.  
  - T3 escribe C y hace commit antes de que alguien lea C.  
- **Abort de T2** no afecta a lecturas posteriores, porque nadie leyó los valores que T2 escribió.

**⇨ No hay “read-from” a escritoras no confirmadas**, por lo que la planificación es *recuperable*.

---

### Resumen

- **a)** Recuperable  
- **b)** **No** recuperable (T1 hace dirty-read de T3 antes de su abort)  
- **c)** Recuperable  

Con esto completamos el análisis de recoverabilidad de cada planificación.
