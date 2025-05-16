CREATE DATABASE TP9;
GO

USE TP9;
GO

CREATE TABLE TipoDeIva (
    IDTipolva INT PRIMARY KEY,
    Descripcion VARCHAR(100),
    LetraImpresoraFiscal VARCHAR(10)
);

CREATE TABLE Empresa (
    idEmpresa INT PRIMARY KEY,
    RazonSocial VARCHAR(100),
    CUIT VARCHAR(20),
    Dominio VARCHAR(100)
);

CREATE TABLE Usuario (
    UserToken INT PRIMARY KEY,
    AyN VARCHAR(100),
    Usuario VARCHAR(50),
    Password VARCHAR(50)
);

CREATE TABLE UsuarioXEmpresa (
    idEmpresa INT,
    UserToken INT,
    PRIMARY KEY (idEmpresa, UserToken),
    FOREIGN KEY (idEmpresa) REFERENCES Empresa(idEmpresa),
    FOREIGN KEY (UserToken) REFERENCES Usuario(UserToken)
);

CREATE TABLE Cliente (
    Token INT PRIMARY KEY,
    Apellido VARCHAR(50),
    Nombre VARCHAR(50),
    Domicilio VARCHAR(100),
    Telefono VARCHAR(20),
    DNI VARCHAR(20),
    CUIT VARCHAR(20),
    IDTipolva INT,
    NombreUsuario VARCHAR(50),
    Password VARCHAR(50),
    FOREIGN KEY (IDTipolva) REFERENCES TipoDeIva(IDTipolva)
);

CREATE TABLE Venta (
    idVenta INT PRIMARY KEY,
    Token INT,
    idEmpresa INT,
    Fecha DATE,
    FOREIGN KEY (Token) REFERENCES Cliente(Token),
    FOREIGN KEY (idEmpresa) REFERENCES Empresa(idEmpresa)
);

CREATE TABLE Seccion (
    idSeccion INT PRIMARY KEY,
    idEmpresa INT,
    NombreSeccion VARCHAR(100),
    FOREIGN KEY (idEmpresa) REFERENCES Empresa(idEmpresa)
);

CREATE TABLE Rubro (
    idRubro INT PRIMARY KEY,
    idSeccion INT,
    NombreRubro VARCHAR(100),
    FOREIGN KEY (idSeccion) REFERENCES Seccion(idSeccion)
);

CREATE TABLE Articulo (
    idArticulo INT PRIMARY KEY,
    idRubro INT,
    Codigo VARCHAR(50),
    Descripcion VARCHAR(100),
    Precio MONEY,
    Stock INT,
    FechaTecnica DATE,
    FOREIGN KEY (idRubro) REFERENCES Rubro(idRubro)
);

CREATE TABLE Imagen (
    idImagen INT PRIMARY KEY,
    idArticulo INT,
    Bin VARBINARY(MAX),
    Descripcion VARCHAR(100),
    FOREIGN KEY (idArticulo) REFERENCES Articulo(idArticulo)
);

CREATE TABLE ItemVenta (
    idVenta INT,
    idArticulo INT,
    Cantidad INT,
    Precio MONEY,
    PRIMARY KEY (idVenta, idArticulo),
    FOREIGN KEY (idVenta) REFERENCES Venta(idVenta),
    FOREIGN KEY (idArticulo) REFERENCES Articulo(idArticulo)
);

-- TipoDeIva
INSERT INTO TipoDeIva VALUES (1, 'Responsable Inscripto', 'A');
INSERT INTO TipoDeIva VALUES (2, 'Monotributista', 'B');

-- Empresa
INSERT INTO Empresa VALUES (101, 'ElectroPlatense S.A.', '30-12345678-9', 'electroplatense.com');
INSERT INTO Empresa VALUES (102, 'Distribuidora Norte SRL', '30-87654321-0', 'nortedistribuciones.com');

-- Usuario
INSERT INTO Usuario VALUES (1, 'Juan Pérez', 'jperez', 'clave123');
INSERT INTO Usuario VALUES (2, 'Laura Gómez', 'lgomez', 'clave456');

-- UsuarioXEmpresa
INSERT INTO UsuarioXEmpresa VALUES (101, 1);
INSERT INTO UsuarioXEmpresa VALUES (102, 2);
INSERT INTO UsuarioXEmpresa VALUES (101, 2);

-- Cliente
INSERT INTO Cliente VALUES (1, 'Martinez', 'Carlos', 'Calle 123', '2211234567', '30111222', '20304567891', 1, 'cmartinez', 'pass1');
INSERT INTO Cliente VALUES (2, 'Gomez', 'Lucia', 'Av. Siempreviva 742', '2219876543', '30222333', NULL, 2, 'lgomez', 'pass2');

-- Venta
INSERT INTO Venta VALUES (1001, 1, 101, '2024-06-10');
INSERT INTO Venta VALUES (1002, 2, 102, '2024-07-01');

-- Seccion
INSERT INTO Seccion VALUES (201, 101, 'Electrodomésticos');
INSERT INTO Seccion VALUES (202, 102, 'Iluminación');

-- Rubro
INSERT INTO Rubro VALUES (301, 201, 'Heladeras');
INSERT INTO Rubro VALUES (302, 202, 'Lámparas LED');

-- Articulo
INSERT INTO Articulo VALUES (401, 301, 'H123', 'Heladera No Frost', 200000, 15, '2024-01-15');
INSERT INTO Articulo VALUES (402, 302, 'L456', 'Lámpara LED 10W', 1500, 100, '2023-12-20');

-- Imagen
INSERT INTO Imagen VALUES (501, 401, 0x, 'Imagen heladera');
INSERT INTO Imagen VALUES (502, 402, 0x, 'Imagen lámpara');

-- ItemVenta
INSERT INTO ItemVenta VALUES (1001, 401, 1, 200000);
INSERT INTO ItemVenta VALUES (1002, 402, 4, 6000);

-- TipoDeIva
INSERT INTO TipoDeIva VALUES (3, 'Consumidor Final', 'C');
INSERT INTO TipoDeIva VALUES (4, 'Exento', 'E');

-- Empresa
INSERT INTO Empresa VALUES (103, 'Mega Iluminación', '30-11223344-5', 'megailu.com');
INSERT INTO Empresa VALUES (104, 'TechHouse', '30-99887766-1', 'techhouse.com.ar');

-- Usuario
INSERT INTO Usuario VALUES (3, 'Roberto Suarez', 'rsuarez', 'clave789');
INSERT INTO Usuario VALUES (4, 'Elena Torres', 'etorres', 'clave000');

-- UsuarioXEmpresa
INSERT INTO UsuarioXEmpresa VALUES (103, 3);
INSERT INTO UsuarioXEmpresa VALUES (104, 4);
INSERT INTO UsuarioXEmpresa VALUES (103, 1);

-- Cliente
INSERT INTO Cliente VALUES (3, 'Perez', 'Ana', 'Calle 456', '2214567890', '30444555', '20311223344', 3, 'aperez', 'claveana');
INSERT INTO Cliente VALUES (4, 'Rodriguez', 'Mario', 'Diagonal 80', '2213332211', '30888777', NULL, 4, 'mrodriguez', 'clavemario');

-- Venta
INSERT INTO Venta VALUES (1003, 3, 103, '2024-08-15');
INSERT INTO Venta VALUES (1004, 4, 104, '2024-05-20');

-- Seccion
INSERT INTO Seccion VALUES (203, 103, 'Exterior');
INSERT INTO Seccion VALUES (204, 104, 'Computación');

-- Rubro
INSERT INTO Rubro VALUES (303, 203, 'Faroles');
INSERT INTO Rubro VALUES (304, 204, 'Notebooks');

-- Articulo
INSERT INTO Articulo VALUES (403, 303, 'F789', 'Farol Solar Exterior', 8000, 50, '2024-04-01');
INSERT INTO Articulo VALUES (404, 304, 'N900', 'Notebook HP 14"', 650000, 10, '2024-03-22');

-- Imagen
INSERT INTO Imagen VALUES (503, 403, 0x, 'Imagen farol');
INSERT INTO Imagen VALUES (504, 404, 0x, 'Imagen notebook');

-- ItemVenta
INSERT INTO ItemVenta VALUES (1003, 403, 2, 16000);
INSERT INTO ItemVenta VALUES (1004, 404, 1, 650000);
