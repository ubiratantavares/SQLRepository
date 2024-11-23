-- MODELOS:
CREATE TABLE materiais (
   codmat serial PRIMARY KEY,
   descricao VARCHAR(40) NOT NULL
)
CREATE TABLE movimento (
   codmovi serial PRIMARY KEY,
   tipomov varchar(1) CHECK (tipomov='E' or tipomov='S'),
   quant integer NOT NULL,
   valuni numeric(8,2) NOT NULL,
   codmat integer REFERENCES materiais(codmat)
)
INSERT INTO materiais VALUES (default, 'CANETA');
INSERT INTO materiais VALUES (default, 'LAPIS');
INSERT INTO materiais VALUES (default, 'PAPEL A4');
INSERT INTO materiais VALUES (default, 'APAGADOR');
---
INSERT INTO movimento VALUES (default, 'E',500,1.20,1);
INSERT INTO movimento VALUES (default, 'E',400,1.20,2);
INSERT INTO movimento VALUES (default, 'E',200,15.00,3);
INSERT INTO movimento VALUES (default, 'S',5,1.20,1);
INSERT INTO movimento VALUES (default, 'S',6,1.20,2);
INSERT INTO movimento VALUES (default, 'S',10,15.00,3);
SELECT * FROM materiais
SELECT * FROM movimento
-- Views : Instrução SQL que retorna dados a partir de 
-- um SELECT e salva como um novo objeto no banco de dados

CREATE VIEW vconsulta01 AS
SELECT descricao FROM materiais

SELECT * FROM vconsulta02

CREATE VIEW vconsulta02 AS
SELECT 
materiais.codmat, descricao,tipomov,quant,valuni,
quant*valuni as total
FROM materiais INNER JOIN movimento ON
materiais.codmat=movimento.codmat

CREATE VIEW vconsulta03 AS
SELECT 
descricao, tipomov, sum(quant) as quant, 
sum(valuni) as valor
FROM materiais INNER JOIN movimento ON
materiais.codmat=movimento.codmat
GROUP BY descricao, tipomov

SELECT * FROM vconsulta03

CREATE VIEW vconsulta04 AS
SELECT descricao, quant, valuni
FROM materiais
LEFT JOIN movimento ON materiais.codmat=movimento.codmat
WHERE tipomov='S'
ORDER BY quant desc

SELECT * from vconsulta04

-- UNION : Combina resultados de duas ou mais tabelas
SELECT 
materiais.codmat, descricao, 
(SELECT sum(quant) from movimento WHERE 
materiais.codmat=codmat and tipomov='S') as quant
FROM materiais
GROUP BY materiais.codmat,descricao
UNION ALL
select NULL as codmat, 'TOTAL GERAL' as descricao, 
sum(quant) from 
movimento as quant where tipomov='S'

-- Criar uma view que selecione dados de ambas as tabelas
-- somente valor unitários acima de 5.00, ordenando por
-- descricao e os seguintes campos : descricao, quant,
-- valuni, total (quant x valuni)
CREATE VIEW exercicio1 AS
SELECT descricao, quant, valuni, quant*valuni as total
FROM materiais INNER JOIN movimento 
ON materiais.codmat=movimento.codmat
WHERE valuni > 5.00 ORDER BY descricao

-- Criar uma view que selecione dados de ambas as tabelas
-- somente total (quant x valuni) < 40.00
-- campos : descricao, valuni, quant, 
-- total (quant x valuni)
CREATE VIEW exercicio2 AS
SELECT descricao, valuni, quant, quant*valuni as total
FROM materiais INNER JOIN movimento 
ON materiais.codmat=movimento.codmat
WHERE quant*valuni < 40

-- Apagar uma VIEW -- DROP VIEW nomedaview



