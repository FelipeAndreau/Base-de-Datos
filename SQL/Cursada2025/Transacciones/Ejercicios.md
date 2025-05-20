```sql
BEGIN TRAN

INSERT INTO cliente  VALUES('PRUEBA' , '44', '0000', '111',NULL, 1, 'PRUEBA', 'oo@er')

ROLLBACK TRAN
SELECT * FROM cliente
```

```sql
CREATE PROCEDURE [Nombre]
@PATRON VARCHAR (30)
AS
BEGIN
  DECLARE @@INTERO INT;
  SET @@INTERO = O;
  IF (@VALOR > 2)

  SELECT * FROM cliente WHERE RazonSocial LIKE '%' + @PATRON = '%' -- 1 O MUCHOS CARACTERES CON QUE EMPIECE O TERMINE CON CUALQUEIR COSA

END
ELSE
BEGIN
  PRINT 'EL VALOR NO CUMPLE'
END

END
EXEC NOMBRE 'MAXI',
```

Devuelva de la tabla cleinte toda la lsita de cleitnes, en cada caso, siel cliente tiene CUIT devolver el CUIT si no, la leyenda 'CONS' 'FINA;'

```sql
SELECT
RazonSocial, CASE WHEN (CUIT IS NOT NULL) THEN CUIT ELSE 'CONS . FINAL' END
FROM cliente
WHERE CUIT IS NOT NULL
```
