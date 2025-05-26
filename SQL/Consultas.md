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

# Ejercicio 10 
Devuelva el listado de la cantidad de artículos registrada por cada sección por cada empresa. Ordenar todo 
por orden alfabético. 

# Ejercicio 11 
Resuelva el listado que devuelva cual fue el monto vendido por empresa en el año actual. 

# Ejercicio 12 
Realizar una selección de los productos que se contengan la palabra “unipolar”, junto con sus precios.
