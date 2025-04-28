CREATE DATABASE venta_e;
GO
USE venta_e
GO
  
--Inciso A
  
CREATE TABLE Usuario(
(Token uniqueidentifier primary key default Newid(),
AyN VARCHAR(100),
Usuario VARCHAR(50),
Contrasena VARCHAR(25)
)
GO

--Inciso B

CREATE TABLE Empresa(
IdEmpresa INT PRIMARY KEY IDENTITY,
Razonocial VARCHAR(100),
CUIT VARCHAR(13),
Dominio VARCHAR(50)
)
GO

--Inciso C

CREATE TABLE UsuarioxEmpresa(
ID int NOT NULL IDENTITY,
IdUsuario UNIQUEIDENTIFIER,
idEmpresa INT,
PRIMARY KEY (ID),
FOREIGN KEY (IdUsuario) REFERENCES Usuario(Token),
FOREIGN KEY (IdEmpresa) REFERENCES Empresa(IdEmpresa)
)
GO

--Inciso D
Existen tres tipos básicos de relaciones entre tablas:
1 a ∞ o Uno a muchos. Este tipo se da cuando una fila de la primera tabla puede estar relacionada con muchas filas de la
segunda tabla, pero una fila de la segunda sólo está relacionada con una de la primera.
Un ejemplo es si consideramos que una película sólo puede tener un único género, éste sería el tipo de relación que existe
entre la tabla Género y la tabla Peliculas, ya que, por ejemplo, el género Drama tiene varias películas relacionadas que son de
dicho género pero dada una película sólo está relacionada con un género.
∞ a ∞ o Muchos a muchos. Esta clase de relación ocurre cuando una fila de la primera tabla puede estar relacionada con
muchas filas de la segunda tabla y una fila de la segunda tabla puede estar relacionada con muchas filas de la primera.
Un ejemplo de este tipo lo tenemos en la relación entre la tabla Peliculas y la tabla Interpretes porque, dada una película en
particular, puede tener muchos intérpretes, y, viceversa, dado un intérprete, este puede haber intervenido en muchas películas.
1 a 1 o Uno a uno. Este tipo de relación aparece con menos frecuencia y
sucede cuando una fila de la primera tabla sólo puede estar relacionada con
una fila de la segunda y una fila de la segunda tabla sólo puede estar
relacionada con una de la primera.
Un ejemplo de este tipo de relaciones podría ser entre una tabla con países y
otra con jefes de gobierno, dado que, normalmente, un país sólo tiene un jefe
de gobierno y un jefe de gobierno lo es sólo de un país.

--Inciso E

  E. Si este modelo creado, fuera a ser utilizado para un sistema que correrá en
la nube, y que podrá tener relaciones con otros sistemas de terceros, y crecer
de manera abierta. ¿Cree Usted que la especificación de las claves en cada
tabla es la correcta? ¿Qué corrección aplicaría? Realice los cambios necesarios para dejar el modelo de manera correcta
según su percepción.
Esta herramienta denominada GUID es un tipo de datos binario de SQL Server de 16 bytes que es globalmente único en
tablas, bases de datos y servidores. El término GUID significa Globally Unique Identifier y se usa indistintamente con
UNIQUEIDENTIFIER.
Para poder crear un GUID en SQL Server, la función NEWID () se utiliza como se muestra a continuación:
SELECT NEWID()
Se debe ejecutar la línea anterior de SQL varias veces y podrá ver un valor diferente cada vez. Esto se debe a que la función
NEWID() genera un valor único cada vez que se ejecuta.
Para declarar a una variable del tipo GUID, la palabra clave utilizada es UNIQUEIDENTIFIER como se menciona en el script a
continuación:
DECLARE @UNI UNIQUUEIDENTIFIER
SET @UNI = NEWID()
SELECT @UNI


