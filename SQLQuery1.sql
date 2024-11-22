CREATE DATABASE GESTIONCITAS
go
--
use GESTIONCITAS
--usuario, paciente, especialidad, medico, cita, historial_medico
CREATE TABLE Usuario (
    Id_Usuario INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Rol VARCHAR(30) NOT NULL,
    Contrasena VARCHAR(50) NOT NULL
);
--
CREATE TABLE Paciente (
    Id_Paciente INT PRIMARY KEY,
    Nombre_Paciente VARCHAR(50) NOT NULL,
    Apellido_Paciente VARCHAR(50) NOT NULL,
    Fecha_Nacimiento DATE NOT NULL,
    N_Telefono VARCHAR(15) NOT NULL,
    Direccion VARCHAR(100) NOT NULL
);
--
CREATE TABLE Especialidad (
    Id_Especialidad INT PRIMARY KEY,
    Nombre_Especialidad VARCHAR(50) NOT NULL UNIQUE
);

--
CREATE TABLE Medico (
    Id_Medico INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Especialidad VARCHAR(50) NOT NULL,
    Horario VARCHAR(50) NOT NULL,
    Correo VARCHAR(50) UNIQUE NOT NULL,
    N_Telefono VARCHAR(15) NOT NULL
);
--
CREATE TABLE Cita (
    Id_Cita INT PRIMARY KEY,
    Id_Paciente INT NOT NULL,
    Id_Medico INT NOT NULL,
    Fecha DATE NOT NULL,
    Hora TIME NOT NULL,
    Estado VARCHAR(20) NOT NULL,
    FOREIGN KEY (Id_Paciente) REFERENCES Paciente(Id_Paciente),
    FOREIGN KEY (Id_Medico) REFERENCES Medico(Id_Medico)
);
--
CREATE TABLE Historial_Medico (
    Id_Historial INT PRIMARY KEY,
    Id_Paciente INT NOT NULL,
    Id_Medico INT NOT NULL,
    Fecha DATE NOT NULL,
    Diagnostico TEXT NOT NULL,
    Tratamiento TEXT NOT NULL,
    FOREIGN KEY (Id_Paciente) REFERENCES Paciente(Id_Paciente),
    FOREIGN KEY (Id_Medico) REFERENCES Medico(Id_Medico)
);