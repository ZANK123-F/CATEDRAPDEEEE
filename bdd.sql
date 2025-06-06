
CREATE DATABASE CATEDRA;
GO


USE CATEDRA;
GO


CREATE TABLE Roles (
    idRol INT PRIMARY KEY,
    nombreRol VARCHAR(50)
);


CREATE TABLE Usuarios (
    idUsuario INT PRIMARY KEY,
    nombreUsuario VARCHAR(100),
    clave VARCHAR(255),
    idRol INT,
    FOREIGN KEY (idRol) REFERENCES Roles(idRol)
);


CREATE TABLE Equipos (
    idEquipo INT PRIMARY KEY,
    codigoEquipo VARCHAR(50),
    nombreEquipo VARCHAR(100),
    tipoEquipo VARCHAR(50),
    estadoEquipo VARCHAR(20),
    ubicacion VARCHAR(100),
    CantidadDisponible INT
);


CREATE TABLE Estudiantes (
    idEstudiante INT PRIMARY KEY,
    nombre VARCHAR(100),
    carnetEstudiante VARCHAR(50),
    carrera VARCHAR(100),
    grupo VARCHAR(50),
    idCarrera INT
   );

CREATE TABLE Prestamos (
    idPrestamo INT PRIMARY KEY,
    idEstudiante INT,
    idEquipo INT,
    fechaPrestamo DATETIME,
    fechaDevolucionEstimada DATETIME,
    fechaDevolucionReal DATETIME,
    estadoPrestamo VARCHAR(20),
    FOREIGN KEY (idEstudiante) REFERENCES Estudiantes(idEstudiante),
    FOREIGN KEY (idEquipo) REFERENCES Equipos(idEquipo)
);


CREATE TABLE HistorialDevoluciones (
    idDevolucion INT PRIMARY KEY,
    idPrestamo INT,
    fechaDevolucion DATETIME,
    estadoEquipoDespuesDeDevolucion VARCHAR(20),
    FOREIGN KEY (idPrestamo) REFERENCES Prestamos(idPrestamo)
);


CREATE TABLE ColasDeEspera (
    idCola INT PRIMARY KEY,
    idEquipo INT,
    idEstudiante INT,
    fechaIngresoCola DATETIME,
    FOREIGN KEY (idEquipo) REFERENCES Equipos(idEquipo),
    FOREIGN KEY (idEstudiante) REFERENCES Estudiantes(idEstudiante)
);
