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

# Ejercicio 4

![image](https://github.com/user-attachments/assets/6e51993a-095f-43e9-91a3-60fc4fb9bdae)
![image](https://github.com/user-attachments/assets/c9cae7a6-032e-4a04-812d-2bcb9de62c46)
```sql
USE ventas_e;

-- Agrego la columna Dominio a la tabla 'Empresa'
ALTER TABLE Empresa
ADD Dominio VARCHAR(50);

-- Inserto datos a Empresa
INSERT INTO Empresa (RazonSocial, CUIT, Domicilio, Telefono, Dominio) 
VALUES ('ALBOCAR', '20-24563524-1', '536 nro. 67', '0221 455-8523', 'Albocar');
INSERT INTO Empresa (RazonSocial, CUIT, Domicilio, Telefono, Dominio) 
VALUES ('AUTOCLIPS VAER SA', '30-56225853-4', 'Ate. Brown 876', '011 4457-7778', 'Vaersa');
INSERT INTO Empresa (RazonSocial, CUIT, Domicilio, Telefono, Dominio) 
VALUES ('GOICOECHEA', '30-57788523-5', 'Pte. Perón 4521', '0224 4522-3652', 'Goicoechea');
INSERT INTO Empresa (RazonSocial, CUIT, Domicilio, Telefono, Dominio) 
VALUES ('CGO', '27-24246552-2', '46 Nro. 1587', '0221 412-5623', 'Districgo');
INSERT INTO Empresa (RazonSocial, CUIT, Domicilio, Telefono, Dominio) 
VALUES ('BELPE', '30-45235689-7', '122 Nro. 4201', '0221 423-2323', 'Belpe');
INSERT INTO Empresa (RazonSocial, CUIT, Domicilio, Telefono, Dominio) 
VALUES ('DISTRIFERR', '20-58545565-1', 'Moreau Nro. 524', '0229 45-5623', 'Distriferr');
INSERT INTO Empresa (RazonSocial, CUIT, Domicilio, Telefono, Dominio) 
VALUES ('AZ MOTOR', '30-44215532-5', '44 Esq. 200 Nro. 4522', '0221 452-5262', 'Azmotor');
```

# Ejercicio 5
![image](https://github.com/user-attachments/assets/df79a6ea-11df-4b88-96fc-c7b39cbe714b)
```sql
USE ventas_e;

Select * from usuario

-- INSERTAR USUARIOS
INSERT INTO Usuario (Token, AyN, Usuario, Password)
VALUES
(NEWID(), 'Lionel Galo', 'lgalo', 'pass123'),
(NEWID(), 'Maximiliano Gonzalez', 'mgonzalez', 'maxi123'),
(NEWID(), 'Carlos Gómez', 'cgomez', 'gomez321'),
(NEWID(), 'Ana Torres', 'atorres', 'ana456'),
(NEWID(), 'Luis Goicoechea', 'lgoico', 'goico789');

-- RELACIONES INICIALES (UsuarioXEmpresa)
INSERT INTO UsuarioXEmpresa (Token, IdEmpresa)
VALUES
-- Lionel Galo → ALBOCAR (Id 2)
((SELECT Token FROM Usuario WHERE AyN = 'Lionel Galo'), 2),

-- Maximiliano Gonzalez → ALBOCAR (Id 2)
((SELECT Token FROM Usuario WHERE AyN = 'Maximiliano Gonzalez'), 2),

-- Carlos Gómez → AZ MOTOR (Id 7)
((SELECT Token FROM Usuario WHERE AyN = 'Carlos Gómez'), 7),

-- Ana Torres → GOICOECHEA (Id 4)
((SELECT Token FROM Usuario WHERE AyN = 'Ana Torres'), 4),

-- Luis Goicoechea → GOICOECHEA (Id 4)
((SELECT Token FROM Usuario WHERE AyN = 'Luis Goicoechea'), 4);

```

# Ejercicio 6 
![image](https://github.com/user-attachments/assets/77ec4c00-4459-4d13-be1a-94eb8672e81c)
```sql
USE ventas_e;

SELECT * from Usuario
SELECT * from Empresa
SELECT * from UsuarioXEmpresa

-- Lionel Galo abandonó la Empresa en la que trabajaba, y fue contratado por CGO
DELETE FROM UsuarioXEmpresa
WHERE Token = (SELECT Token FROM Usuario WHERE AyN = 'Lionel Galo');

INSERT INTO UsuarioXEmpresa (Token, IdEmpresa)
VALUES ((SELECT Token FROM Usuario WHERE AyN = 'Lionel Galo'), 5);

/* Maximiliano Gonzalez, fue enrolado en el ejército por lo que pidió la baja de la Empresa
Albocar en la que trabajaba hasta su regreso. */DELETE FROM UsuarioXEmpresaWHERE Token = (SELECT Token FROM Usuario WHERE AyN = 'Maximiliano Gonzalez')-- Entonces luego, la empresa Albocar, adquirió la empresa Az Motor, y todos sus empleados.INSERT INTO UsuarioXEmpresa (Token, IdEmpresa)
SELECT Token, 
       (SELECT IdEmpresa FROM Empresa WHERE RazonSocial = 'ALBOCAR')
FROM UsuarioXEmpresa
WHERE IdEmpresa = (SELECT IdEmpresa FROM Empresa WHERE RazonSocial = 'AZ MOTOR');

DELETE FROM UsuarioXEmpresa
WHERE IdEmpresa = (SELECT IdEmpresa FROM Empresa WHERE RazonSocial = 'AZ MOTOR');
```




