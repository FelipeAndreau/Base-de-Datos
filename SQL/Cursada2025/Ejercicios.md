![image](https://github.com/user-attachments/assets/2b7b7130-80ab-42c5-ad20-336613ef9574)

# Ejercicio 1
Mostrar toda la información de los clientes.

```sql

SELECT * FROM CLIENTE

```

# Ejercicio 2
Listar solamente el “apellido y nombres” (orden descendente) de todos los clientes.

```sql
SELECT Apellido , Nombre FROM CLIENTE ORDER BY Apellido DESC, Nombre DESC
```

# Ejercicio 3
Realizar una selección que le permita mostrar la CANTIDAD total de clientes por tipo de IVA existente.

```sql
SELECT TD.Descripcion AS TipoIVA, COUNT(*) AS CantidadClientes FROM Cliente C
JOIN TipoDeIva TD ON C.IDTipoIva = TD.IDTipoIva
GROUP BY TD.Descripcion

```

# Ejercicio 4
Realizar una selección que le permita listar toda la información pertinente de aquellos clientes que tienen
el apellido Martinez.

```sql
SELECT *
FROM Cliente
WHERE Apellido = 'Martinez'

```
# Ejercicio 5
Muestre un informe que brinde como resultado: la cantidad de clientes que tienen un mismo nombre.
Debe indicar Nombre, Cantidad.

```sql
SELECT Nombre, COUNT(*) AS Cantidad
FROM Cliente
GROUP BY Nombre
ORDER BY Cantidad DESC
```

# Ejercicio 6
Realizar una selección que le permita listar la cantidad de veces que se vendió cada producto en el año
actual. Cantidad de veces, no es cantidad de artículos.

```sql

```
