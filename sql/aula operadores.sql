-- OPERADORES   -- O MODELO ABAIXO ESTÁ NA REDE PASTA ROSANE

-- Tabela para controlar os alunos
create table alunos (
   matricula integer primary key,
   nome varchar(10) not null,
   sexo varchar(1) check(sexo in ('F','M'))
)

-- Tabela para controlar mensalidades
-- mesano -> Mes/Ano da cota (ex.052015 = maio de 2015)
-- valorcota -> valor previsto para pagamento 
-- valorpago -> valor pago pelo aluno
create table cobranca (
   titulo serial primary key,
   mesano varchar(6),
   valorcota numeric(10,2),
   valorpago numeric(10,2),
   matricula integer references alunos(matricula)
)

INSERT INTO alunos VALUES (1, 'ALINE', 'F');
INSERT INTO alunos VALUES (2, 'FERNANDO', 'M');
INSERT INTO alunos VALUES (3, 'JANDIRA', 'F');
INSERT INTO alunos VALUES (4, 'PEDRO', 'M');

INSERT INTO cobranca VALUES (default, '042015', 400.00, 400.00, 1);
INSERT INTO cobranca VALUES (default, '052015', 400.00, 0.00, 1);
INSERT INTO cobranca VALUES (default, '042015', 300.00, 0.00, 2);
INSERT INTO cobranca VALUES (default, '052015', 300.00, 0.00, 2);
INSERT INTO cobranca VALUES (default, '042015', 400.00, 400.00, 3);
INSERT INTO cobranca VALUES (default, '052015', 400.00, 400.00, 3);
INSERT INTO cobranca VALUES (default, '042015', 350.00, 400.00, 4);
INSERT INTO cobranca VALUES (default, '052015', 350.00, 350.00, 4);

-- RELAÇÃO DE TODAS AS COBRANÇAS DE TODOS OS ALUNOS
-- ORDENANDO POR MESANO E MATRICULA
SELECT * FROM alunos
INNER JOIN cobranca ON alunos.matricula=cobranca.matricula
ORDER BY mesano, alunos.matricula

-- RELAÇÃO COM JUNÇÃO, SOMENTE DOS ALUNOS INADIMPLENTES
-- ORDENANDO POR NOME
SELECT * FROM alunos
INNER JOIN cobranca ON alunos.matricula=cobranca.matricula
WHERE valorpago=0 ORDER BY nome

-- SOMENTE PAGANTES
SELECT * FROM alunos
INNER JOIN cobranca ON alunos.matricula=cobranca.matricula
WHERE valorpago>0 ORDER BY nome

-- RELAÇÃO COM JUNÇÃO, SOMENTE DOS ALUNOS QUE PAGARAM MENSALIDADE A MAIOR
-- INCLUIR COLUNA COM VALOR PAGO A MAIOR
SELECT *,valorpago-valorcota AS "Diferença" FROM alunos
INNER JOIN cobranca ON alunos.matricula=cobranca.matricula
WHERE valorpago>valorcota

-- RELAÇÃO COM JUNÇÃO, APLICANDO 10% DE AUMENTO NAS MENSALIDADES
-- SOMENTE NOME, MESANO, VALORCOTA
SELECT nome, mesano, valorcota, round(valorcota*1.10,2) AS "Simulação"
FROM alunos
INNER JOIN cobranca ON alunos.matricula=cobranca.matricula

-- RELAÇÃO COM JUNÇÃO, APLICANDO 10% DE DESCONTO NAS MENSALIDADES
-- SOMENTE NOME, MESANO, VALORCOTA, ORDENANDO POR NOME
SELECT nome, mesano, valorcota, valorcota*0.10 as "Desconto",
valorcota-(valorcota*0.10) as "Valor com Desconto"
FROM alunos
INNER JOIN cobranca ON alunos.matricula=cobranca.matricula

-- APLICAR O DESCONTO SOMENTE NA COTA 052015
SELECT nome, mesano, valorcota, valorcota*0.10 as "Desconto",
valorcota-(valorcota*0.10) as "Valor com Desconto"
FROM alunos
INNER JOIN cobranca ON alunos.matricula=cobranca.matricula
WHERE mesano='052015'

UPDATE cobranca SET valorcota = round(valorcota-(valorcota*0.10),2)
WHERE mesano='052015'

select * from cobranca

-- RELAÇÃO COM JUNÇÃO, SOMENTE DOS ALUNOS DOS ALUNOS COM SEXO=M
SELECT * FROM alunos
INNER JOIN cobranca ON alunos.matricula=cobranca.matricula
WHERE sexo='M'

SELECT * FROM alunos
INNER JOIN cobranca ON alunos.matricula=cobranca.matricula
WHERE sexo='F'

SELECT sexo, count(*) FROM alunos WHERE sexo='M'
GROUP BY sexo

-- RELAÇÃO COM JUNÇÃO, agrupando por sexo e mesno
-- E ADIMPLENTES (não devem)
SELECT sexo, mesano, count(*) as quantidade, 
sum(valorcota) as valprevisto
FROM alunos
INNER JOIN cobranca ON alunos.matricula=cobranca.matricula
GROUP BY sexo, mesano

-- RELAÇÃO COM JUNÇÃO, AGRUPANDO POR MES E ANO
-- CAMPOS : VALOR DA COTA, VALOR PAGO, QUANTIDADE
SELECT mesano, sum(valorcota) as valorcota, 
sum(valorpago) as valorpago, count(*) as quantidade
FROM alunos
INNER JOIN cobranca ON alunos.matricula=cobranca.matricula
GROUP BY mesano

-- RELAÇÃO COM JUNÇÃO, AGRUPANDO POR MES E ANO
-- CAMPOS : VALOR DA COTA, VALOR PAGO, QUANTIDADE
-- INCLUIR COLUNA COM O VALOR DA INADIMPLENCIA (VALORCOTA-VALORPAGO)
-- COM TOTAL GERAL
SELECT mesano, sum(valorcota) as "valor cota", 
sum(valorpago) as valorpago, count(*) as quantidade,
sum(valorcota)-sum(valorpago) as inadimplencia
FROM alunos
INNER JOIN cobranca ON alunos.matricula=cobranca.matricula
GROUP BY mesano
UNION ALL
SELECT 'TOTAL' as mesano, sum(valorcota) as valorcota, 
sum(valorpago) as valorpago, count(*) as quantidade,
sum(valorcota)-sum(valorpago) as inadimplencia
FROM alunos
INNER JOIN cobranca ON alunos.matricula=cobranca.matricula






