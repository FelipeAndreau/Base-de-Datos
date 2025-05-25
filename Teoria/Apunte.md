## Base de datos

Colección de datos interrelacionados con un propósito específico vinculado a la resolución de un problema del mundo real.

## DBMS (DataBase Management System)

Colección de programas que permite a los usuarios crear y mantener una base de datos. Facilita:

- **Definición**: especificar tipos, estructuras y restricciones de datos.  
- **Construcción**: almacenar datos en un medio controlado por el DBMS.  
- **Manipulación**:  
  - Consultas para recuperar datos específicos.  
  - Actualizaciones para reflejar cambios del minimundo.  
  - Generación de informes.  
- **Compartición**: acceso simultáneo por múltiples usuarios y aplicaciones (consultas y transacciones).

### Almacenamiento de bases de datos

1. **Primario**  
   - Memoria principal (RAM) y cachés.  
   - CPU puede operar directamente.  

2. **Secundario**  
   - Discos magnéticos (HDD).  
   - Gran capacidad, acceso más lento; requiere copiar a memoria principal.  

3. **Terciario**  
   - Medios extraíbles (CD, cinta).  
   - Muy alta capacidad, acceso aún más lento; también copiado previo a RAM.

## SGBD (Sistema de Gestión de Bases de Datos)

Conjunto de programas necesarios para acceder y administrar la base de datos. Cuenta con:

- **Lenguaje de Definición de Datos (LDD)**  
  Diseña la estructura de la BD: tablas, relaciones, semántica y restricciones de consistencia.

- **Lenguaje de Manipulación de Datos (LMD)**  
  Agregar, recuperar, modificar o borrar datos (p. ej. SQL DML).

### Objetivos del SGBD

- **Controlar la concurrencia**  
  Evitar inconsistencias cuando varios usuarios actualizan datos simultáneamente.

- **Control centralizado**  
  Gestionar datos y programas desde un único punto.

- **Facilitar el acceso**  
  Ofrecer un lenguaje de consulta rápida y uniforme.

- **Seguridad**  
  Restringir accesos no autorizados mediante usuarios y permisos.

- **Integridad de datos**  
  Garantizar que se respeten las reglas definidas (p. ej. sin precios negativos) y soportar restauración tras fallos.

- **Almacenamiento persistente**  
  Mantener datos disponibles incluso ante fallos del sistema (backups y recuperación).

---

# Modelo Entidad‐Relación

## Modelado de datos
Proceso que permite a las organizaciones:
- **Descubrir**, **diseñar**, **visualizar**, **estandarizar** e **implementar** activos de datos de alta calidad  
- Se apoya en una **interfaz gráfica intuitiva**  
- Sirve como **plano visual** para diseñar e implementar bases de datos

## Modelo entidad‐relación
Basado en una percepción del mundo real consistente en:
1. **Conjuntos de entidades**  
2. **Conjuntos de relaciones**  
3. **Atributos**

### Entidad
Objeto del mundo real, distinguible de otros, que posee propiedades:
- **Concreto** (p. ej. `Cliente`)  
- **Abstracto** (p. ej. `Préstamo`)

### Conjunto de entidades
Colección de entidades del mismo tipo que comparten propiedades.  
> Ejemplo: el conjunto de todos los clientes de un banco.

### Relación
Asociación entre diferentes entidades.

### Conjunto de relaciones
Colección de relaciones del mismo tipo.

### Atributos
Describen las propiedades de cada entidad o relación:
- **Simples**: no divisible  
- **Compuestos**: se pueden subdividir (p. ej. `Dirección` → `Calle`, `Número`, `Localidad`)  
- **Monovalorados**: un solo valor por entidad (p. ej. `NúmeroPréstamo`)  
- **Multivalorados**: varios valores por entidad (p. ej. `Teléfono`)  
- **Derivados**: calculados a partir de otros atributos (p. ej. `Edad` ← `FechaNacimiento`)

### Dominio
Conjunto de valores permitidos para cada atributo.

### Clave primaria
Atributo que identifica **únicamente** a cada entidad en un conjunto.

### Entidad débil
Entidad que **no tiene atributos suficientes** para formar una clave primaria.  
- Debe estar asociada a una **entidad identificadora** que aporte la clave.  


---

## Diagrama Entidad-Relación

### Componentes principales
- **Rectángulos** → Entidades  
- **Elipses** → Atributos (el atributo clave se **subraya**)  
- **Rombos** → Relaciones  
- **Líneas** → Unen atributos a entidades y entidades a relaciones  
- **Elipses dobles** → Atributos multivalorados  
- **Elipses discontinuas** → Atributos derivados  
- **Líneas dobles** → Participación total de una entidad en una relación  
- **Rectángulos dobles** → Conjuntos de entidades débiles  

### Cardinalidad
- Un segmento entre una entidad y una relación binaria muestra la **cardinalidad mínima..máxima** (por ejemplo, `1..*` es equivalente a una línea doble).

### Extensiones del modelo ER
- **Especialización**  
- **Generalización**  
- **Herencia de atributos**  
- **Agregación**: Trata una interrelación con sus entidades como una nueva entidad

### Cobertura en especialización/generalización
1. **Total vs. Parcial**  
   - *Total*: cada entidad de nivel superior **debe** pertenecer a alguna subentidad (se dibuja línea doble al triángulo).  
   - *Parcial*: algunas entidades de nivel superior **pueden** no pertenecer a ninguna subentidad.

2. **Exclusiva vs. Superpuesta**  
   - *Exclusiva*: una entidad de nivel superior puede pertenecer **solo a una** subentidad (se indica con un arco).  
   - *Superpuesta*: puede pertenecer a **varias** subentidades.  

![image](https://github.com/user-attachments/assets/a532aee8-3173-40c5-ad1a-25a3e0a0bb03)

---

# Modelo Relacional

El modelo relacional representa una base de datos como una colección de **tablas** (o **relaciones**), cada una formada por:

- **Filas** (tuplas): registros horizontales.  
- **Columnas** (atributos): propiedades de cada registro.

---

## Selección de claves

1. **Entidad con un solo ID** → ese atributo es la **Clave Primaria (CP)**.  
2. **Entidad con varios IDs** → elegir CP según:  
   - Prefiere un identificador **simple** sobre uno compuesto.  
   - Si hay dos simples, escoger el de **menor tamaño físico**.  
3. Los IDs no seleccionados se definen como **Claves Candidatas (CC)**.  
4. Muchos DBMS ofrecen dominio **Autoincremental** para CP, el usuario solo puede **consultar**, no crear, borrar ni modificar.

---

## Conversión de Entidades y Atributos

- **Entidades** → una tabla por cada entidad fuerte o débil.  
- **Atributos multivalorados** → nueva tabla con:  
  - Un atributo para el multivalorado.  
  - La CP de la tabla original como **FK**.  
  - Su CP será la combinación de todos sus atributos.  
- **Atributos compuestos** → se descomponen en atributos simples y el compuesto desaparece.  
- **Atributos derivados** → decisión del diseñador (incluirlo o no) y documentar el criterio.

---

## Conversión de Relaciones

| Cardinalidad                         | Estrategia de Conversión                                                                                                                  |
|--------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------|
| **(0..1 – 1..1)**                    | CP de la entidad **1..1** recibe la CP de la entidad **0..1** como **FK**.                                                               |
| **(1..1 – 1..1)**                    | 1. Incluir CP de la primera en la segunda (como FK).<br>2. O viceversa.<br>3. Incluir ambas CP en una de las tablas (más redundante).    |
| **(0..1 – 0..1)**                    | Crear **nueva tabla** con las dos CP como FKs; la CP de la nueva tabla será una de ellas.                                                 |
| **(1..1 – 0..*/1..*)**               | CP de la entidad **0..*** se agrega como FK en la tabla **1..1**.                                                                         |
| **(0..* – 0..*/1..*)**               | Crear **nueva tabla** con las CP de ambas entidades como CP compuesta; si la relación tiene atributos, también se añaden aquí.            |
| **Relación con histórico (atributos)** | Incluir fechas u otros atributos en la nueva tabla, formando parte de su CP. Optionally, usar un ID autoincremental en lugar de compuesta. |
| **Relación de grado 3**              | Crear **nueva tabla**; su CP será la combinación de las tres CP de las entidades.                                                        |

> _Nota_: Si la relación incluye atributos (fechas, históricos), estos se añaden a la tabla intermedia y pueden formar parte de la CP. Para simplificar, a veces es preferible usar un ID autoincremental.

---

## Generalizaciones / Especializaciones

La estrategia depende de la **cobertura** (parcial/total) y la **discriminación** (exclusiva/superpuesta):

1. **Estrategia única (toda jerarquía en padre)**  
   - Eliminar subentidades.  
   - Atributos de hijos pasan al padre como **opcionales**.  
   - **Una sola tabla**.

2. **Tablas solo de subtipos**  
   - Eliminar la entidad padre.  
   - Atributos del padre incluidos en **cada** subtipo.  
   - **Una tabla por subtipo**.  
   - Ideal si la cobertura es **exclusiva**.

3. **Jerarquía completa**  
   - Dejar padre y subentidades.  
   - Relaciones uno a uno (PK–FK) entre padre y cada hijo.  
   - **Una tabla para el supertipo** y **una por subtipo**.

---

## Integridad Referencial (IR)

Garantiza coherencia entre tablas mediante **Claves Foráneas (CF)**:

- Una CF en una tabla referencia la CP de otra.  
- El SGBD impone restricciones para evitar referencias “huérfanas” y mantener la consistencia de la base de datos.

![image](https://github.com/user-attachments/assets/1e1fd7bc-b4e0-4a3c-b20d-f72009a77adb)

----

# Normalización

## Dependencias Funcionales

| Tipo                             | Definición                                                                                                   |
|----------------------------------|---------------------------------------------------------------------------------------------------------------|
| **Dependencia Funcional (DF)**       | Restricción semántica entre dos conjuntos de atributos de una tabla.                                         |
| **Dependencia Funcional Completa**   | Si A → B, pero B **no** depende de ningún subconjunto de A.                                                 |
| **Dependencia Funcional Parcial**    | A → B, y existe un atributo que puede eliminarse de A sin romper la dependencia.                             |
| **Dependencia Funcional Transitiva** | A → B y B → C ⇒ C depende **transitivamente** de A a través de B.                                            |

---

## Redundancia y Anomalías de Actualización

El objetivo de la normalización es **minimizar la redundancia** y evitar las siguientes anomalías:

| Anomalía       | Descripción                                                                                                  |
|----------------|--------------------------------------------------------------------------------------------------------------|
| **Inserción**  | Al agregar una tupla, hay que indicar **toda** la información; riesgo de inconsistencia si falta algo.     |
| **Borrado**    | Al eliminar una tupla, se puede **perder** información relacionada.                                          |
| **Modificación**| Al cambiar un valor (p. ej. un nombre), debe actualizarse en **todas** las tuplas que lo contienen.         |

---

## Formas Normales

Cada forma normal aplica sobre la anterior y reduce vulnerabilidad a anomalías:

| Forma Normal | Requisito                                                                                                                      |
|--------------|--------------------------------------------------------------------------------------------------------------------------------|
| **1FN**      | Todos los atributos son **atómicos** (no multivaluados).                                                                       |
| **2FN**      | Está en 1FN **y** no existen dependencias funcionales **parciales**: todo atributo no clave depende de **toda** la clave.    |
| **3FN**      | Está en 2FN **y** no existen dependencias funcionales **transitivas**: un atributo no clave no depende de otro atributo no clave. |

> **Nota:**  
> - La 1FN se aplica siempre.  
> - La 2FN y 3FN suelen aplicarse, pero pueden dejarse de lado por motivos de rendimiento.  

---

# Álgebra Relacional

Conjunto de operaciones básicas del modelo relacional que permiten especificar las peticiones de recuperación de datos. Proporciona un fundamento formal para la implementación y optimización de consultas en los RDBMS y sirve de base para SQL.

---

## 1. Secuencia de operaciones  
Una **expresión de álgebra relacional** es una secuencia de operaciones aplicada a una o más relaciones, cuyo resultado es siempre una nueva relación.

---

## 2. Operaciones según su origen

| Grupo                          | Operaciones                                                                    |
|--------------------------------|---------------------------------------------------------------------------------|
| **Teoría de conjuntos**        | UNIÓN (∪), INTERSECCIÓN (∩), DIFERENCIA (–), PRODUCTO CARTESIANO (×)             |
| **Relacional específicas**     | SELECCIÓN (σ), PROYECCIÓN (π), RENOMBRE (ρ), NATURAL (⋈), DIVISIÓN (÷), ASIGNACIÓN (🡨) |

---

## 3. Operadores básicos

### 3.1 Unarios (sobre una sola relación)

| Operación                     | Símbolo | Descripción                                                                                     |
|-------------------------------|---------|-------------------------------------------------------------------------------------------------|
| **Selección**                 | σ       | Filtra las tuplas que cumplen un predicado (p. ej. σ edad > 30).                                 |
| **Proyección**                | π       | Extrae columnas: π (nom, edad)(R); elimina duplicados automáticamente.                          |
| **Renombre**                  | ρ       | Alias para una relación: ρ (NuevaR)(R); evita ambigüedades en autouniones o self-joins.         |

### 3.2 Binarios (entre dos relaciones)

| Operación                     | Símbolo | Descripción                                                                                                 |
|-------------------------------|---------|-------------------------------------------------------------------------------------------------------------|
| **Producto cartesiano**       | × (o χ) | Combina cada tupla de R con cada tupla de S. Útil seguido de σ para correlacionar atributos.                |
| **Unión**                     | ∪       | R ∪ S: todas las tuplas en R o en S (elimina duplicados).                                                    |
| **Diferencia**                | –       | R – S: tuplas que están en R pero no en S.                                                                   |

![image](https://github.com/user-attachments/assets/87d261af-6a2e-4275-aeec-b8c559d27b40)
![image](https://github.com/user-attachments/assets/719bc946-4c68-401c-b778-dbf6fc2adb8f)
![image](https://github.com/user-attachments/assets/6dda4ca1-ef62-4038-9025-15e35d429d73)
![image](https://github.com/user-attachments/assets/34c23bb7-6a23-4d25-a504-722a2ffc4b05)


---

## 4. Operaciones adicionales

| Operación                     | Símbolo | Descripción                                                                                             |
|-------------------------------|---------|---------------------------------------------------------------------------------------------------------|
| **Intersección**              | ∩       | Tuplas comunes a R y S. Equivale a R ∩ S.                                                              |
| **Producto natural**          | ⋈       | Equivale a σ (R × S) con igualdad de atributos comunes; une y descarta duplicados de columnas idénticas. |
| **División**                  | ÷       | A ÷ B: tuplas de A que se relacionan con **todas** las tuplas de B (columnas de B ⊆ columnas de A).     |
| **Asignación**                | 🡨       | Crea o actualiza una relación: X ← resultado_de_operación.                                               |


![image](https://github.com/user-attachments/assets/06805df9-581b-4231-84ac-a43cc3d9c503)
![image](https://github.com/user-attachments/assets/56d93db6-77da-42be-86dc-98ef8b6ba995)
![image](https://github.com/user-attachments/assets/4cc0a941-ca7e-4de0-b998-6d2261e3a0e7)
![image](https://github.com/user-attachments/assets/0fe85969-c5d9-4739-98fb-9a21cb0c1873)


---

## 5. Operaciones de actualización

| Tipo       | Ejemplo                                                 | Descripción                                                                                 |
|------------|---------------------------------------------------------|---------------------------------------------------------------------------------------------|
| **Alta**   | X ← X ∪ {('pollera','amarilla')}                       | Inserta tuplas nuevas usando ∪ y 🡨.                                                         |
| **Baja**   |  
