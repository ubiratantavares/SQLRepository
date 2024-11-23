-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Empregado (
CPF Texto(1) PRIMARY KEY,
Nome Texto(1)
)

CREATE TABLE Projeto (
Codigo Texto(1) PRIMARY KEY,
Nome Texto(1)
)

CREATE TABLE Alocacao (
CPF Texto(1),
Codigo Texto(1),
FOREIGN KEY(CPF) REFERENCES Empregado (CPF)
FOREIGN KEY(Codigo) REFERENCES Projeto(Codigo)
)

