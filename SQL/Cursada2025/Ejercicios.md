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
SELECT Ti.Descripcion, CantidadClientes = COUNT(C.IdCliente)
FROM TipoDeIva TI LEFT JOIN Cliente C ON TI.IDTipoIva = C.IDTipoIVA
GROUP BY TI.Descripcion

```

# Ejercicio 4
Realizar una selección que le permita listar toda la información pertinente de aquellos clientes que tienen
el apellido Martinez.

```sql
SELECT *
FROM Cliente C
WHERE C.RazonSolcial like '%Martinez%'

```
# Ejercicio 5
Muestre un informe que brinde como resultado: la cantidad de clientes que tienen un mismo nombre.
Debe indicar Nombre, Cantidad.

```sql
SELECT RazonSocial, COUNT(*) AS Cantidad
FROM Cliente
GROUP BY Nombre

```

# Ejercicio 6
Realizar una selección que le permita listar la cantidad de veces que se vendió cada producto en el año
actual. Cantidad de veces, no es cantidad de artículos.

```sql
SELECT A.Descripcion, Cantidad = COUNT(*)
FROM Venta V JOIN ItemVenta IV ON V.idVenta = IV.idVenta
RIGHT JOIN Articulo A ON IV.idArticulo = A.idArticulo
WHERE YEAR(V.Fecha) = 2025
group by A.Descipcion 
```

# Ejercicio 7
Realizar una selección que le permita listar solamente el “apellido y nombre” y DNI de todos los clientes
ordenados por DNI (ascendente), que no tengan un CUIT registrado.

```sql
SELECT Apellido , Nombre
FROM CLIENTE
WHERE CUIT NOT NULL
ORDER BY DNI ASC
```

# Ejercicio 11
Resuelva el listado que devuelva cual fue el monto vendido por empresa en el año actual.

```sql
SELECT E.RazonSocial , MontonVenta = SUM(IV.Cantidad * IV.Precio)
FROM Empresa E JOIN Venta V ON E.idEmpresa = V.idEmpresa
JOIN ItemVenta IV ON V.idVenta = IV.idVenta
WHERE YEAR(V.Fecha) = YEAR(GETDATE())
GROUP BY E.RazonSocial
```
