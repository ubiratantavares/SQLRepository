DROP DATABASE IF EXISTS administradora;

CREATE DATABASE administradora;

USE administradora;

CREATE TABLE condominio (
idCondominio INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome VARCHAR(100) NOT NULL,
endereco VARCHAR(100) NOT NULL
);

CREATE TABLE pessoa (
idPessoa INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
CPF VARCHAR(15) UNIQUE NOT NULL,
identidade VARCHAR(15) UNIQUE NOT NULL,
nome VARCHAR(100) NOT NULL,
dataNasc DATE NOT NULL,
sexo VARCHAR(1) NOT NULL
);

CREATE TABLE telefone (
idTelefone INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
ddd VARCHAR(2),
numero VARCHAR(10),
idPessoa_FK INT(10) NOT NULL,
FOREIGN KEY (idPessoa_FK) REFERENCES pessoa(idPessoa)
ON DELETE RESTRICT
ON UPDATE CASCADE
);

CREATE TABLE proprietario (
idProprietario INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
data DATE,
idPessoa_FK INT(10) NOT NULL,
FOREIGN KEY (idPessoa_FK) REFERENCES pessoa(idPessoa)
ON DELETE RESTRICT
ON UPDATE CASCADE
);

CREATE TABLE corretor (
idCorretor INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
salario DECIMAL(10,2) NOT NULL,
idPessoa_FK INT(10) NOT NULL,
FOREIGN KEY (idPessoa_FK) REFERENCES pessoa(idPessoa)
ON DELETE RESTRICT
ON UPDATE CASCADE
);


CREATE TABLE unidade (
idUnidade INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
endereco VARCHAR(100) NOT NULL,
idCondominio_FK INT(10) NOT NULL,
idProprietario_FK INT(10) NOT NULL,
FOREIGN KEY(idCondominio_FK) REFERENCES condominio (idCondominio)
ON DELETE RESTRICT
ON UPDATE CASCADE,
FOREIGN KEY(idProprietario_FK) REFERENCES proprietario (idProprietario)
ON DELETE RESTRICT
ON UPDATE CASCADE
);

CREATE TABLE inquilino (
idInquilino INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
dia INT(2) NOT NULL,
valor DECIMAL(10,2) NOT NULL,
idPessoa_FK INT(10) NOT NULL,
idUnidade_FK INT(10) NOT NULL,
FOREIGN KEY(idPessoa_FK) REFERENCES pessoa(idPessoa)
ON DELETE RESTRICT
ON UPDATE CASCADE,
FOREIGN KEY(idUnidade_FK) REFERENCES unidade(idUnidade)
ON DELETE RESTRICT
ON UPDATE CASCADE
);

CREATE TABLE atende (
idAtende INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
idCorretor_FK INT(10) NOT NULL,
idInquilino_FK INT(10) NOT NULL,
FOREIGN KEY(idCorretor_FK) REFERENCES corretor (idCorretor)
ON DELETE RESTRICT
ON UPDATE CASCADE,
FOREIGN KEY(idInquilino_FK) REFERENCES inquilino (idInquilino)
ON DELETE RESTRICT
ON UPDATE CASCADE
);

CREATE TABLE contata (
idContata INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
idCorretor_FK INT(10) NOT NULL,
idProprietario_FK INT(10) NOT NULL,
FOREIGN KEY(idCorretor_FK) REFERENCES corretor (idCorretor)
ON DELETE RESTRICT
ON UPDATE CASCADE,
FOREIGN KEY(idProprietario_FK) REFERENCES proprietario (idProprietario)
ON DELETE RESTRICT
ON UPDATE CASCADE
);

SHOW TABLES;

DESC condominio;
DESC pessoa;
DESC telefone;
DESC proprietario;
DESC corretor;
DESC unidade;
DESC inquilino;
DESC atende;
DESC contata;


