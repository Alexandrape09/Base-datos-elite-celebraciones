-- Crear base de datos
CREATE DATABASE EliteCelebraciones;

-- Usar la base de datos
USE EliteCelebraciones;

-- Crear tabla de organizadores
CREATE TABLE Organizadores (
    OrganizadorID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Telefono VARCHAR(15),
    Email VARCHAR(100) UNIQUE NOT NULL,
    Direccion TEXT
);

-- Crear tabla de eventos
CREATE TABLE Eventos (
    EventoID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Fecha DATE NOT NULL,
    Hora TIME NOT NULL,
    Lugar VARCHAR(255) NOT NULL,
    Descripcion TEXT,
    OrganizadorID INT,
    FOREIGN KEY (OrganizadorID) REFERENCES Organizadores(OrganizadorID)
);

-- Crear tabla de asistentes
CREATE TABLE Asistentes (
    AsistenteID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Telefono VARCHAR(15),
    Email VARCHAR(100) UNIQUE NOT NULL
);

-- Crear tabla de entradas
CREATE TABLE Entradas (
    EntradaID INT AUTO_INCREMENT PRIMARY KEY,
    EventoID INT,
    AsistenteID INT,
    FechaCompra DATE NOT NULL,
    TipoEntrada VARCHAR(50),
    Precio DECIMAL(10, 2),
    FOREIGN KEY (EventoID) REFERENCES Eventos(EventoID),
    FOREIGN KEY (AsistenteID) REFERENCES Asistentes(AsistenteID)
);

-- Crear tabla de pagos
CREATE TABLE Pagos (
    PagoID INT AUTO_INCREMENT PRIMARY KEY,
    EntradaID INT,
    FechaPago DATE NOT NULL,
    Monto DECIMAL(10, 2) NOT NULL,
    MetodoPago VARCHAR(50),
    FOREIGN KEY (EntradaID) REFERENCES Entradas(EntradaID)
);
