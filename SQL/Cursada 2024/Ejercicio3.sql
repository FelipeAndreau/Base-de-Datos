-- A. Eliminar de la tabla usuario el campo Usuario.

ALTER TABLE Usuario DROP COLUMN Usuario

-- B. Agregar un nuevo campo que sea email (varchar(70))

ALTER TABLE Usuario ADD Email VARCHAR(70)
  
-- C. Agregar los campos Domicilio (varchar(150)) y Telefono (varcvhar(30)) en la tabla Usuario.

  ALTER TABLE Usuario ADD Domicilio varchar(150)
  ALTER TABLE Usuario ADD Telefono varchar(30)

-- D. Luego, agregar los mismos campos a la tabla Empresa.

ALTER TABLE Empresa ADD Domicilio varchar(150)
ALTER TABLE Empresa ADD Telefono varchar(30)

