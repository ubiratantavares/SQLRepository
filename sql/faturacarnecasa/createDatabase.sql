CREATE DATABASE FATURACARNECASA;

USE FATURACARNECASA;

CREATE TABLE CARNE (
     CNUMERO int NOT NULL,
     VALOR float(2),
     PRIMARY KEY (CNUMERO)
) TYPE=INNODB;

CREATE TABLE FATURA (
     FNUMERO int NOT NULL,
     DATAVENC date
     NUM int,
     PRIMARY KEY (FNUMERO), 
     FOREIGN KEY(NUM) REFERENCES CARNE (CNUMERO)
) TYPE=INNODB;
