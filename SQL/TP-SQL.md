## Ejercicio 2

Sobre la nueva base de datos creada en el Ejercicio Nro. 1, genere:

### a) Una tabla `Usuario` con los siguientes campos:

| Campo    | Tipo             |
| -------- | ---------------- |
| `Token`    | `uniqueidentifier` |
| `AyN`      | `varchar(100)`     |
| `Usuario`  | `varchar(50)`      |
| `Password` | `varchar(25)`      |


```sql
CREATE TABLE Usuario {
Token UNIQUEIDENTIFIER PRIMARY KEY,
AyN VARCHAR(100),
Usuario VARCHAR(50),
Password VARCHAR(25),
};
```

### b) Otra tabla para registrar una **Empresa** con los siguientes campos:

| Campo         | Tipo           |
| ------------- | -------------- |
| `idEmpresa`   | `int`          |
| `RazonSocial` | `varchar(100)` |
| `CUIT`        | `varchar(13)`  |
| `Dominio`     | `varchar(50)`  |


```sql
CREATE TABLE Empresa {
idEmpresa INT UNIQUEIDENTIFIER PRIMARY KEY IDENTITY,
RazonSocial VARCHAR(100),
CUIT VARCHAR(13),
Dominio VARCHAR(50),
};
```

## c) Ahora, se requiere que se cree una tabla relacional entre ambas tablas, que determine la relación de cada Usuario con cada Empresa. Como nombre de la tabla se propone: UsuarioXEmpresa.  


```sql
CREATE TABLE UsuarioXEmpresa {
idEmpresa INT, 
Token UNIQUEIDENTIFIER, 
PRIMARY KEY (Token , Empresa),
FOREIGN KEY (Token) REFERENCES Usuario(Token),
FOREIGN KEY (idEmpresa) REFERENCES Empresa(idEmpresa),
};
```

## d) Establezca las relaciones entre cada tabla. ¿Qué tipo de restricciones cree que deben tener para el borrado y modificación? Justifique, y aplique dichas relaciones a las tablas que ha creado.  

```sql 
CREATE TABLE UsuarioXEmpresa {
idEmpresa INT, 
Token UNIQUEIDENTIFIER, 
PRIMARY KEY (Token , Empresa),
FOREIGN KEY (Token) REFERENCES Usuario(Token),
    ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (idEmpresa) REFERENCES Empresa(idEmpresa),
    ON DELETE CASCADE ON UPDATE CASCADE,
};
```

## e) Si este modelo creado fuese a ser utilizado para un sistema que correrá en la nube, y que podrá tener relaciones con otros sistemas de terceros y crecer de manera abierta:

1. ¿Cree usted que la especificación de las claves en cada tabla es la correcta?
2. ¿Qué corrección aplicaría?
3. Realice los cambios necesarios para dejar el modelo de manera correcta según su percepción.

```sql
CREATE TABLE Usuario (
    Token UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    AyN VARCHAR(100),
    Usuario VARCHAR(50),
    Password VARCHAR(25)
);

CREATE TABLE Empresa (
    IdEmpresa UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    RazonSocial VARCHAR(100),
    CUIT VARCHAR(13)
);

CREATE TABLE UsuarioXEmpresa (
    Token UNIQUEIDENTIFIER,
    IdEmpresa UNIQUEIDENTIFIER,
    PRIMARY KEY (Token, IdEmpresa),
    FOREIGN KEY (Token) REFERENCES Usuario(Token)
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
    FOREIGN KEY (IdEmpresa) REFERENCES Empresa(IdEmpresa)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

```

# Ejercicio 3

Respecto de la estructura creada en el Ejercicio anterior, se requiere que se realicen los siguientes cambios:

a) Eliminar de la tabla `Usuario` el campo `Usuario`.  
b) Agregar un nuevo campo que sea `email` (`VARCHAR(70)`).  
c) Agregar los campos `Domicilio` (`VARCHAR(150)`) y `Telefono` (`VARCHAR(30)`) en la tabla `Usuario`.  
   Luego, agregar los mismos campos a la tabla `Empresa`.  

```sql
USE ventas_e;

-- Eliminar la columna 'Usuario' de la tabla
ALTER TABLE Usuario
DROP COLUMN Usuario;

-- Agregar un nuevo campo que sea email (varchar(70))
ALTER TABLE Usuario
ADD Email VARCHAR(70);

/* Agregar los campos Domicilio (varchar(150)) y Telefono (varcvhar(30)) en la tabla Usuario.
Luego, agregar los mismos campos a la tabla Empresa. */

ALTER TABLE Usuario
ADD Domicilio VARCHAR(150);
ALTER TABLE Usuario
ADD Telefono VARCHAR(30);

ALTER TABLE Empresa
ADD Domicilio VARCHAR(150);
ALTER TABLE Empresa
ADD Telefono VARCHAR(30);
```
