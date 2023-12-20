CREATE DATABASE BDActividad5_7;

USE BDActividad5_7;


CREATE TABLE Gimnasio(
	nombre varchar(50),
	CONSTRAINT pk_Gimnasio PRIMARY KEY (nombre)
);


CREATE TABLE Persona(
	dni varchar(9),
	nombre varchar(50) NOT NULL,
	primer_apellido varchar(50) NOT NULL,
	CONSTRAINT pk_Persona PRIMARY KEY (dni)
);


CREATE TABLE Entrenador(
	id int AUTO_INCREMENT,
	dniPersona varchar(9) NOT NULL,
	salario float(5) NOT NULL,
	nombreGimnasio varchar(50) NOT NULL,
	CONSTRAINT pk_Entrenador PRIMARY KEY (id),
	CONSTRAINT fk_Entrenador_Persona FOREIGN KEY (dniPersona) REFERENCES Persona (dni),
	CONSTRAINT fk_Entrenador_Gimnasio FOREIGN KEY (nombreGimnasio) REFERENCES Gimnasio (nombre)
);


CREATE TABLE Cliente(
	id int AUTO_INCREMENT,
	dniPersona varchar(9) NOT NULL,
	fecha_de_alta date NOT NULL,
	CONSTRAINT pk_Cliente PRIMARY KEY (id),
	CONSTRAINT fk_Cliente_Persona FOREIGN KEY (dniPersona) REFERENCES Persona (dni)
);


CREATE TABLE Planificacion(
	codigo int(10),
	fecha_de_creacion date NOT NULL,
	CONSTRAINT pk_Planificacion PRIMARY KEY (codigo)
);


CREATE TABLE Entrenador_Cliente_Planificacion(
	id int AUTO_INCREMENT,
	idEntrenador int NOT NULL,
	idCliente int NOT NULL,
	codigoPlanificacion int(10) NOT NULL,
	CONSTRAINT pk_Entrenador_Cliente_Planificacion PRIMARY KEY (id),
	CONSTRAINT fk_Entrenador_Entrenador_Cliente_Planificacion FOREIGN KEY (idEntrenador) REFERENCES Entrenador (id),
	CONSTRAINT fk_Cliente_Entrenador_Cliente_Planificacion FOREIGN KEY (idCliente) REFERENCES Cliente (id),
	CONSTRAINT fk_Planificacion_Entrenador_Cliente_Planificacion FOREIGN KEY (codigoPlanificacion) REFERENCES Planificacion (codigo)
);


CREATE TABLE Entrenamiento(
	codigo int(10),
	fecha_de_creacion date NOT NULL,
	codigoPlanificacion int(10) NOT NULL,
	CONSTRAINT pk_Entrenamiento PRIMARY KEY (codigo)
);


CREATE TABLE Ejercicio(
	nombre varchar(50),
	numero_de_series int(3) NOT NULL,
	numero_de_repeticiones int(3) NOT NULL,
	CONSTRAINT pk_Ejercicio PRIMARY KEY (nombre)
);


CREATE TABLE Entrenamiento_Ejercicio(
	id int AUTO_INCREMENT,
	codigoEntrenamiento int(10) NOT NULL,
	nombreEjercicio varchar(50) NOT NULL,
	CONSTRAINT pk_Entrenamiento_Ejercicio PRIMARY KEY (id),
	CONSTRAINT fk_Entrenamiento_Entrenamiento_Ejercicio FOREIGN KEY (codigoEntrenamiento) REFERENCES Entrenamiento (codigo),
	CONSTRAINT fk_Ejercicio_Entrenamiento_Ejercicio FOREIGN KEY (nombreEjercicio) REFERENCES Ejercicio (nombre)
);


CREATE TABLE Material(
	nombre varchar(50),
	CONSTRAINT pk_Material PRIMARY KEY (nombre)
);


CREATE TABLE Ejercicio_Material(
	id int AUTO_INCREMENT,
	nombreEjercicio varchar(50) NOT NULL,
	nombreMaterial varchar(50) NOT NULL,
	CONSTRAINT pk_Ejercicio_Material PRIMARY KEY (id),
	CONSTRAINT fk_Ejercicio_Ejercicio_Material FOREIGN KEY (nombreEjercicio) REFERENCES Ejercicio (nombre),
	CONSTRAINT fk_Material_Ejercicio_Material FOREIGN KEY (nombreMaterial) REFERENCES Material (nombre)
);


	
	
	
