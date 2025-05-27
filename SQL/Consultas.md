![image](https://github.com/user-attachments/assets/c7c1c257-0772-4ca9-855d-c566f026a501)
> El esquema representa, un sistema básico de registro de ventas.  
Dicho sistema podrá ser utilizado por diferentes empresas, las cuales tendrán uno o más usuarios. Se 
contempla la posibilidad de que un usuario, pueda pertenecer a más de una empresa. Los usuarios, tendrán 
diferentes funciones, las que se determinarán a medida que el sistema comience a funcionar. 
Cada empresa, podrá tener una cantidad indeterminada de productos que comercializa.  
Una de las características de este sistema, será que cada empresa deberá registrar y publicar, los 
artículos determinados en grupos, que se llaman sección y rubro. Sección, determinará el tipo de 
productos que vende la empresa. Y dentro de cada uno de los rubros que la empresa comercializa, los 
productos de cada empresa, deberán estar rubricados para facilitar la búsqueda y agrupamiento de la 
información. 
Una venta realizada por una empresa, quedará identificada por la empresa y el cliente que la realiza. 
Estas, combinadas con un idVenta, lo que hará que cada venta quede registrada a una empresa. A su vez, 
un cliente podrá comprarle a cualquier empresa, pero siempre deberá hacerlo de a una empresa a la vez. 

# Ejercicio 1  
Mostrar toda la información de los clientes. 

```sql
SELECT * FROM Cliente;
```

# Ejercicio 2 
Listar solamente el “apellido y nombres” (orden descendente) de todos los clientes. 

```sql
SELECT Apellido, Nombre
FROM Cliente
ORDER BY Apellido DESC;
```

# Ejercicio 3 
Realizar una selección que le permita mostrar la CANTIDAD total de clientes por tipo de IVA existente. 

```sql
SELECT IDTipoIva, COUNT(*) AS CantidadCliente
FROM Cliente
GROUP BY IDTipoIVA;
```

# Ejercicio 4 
Realizar una selección que le permita listar toda la información pertinente de aquellos clientes que tienen 
el apellido Martinez. 

```sql
SELECT * FROM Cliente WHERE Apellido = 'Martinez'
```

# Ejercicio 5 
Muestre un informe que brinde como resultado: la cantidad de clientes que tienen un mismo nombre. 
Debe indicar Nombre, Cantidad. 

```sql
SELECT C.RazonSocial, COUNT(C.Token) AS Cantidad
FROM Cliente C
GROUP BY C.RazonSocial
HAVING COUNT(C.Token) > 1;
```

# Ejercicio 6 
Realizar una selección que le permita listar la cantidad de veces que se vendió cada producto en el año 
actual. Cantidad de veces, no es cantidad de artículos. 

```sql
SELECT A.Descripcion, COUNT(IV.idVenta) AS CantVecesVendida
FROM Venta V
JOIN ItemVenta IV ON V.idVenta = IV.idVenta
JOIN Articulo A ON IV.idArticulo = A.idArticulo
WHERE YEAR(V.Fecha) = 2018
GROUP BY A.Descripcion;
```

# Ejercicio 7 
Realizar una selección que le permita listar solamente el “apellido y nombre”  y DNI de todos los  clientes 
ordenados por DNI (ascendente), que no tengan un CUIT registrado. 

```sql
SELECT RazonSocial, DNI 
FROM Cliente
WHERE CUIT IS NULL
ORDER BY DNI ASC;
```

# Ejercicio 8 
Listar los clientes que están registrados como Responsables Inscriptos, pero no tienen registrado su 
CUIT como es debido. 

```sql
SELECT * FROM Cliente
WHERE IDTipoIva = (SELECT IDTipoIva FROM TipoDeIva WHERE Descripcion = 'Resp. Inscripto')
AND (CUIT IS NULL OR CUIT = '');
```


# Ejercicio 9 
Realizar una selección que le permita listar el promedio de veces que ha sido vendido cada artículo en el 
historial, y ordenar de manera descendente de mayor a menor. De cada artículo incluir el dato de código y 
descripción. 

```sql
SELECT 
    A.codigo,
    A.Descripcion, 
    AVG(IV.cantidad) AS promedio
FROM Venta V 
JOIN ItemVenta IV ON V.idVenta = IV.idVenta 
JOIN Articulo A ON IV.idArticulo = A.idArticulo
GROUP BY A.codigo, A.Descripcion
ORDER BY promedio DESC;
```

# Ejercicio 10 
Devuelva el listado de la cantidad de artículos registrada por cada sección por cada empresa. Ordenar todo 
por orden alfabético. 

```sql
SELECT 
    E.RazonSocial,
    S.NombreSeccion,
    COUNT(A.idArticulo) AS CantidadArticulos
FROM Seccion S
JOIN Empresa E ON S.idEmpresa = E.idEmpresa
JOIN Rubro R ON R.idSeccion = S.idSeccion
JOIN Articulo A ON A.idRubro = R.idRubro
GROUP BY E.RazonSocial, S.NombreSeccion
ORDER BY E.RazonSocial, S.NombreSeccion;
```

# Ejercicio 11 
Resuelva el listado que devuelva cual fue el monto vendido por empresa en el año actual. 

```sql
SELECT 
    E.RazonSocial, 
    SUM(IV.Cantidad * IV.Precio) AS MontoVendido
FROM Empresa E
JOIN Seccion S ON E.idEmpresa = S.idEmpresa
JOIN Rubro R ON S.idSeccion = R.idSeccion
JOIN Articulo A ON R.idRubro = A.idRubro
JOIN ItemVenta IV ON A.idArticulo = IV.idArticulo
JOIN Venta V ON V.idVenta = IV.idVenta
WHERE YEAR(V.Fecha) = YEAR(GETDATE())
GROUP BY E.RazonSocial
ORDER BY E.RazonSocial;
```

# Ejercicio 12 
Realizar una selección de los productos que se contengan la palabra “unipolar”, junto con sus precios.

```sql
SELECT Descripcion, Precio FROM Articulo WHERE Descripcion LIKE '%unipolar%';
```

# Ejercicio 13 
Generar la consulta que emita la lista de precios más completa de cada empresa. 

```sql
SELECT 
    E.RazonSocial AS Empresa,
    A.Descripcion AS Articulo,
    A.Precio
FROM Empresa E
JOIN Seccion S ON E.idEmpresa = S.idEmpresa
JOIN Rubro R ON S.idSeccion = R.idSeccion
JOIN Articulo A ON R.idRubro = A.idRubro
ORDER BY E.RazonSocial, A.Descripcion;
```

# Ejercicio 14 
Devolver el listado de los Usuarios que estén registrados en más de una empresa. Devolver, Apellido y 
Nombre, y la cantidad de empresas en las que se encuentra registrado. 

```sql
SELECT U.AyN, COUNT(*) AS UsuariosRegistrados
FROM Usuario U
JOIN UsuarioXEmpresa UXE ON U.UserToken = UXE.UserToken
JOIN Empresa E ON UXE.idEmpresa = E.idEmpresa

GROUP BY U.AyN
HAVING COUNT(DISTINCT UXE.idEmpresa) > 1
```

# Ejercicio 15 
Listar los artículos que nunca han sido vendidos. Luego listar la cantidad de artículos que jamás 
fueron vendidos. 

```sql
SELECT A.idArticulo, A.Descripcion
INTO ArticulosNoVendidos
FROM Articulo A
WHERE A.idArticulo NOT IN (
    SELECT IV.idArticulo FROM ItemVenta IV
);

SELECT COUNT(*) AS CantidadArticulosNoVendidos
FROM ArticulosNoVendidos;
```

# Ejercicio 16 
Listar el monto total vendido por mes en el año 2019 por cada una de las empresas. 

```sql
SELECT 
    E.RazonSocial, 
    MONTH(V.Fecha) AS Mes,
    SUM(IV.Cantidad * IV.Precio) AS MontoPorMes
FROM Empresa E
JOIN Seccion S ON E.idEmpresa = S.idEmpresa
JOIN Rubro R ON S.idSeccion = R.idSeccion
JOIN Articulo A ON R.idRubro = A.idRubro
JOIN ItemVenta IV ON A.idArticulo = IV.idArticulo
JOIN Venta V ON V.idVenta = IV.idVenta
WHERE YEAR(V.Fecha) = 2019
GROUP BY E.RazonSocial, MONTH(V.Fecha)
ORDER BY E.RazonSocial, Mes;
```

# Ejercicio 17 
Listar las ventas realizadas por día de la semana en todo el historial de la base de datos, pero, 
ordenada por número de día.

```sql
SELECT 
    DATEPART(WEEKDAY, Fecha) AS NumeroDiaSemana,
    DATENAME(WEEKDAY, Fecha) AS NombreDiaSemana,
    COUNT(*) AS VentasRealizadasPorDia
FROM Venta
GROUP BY DATEPART(WEEKDAY, Fecha), DATENAME(WEEKDAY, Fecha)
ORDER BY NumeroDiaSemana;

-- FULL GEPETO ESTE
```
