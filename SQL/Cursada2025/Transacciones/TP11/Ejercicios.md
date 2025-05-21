# Ejercicio 1) 
Cree el SP (Stored Procedure), que recibiendo un artículo determinado
y un par de fechas, devuelva la cantidad que se han vendido de dicho
producto en el período conformado por las fechas recibidas.

```sql
CREATE PROCEDURE Ejercicio1
@idArt INT, @Fi DATE, @Ff DATE
AS
BEGIN
  SELECT CantidadVendida = SUM(IV.Cantidad)

  FROM ventas V JOIN ItemVenta IV ON V.idVenta = IV.idVenta
    JOIN Articulo A ON IV.idArticulo = A.idArticulo

  WHERE IV.idArticulo = @id.Art
    AND V.Fcha BETWEEN @Fi AND @Ff

END

EXEC Ejercicio1 9180, '01/01/2020', '01/04/2024'
```

# Ejercicio 2) 
Cree el SP, en la que recibiendo un mes y año, devuelva el listado
clientes que compraron en ese período. En caso de no haber ningún
cliente, que devuelva la leyenda SIN CLIENTES.

```sql
CREATE PROCEDURE Ejercicio2
  @Mes SMALINT, @Year SMALLINT  
AS
BEGIN

  SELECT CASE WHEN ((SELECT COUNT(*)
  FROM Cliente C JOIN Venta V ON C.Token = V.Token
  WHERE MONTH(V.Fecha) = @Mes AND YEAR(V.Fecha) = @Year) >= 1) THEN 
    (SELECT DISTINCT C.RazonSocial
  FROM Cliente C JOIN Venta V ON C.Token = V.Token
  WHERE MONTH(V.Fecha) = @Mes AND YEAR(V.Fecha) = @Year)

  ELSE 'SIN RESULTADOS' END
END

EXEC Ejercicio2 12.2019

```

# Ejercicio 3) 
Crear el SP que devuelva los Clientes que han comprado más de
$500000 en un año que se recibe por parámetro.

```sql
CREATE PROCEDURE Ejercicio3
@ANIO SMALLINT
AS
BEGIN

SELECT C.RazonSocial, TotalComprado = SUM(IV.Cantdad * IV.Precio)
FROM Cliente C INNER JOIN Venta V ON C.Token = V.Token
  JOIN ItemVenta IV On V.idVenta = IV.idVenta
WHERE YEAR(V.FechaVenta) = @ANIO
GROUP BY C.RazonSocial
HAVNG SUM(IV.Cantdad * IV.Precio)>500000

END

EXEC Ejercicio3 2019
```

# Ejercicio 4) 
Se requiere la creación de un SP que reciba una imagen como
parámetro, la inserte a un producto que se recibe como parámetro, y
luego devuelva la cantidad de fotos que tienehttps://classroom.google.com/a/not-turned-in/all registrado el artículo
correspondiente.

```sql
CREATE PROCEDURE Ejercicio4
@IMG IMAGE, @idArt INT, @DESC VARCHAR (30)
AS
BEGIN
IF (@DESC IS NULL OR NOT (LEN(@DESC) >= 0 AND LEN(@DESC) <= 100))
BEGIN PRINT 'NO SE CUMPLE CONDICION DE DESCRIPCION'
ELSE
BEGIN
  INSERT INTO IMAGEN VALUES (@idArt, @IMG, DESC);
  SELECT COUNT(*) FROM IMAGE WHERE #idArt = idArticulo

END
END

EXEC Ejercicio4 'PAPCS', 'HOL', 2019
```
