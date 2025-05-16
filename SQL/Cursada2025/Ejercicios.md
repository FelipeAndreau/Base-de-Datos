![image](https://github.com/user-attachments/assets/2b7b7130-80ab-42c5-ad20-336613ef9574)

# Ejercicio 1
Mostrar toda la información de los clientes.

# Resolucion
```sql

SELECT * FROM CLIENTE

```

# Ejercicio 2
Listar solamente el “apellido y nombres” (orden descendente) de todos los clientes.

# Resolucion
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
