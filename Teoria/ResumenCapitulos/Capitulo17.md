# Capítulo 17: Introducción a los conceptos y la teoría sobre el procesamiento de transacciones

## 1. Contexto y motivación
- Los **sistemas de procesamiento de transacciones** gestionan bases de datos con cientos o miles de usuarios concurrentes.
- Ejemplos de aplicación: reservas de aerolíneas, banca, tarjetas de crédito, mercados de valores, etc.
- Requisitos clave: **alta disponibilidad** y **respuesta rápida** ante usuarios simultáneos.

## 2. Definición de transacción
- Una **transacción** es la unidad lógica de trabajo que debe completarse en su totalidad para garantizar la exactitud de la base de datos.
- Permite agrupar operaciones (lecturas, escrituras, actualizaciones) que deben darse por válidas sólo si todas se ejecutan correctamente.

## 3. Problemas fundamentales
- **Control de concurrencia**  
  Varias transacciones pueden interferir y producir resultados incorrectos si no se coordinan adecuadamente.
- **Recuperación ante fallos**  
  Debe existir un mecanismo para restaurar la consistencia de la BD cuando ocurre un error durante la ejecución de transacciones.

## 4. Estructura del capítulo
1. **17.1** – Qué son el control de concurrencia y la recuperación en un SGBD.  
2. **17.2** – Concepto formal de transacción y nociones relacionadas.  
3. **17.3** – Propiedades ACID: Atomicidad, Consistencia, Aislamiento y Durabilidad.  
4. **17.4** – Planificación (scheduling) de transacciones y criterios de recuperabilidad.  
5. **17.5** – Serializabilidad: cuándo una ejecución concurrente equivale a una secuencia serial.  
6. **17.6** – Servicios SQL que soportan el concepto de transacción.  
7. **Capítulos siguientes** – Detalles de técnicas de control de concurrencia (Cap. 18) y recuperación (Cap. 19).

---

## 17.1 Introducción al procesamiento de transacciones

En esta sección se presentan de forma informal los conceptos básicos de ejecución concurrente de transacciones y recuperación ante fallos.

### 17.1.1 Sistema monousuario frente a sistema multiusuario
- **Sistema monousuario**  
  Sólo un usuario (o proceso) puede acceder a la base de datos a la vez.  
  – Característico de sistemas personales o muy pequeños.

- **Sistema multiusuario**  
  Varios usuarios o procesos pueden acceder simultáneamente a la base de datos.  
  – Necesario en aplicaciones como reservas de aerolíneas, banca, supermercados, etc.

- **Multiprogramación**  
  Permite al sistema operativo alternar la CPU entre varios procesos, de modo que parezca que corren al mismo tiempo.

- **Interpolación (time-sharing)**  
  La CPU ejecuta un fragmento de cada proceso en turno, manteniendo ocupada la CPU incluso durante operaciones de E/S.

- **Procesamiento paralelo**  
  Con varios procesadores (CPUs) reales, varios procesos pueden ejecutarse al mismo tiempo.

> **Nota**: En teoría de bases de datos asumiremos el modelo multiusuario con concurrencia interpolada, salvo que se indique lo contrario.

---

### 17.1.2 Transacciones, operaciones de lectura y escritura y búferes DBMS
- **Transacción**  
  Programa en ejecución que constituye una unidad lógica de trabajo en la base de datos.  
  Agrupa una o más operaciones de acceso (inserción, borrado, modificación o recuperación) que deben completarse todas o ninguna.

- **Operación de lectura (Read)**  
  Recupera un bloque (o página) de datos desde disco al buffer del DBMS para uso de la transacción.

- **Operación de escritura (Write)**  
  Envía un bloque modificado desde el buffer del DBMS de vuelta al disco para persistencia.

- **Búfer DBMS (Buffer pool)**  
  Área de memoria gestionada por el SGBD donde se almacenan temporalmente los bloques de datos leídos/escritos, reduciendo accesos directos a disco y mejorando el rendimiento.
