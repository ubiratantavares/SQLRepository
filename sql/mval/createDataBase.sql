-- Gera��o de Modelo f�sico
-- Sql ANSI 2003 - brModelo.

CREATE DATABASE MVAL;

USE MVAL;

CREATE TABLE Pessoa (
    PCodigo INT NOT NULL,
    NomeCompleto VARCHAR(50),
    NomeCurto VARCHAR(15),
    DataNasc DATE,
    Endereco VARCHAR(50),
    CEP VARCHAR(9),
    PRIMARY KEY(PCODIGO)
);

CREATE TABLE Area (
    ACodigo integer NOT NULL,
    Funcao varchar(15),
    Setor varchar(5),
    PRIMARY KEY(ACodigo)
);

CREATE TABLE Telefone (
TCodigo integer NOT NULL,
Tipo varchar(11),
Numero varchar(9),
PCodigo integer,
PRIMARY KEY(TCodigo),
FOREIGN KEY(PCodigo) REFERENCES Pessoa (PCodigo)
);

CREATE TABLE CorreioEletronico (
CCodigo integer NOT NULL,
email varchar(50),
PCodigo integer,
PRIMARY KEY(CCodigo),
FOREIGN KEY(PCodigo) REFERENCES Pessoa (PCodigo)
);

CREATE TABLE Grupo (
GCodigo integer NOT NULL,
DiaSemana varchar(7),
Horario varchar(5),
PRIMARY KEY(GCodigo)
);

CREATE TABLE Escala (
ECodigo integer NOT NULL,
Data date,
GCodigo integer,
PRIMARY KEY(ECodigo),
FOREIGN KEY(GCodigo) REFERENCES Grupo (GCodigo)
);

CREATE TABLE Atua (
ACodigo integer,
PCodigo integer,
FOREIGN KEY(ACodigo) REFERENCES Area (ACodigo),
FOREIGN KEY(PCodigo) REFERENCES Pessoa (PCodigo)
);

CREATE TABLE Pertence (
GCodigo integer,
PCodigo integer,
FOREIGN KEY(GCodigo) REFERENCES Grupo (GCodigo),
FOREIGN KEY(PCodigo) REFERENCES Pessoa (PCodigo)
);