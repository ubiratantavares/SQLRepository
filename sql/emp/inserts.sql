USE EMP;
--
-- DEPARTAMENTO
--

INSERT INTO DEPARTAMENTO (DNOME, DNUMERO, GERSSN, GERDATAINICIO)
VALUES ('Sede administrativa', 1, null, null);

INSERT INTO DEPARTAMENTO (DNOME, DNUMERO, GERSSN, GERDATAINICIO)
VALUES ('Administra��o', 4, null, null);

INSERT INTO DEPARTAMENTO (DNOME, DNUMERO, GERSSN, GERDATAINICIO)
VALUES ('Pesquisa', 5, null, null);

--
-- EMPREGADO
--

INSERT INTO EMPREGADO (PNOME, MINICIAL, UNOME, SSN, DATANASC, ENDERECO, SEXO, SALARIO, SUPERSSN, DNO)
VALUES ('James', 'E', 'Borg', 888665555, '1937-11-10', '450 Stone, Houston, TX', 'M', 55000, null, 1);

INSERT INTO EMPREGADO (PNOME, MINICIAL, UNOME, SSN, DATANASC, ENDERECO, SEXO, SALARIO, SUPERSSN, DNO)
VALUES ('Franklin', 'T', 'Wong', 333445555, '1955-12-08', '638 Voss, Houston, TX', 'M', 40000, 888665555, 5);

INSERT INTO EMPREGADO (PNOME, MINICIAL, UNOME, SSN, DATANASC, ENDERECO, SEXO, SALARIO, SUPERSSN, DNO)
VALUES ('Ramesh', 'K', 'Narayan', 666884444, '1962-09-15', '975 Fire Oak, Humble, TX', 'M', 38000, 333445555, 5);

INSERT INTO EMPREGADO (PNOME, MINICIAL, UNOME, SSN, DATANASC, ENDERECO, SEXO, SALARIO, SUPERSSN, DNO)
VALUES ('John', 'B', 'Smith', 123456789, '1965-01-09', '731  Fondren, Houston, TX', 'M', 30000, 333445555, 5);

INSERT INTO EMPREGADO (PNOME, MINICIAL, UNOME, SSN, DATANASC, ENDERECO, SEXO, SALARIO, SUPERSSN, DNO)
VALUES ('Jennifer', 'S', 'Wallace', 987654321, '1941-06-20', '291 Berry, Bellaire, TX', 'F', 43000, 888665555, 4);

INSERT INTO EMPREGADO (PNOME, MINICIAL, UNOME, SSN, DATANASC, ENDERECO, SEXO, SALARIO, SUPERSSN, DNO)
VALUES ('Alicia', 'J', 'Zelaya', 999887777, '1968-01-19', '3321 Castle, Spring, TX', 'F', 25000, 987654321, 4);

INSERT INTO EMPREGADO (PNOME, MINICIAL, UNOME, SSN, DATANASC, ENDERECO, SEXO, SALARIO, SUPERSSN, DNO)
VALUES ('Ahmad', 'V', 'Jabbar', 987987987, '1969-03-29', '980 Dallas, Houston, TX', 'M', 25000, 987654321, 4);

INSERT INTO EMPREGADO (PNOME, MINICIAL, UNOME, SSN, DATANASC, ENDERECO, SEXO, SALARIO, SUPERSSN, DNO)
VALUES ('Joyce', 'A', 'English', 453453453, '1972-07-31', '5631 Rice, Houston, TX', 'F', 25000, 333445555, 5);

--
-- LIGAR DEPARTAMENTO A SEU GERENTE
--

UPDATE DEPARTAMENTO SET
GERSSN=888665555,
GERDATAINICIO='1981-06-19'
WHERE DNUMERO=1;

UPDATE DEPARTAMENTO SET
GERSSN=333445555,
GERDATAINICIO='1988-05-22'
WHERE DNUMERO=5;

UPDATE DEPARTAMENTO SET
GERSSN=987654321,
GERDATAINICIO='1995-01-01'
WHERE DNUMERO=4;

--
-- DEPT_LOCALIZACOES
--

INSERT INTO DEPT_LOCALIZACOES (DNUMERO, DLOCALIZACAO)
VALUES (1, 'Houston');

INSERT INTO DEPT_LOCALIZACOES (DNUMERO, DLOCALIZACAO)
VALUES (4, 'Staffor');

INSERT INTO DEPT_LOCALIZACOES (DNUMERO, DLOCALIZACAO)
VALUES (5, 'Bellaire');

INSERT INTO DEPT_LOCALIZACOES (DNUMERO, DLOCALIZACAO)
VALUES (5, 'Sugarland');

--
-- PROJETO
--

INSERT INTO PROJETO (PJNOME, PNUMERO, PLOCALIZACAO, DNUM)
VALUES ('ProdutoX', 1, 'Bellaire', 5);

INSERT INTO PROJETO (PJNOME, PNUMERO, PLOCALIZACAO, DNUM)
VALUES ('ProdutoY', 2, 'Sugarland', 5);

INSERT INTO PROJETO (PJNOME, PNUMERO, PLOCALIZACAO, DNUM)
VALUES ('ProdutoZ', 3, 'Houston', 5);

INSERT INTO PROJETO (PJNOME, PNUMERO, PLOCALIZACAO, DNUM)
VALUES ('Automatiza��o', 10, 'Stafford', 4);

INSERT INTO PROJETO (PJNOME, PNUMERO, PLOCALIZACAO, DNUM)
VALUES ('Reorganiza��o', 20, 'Houston', 1);

INSERT INTO PROJETO (PJNOME, PNUMERO, PLOCALIZACAO, DNUM)
VALUES ('Novos Benef�cios', 30, 'Stafford', 4);

--
-- TRABALHA_EM
--

INSERT INTO TRABALHA_EM (ESSN, PNO, HORAS)
VALUES (123456789, 1, 32.5);

INSERT INTO TRABALHA_EM (ESSN, PNO, HORAS)
VALUES (123456789, 2, 7.5);

INSERT INTO TRABALHA_EM (ESSN, PNO, HORAS)
VALUES (666884444, 3, 40.0);

INSERT INTO TRABALHA_EM (ESSN, PNO, HORAS)
VALUES (453453453, 1, 20.0);

INSERT INTO TRABALHA_EM (ESSN, PNO, HORAS)
VALUES (453453453, 2, 20.0);

INSERT INTO TRABALHA_EM (ESSN, PNO, HORAS)
VALUES (333445555, 2, 10.0);

INSERT INTO TRABALHA_EM (ESSN, PNO, HORAS)
VALUES (333445555, 3, 10.0);

INSERT INTO TRABALHA_EM (ESSN, PNO, HORAS)
VALUES (333445555, 10, 10.0);

INSERT INTO TRABALHA_EM (ESSN, PNO, HORAS)
VALUES (333445555, 20, 10.0);

INSERT INTO TRABALHA_EM (ESSN, PNO, HORAS)
VALUES (999887777, 30, 30.0);

INSERT INTO TRABALHA_EM (ESSN, PNO, HORAS)
VALUES (999887777, 10, 10.0);

INSERT INTO TRABALHA_EM (ESSN, PNO, HORAS)
VALUES (987987987, 10, 35.0);

INSERT INTO TRABALHA_EM (ESSN, PNO, HORAS)
VALUES (987987987, 30, 5.0);

INSERT INTO TRABALHA_EM (ESSN, PNO, HORAS)
VALUES (987654321, 30, 20.0);

INSERT INTO TRABALHA_EM (ESSN, PNO, HORAS)
VALUES (987654321, 20, 15.0);

INSERT INTO TRABALHA_EM (ESSN, PNO, HORAS)
VALUES (888665555, 20, null);

--
-- DEPENDENTE
--

INSERT INTO DEPENDENTE (ESSN, NOME_DEPENDENTE, SEXO, DATANASC, PARENTESCO)
VALUES (333445555, 'Alice', 'F', '1986-04-05', 'FILHA');

INSERT INTO DEPENDENTE (ESSN, NOME_DEPENDENTE, SEXO, DATANASC, PARENTESCO)
VALUES (333445555, 'Theodore', 'M', '1983-10-25', 'FILHO');

INSERT INTO DEPENDENTE (ESSN, NOME_DEPENDENTE, SEXO, DATANASC, PARENTESCO)
VALUES (333445555, 'Joy', 'F', '1958-05-03', 'C�NJUGE');

INSERT INTO DEPENDENTE (ESSN, NOME_DEPENDENTE, SEXO, DATANASC, PARENTESCO)
VALUES (987654321, 'Abner', 'M', '1942-02-28', 'C�NJUGE');

INSERT INTO DEPENDENTE (ESSN, NOME_DEPENDENTE, SEXO, DATANASC, PARENTESCO)
VALUES (123456789, 'Michael', 'M', '1988-01-04', 'FILHO');

INSERT INTO DEPENDENTE (ESSN, NOME_DEPENDENTE, SEXO, DATANASC, PARENTESCO)
VALUES (123456789, 'Alice', 'F', '1988-12-30', 'FILHA');

INSERT INTO DEPENDENTE (ESSN, NOME_DEPENDENTE, SEXO, DATANASC, PARENTESCO)
VALUES (123456789, 'Elizabeth', 'F', '1967-05-05', 'C�NJUGE');