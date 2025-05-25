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

## 17.1.2 Transacciones, operaciones de lectura y escritura y búferes DBMS

En este apartado se formaliza el concepto de **transacción** y se describen las operaciones básicas que interactúan con el **búfer** del SGBD.

### Modelo simplificado de base de datos
- La base de datos se ve como un conjunto de **elementos de datos con nombre** (p. ej. un campo de un registro o un bloque de disco).
- El tamaño de cada elemento es la **granularidad** (puede ser un campo, un registro, o un bloque completo).

### Operaciones básicas
- **read_item(X)**:  
  Lee el elemento de datos nombrado X y lo carga en una variable de programa (a menudo también llamada **X**).
- **write_item(X)**:  
  Escribe el valor actual de la variable de programa X en el elemento de datos nombrado X de la base de datos.

### Pasos de ejecución

1. **read_item(X)**  
   1. Localizar la dirección en disco del bloque que contiene X.  
   2. Si no está en memoria, copiar ese bloque a un **búfer** del SGBD.  
   3. Copiar el valor de X del búfer a la variable de programa.  

2. **write_item(X)**  
   1. Localizar la dirección en disco del bloque que contiene X.  
   2. Si no está en memoria, copiar el bloque al búfer.  
   3. Copiar el valor de la variable X al búfer.  
   4. Marcar el bloque como modificado para que, en algún momento (inmediato o diferido), vuelva al disco.

> **Nota**: El SGBD mantiene varios búferes en memoria principal y emplea políticas de sustitución (por ejemplo, LRU) cuando se agotan.

### Read-set y write-set de una transacción
- El **read-set** es el conjunto de todos los elementos que la transacción lee.  
- El **write-set** es el conjunto de todos los elementos que la transacción escribe.

**Figura 17.2: Ejemplos**  
- **T₁** (transferencia entre X e Y):  
  - read_item(X) → X := X – N → write_item(X)  
  - read_item(Y) → Y := Y + N → write_item(Y)  
  - ⇒ read-set = {X, Y}, write-set = {X, Y}

- **T₂** (sólo X):  
  - read_item(X) → X := X + M → write_item(X)  
  - ⇒ read-set = {X}, write-set = {X}


## 17.1.3 Por qué es necesario controlar la concurrencia

Cuando varias transacciones acceden simultáneamente a los mismos datos sin coordinación, pueden surgir varios problemas:

- **Pérdida de actualización (lost update)**  
  Dos transacciones T₁ y T₂ leen el mismo elemento X y luego escriben sus resultados de forma entrelazada. Si T₂ escribe después de T₁ sin ver su cambio, el nuevo valor de X “pierde” la modificación de T₁.

- **Actualización temporal o lectura sucia (dirty read)**  
  T₁ modifica X y guarda el cambio en el búfer, pero luego falla y deshace su trabajo. Si T₂ leyó ese valor intermedio, habrá usado un dato que nunca llegó a confirmarse en disco.

- **Suma incorrecta (incorrect sum)**  
  Una transacción calcula un total agregando registros mientras otras transacciones modifican esos mismos registros. La intercalación de operaciones provoca que el resultado de la suma sea inexacto (mezcla de valores viejos y nuevos).

- **Lectura irrepetible (non-repeatable read)**  
  Una transacción lee X dos veces en distintos momentos, y en la segunda lectura obtiene un valor diferente porque otra transacción intermedia actualizó X.

---
Controlar la concurrencia (por ejemplo, mediante bloqueos o protocolos de serialización) evita estos conflictos y garantiza que las transacciones produzcan resultados coherentes y fiables.  

