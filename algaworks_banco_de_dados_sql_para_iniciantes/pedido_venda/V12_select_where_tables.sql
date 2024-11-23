-- Consulta com a clausula where nas tabelas

use pedido_venda;

-- Consulta o cliente com nome João Silva
select * from cliente
where nome = 'João Silva';

-- Consulta o cliente com data_nascimento igual ou superior a 1991-01-01
select * from cliente
where data_nascimento >= '1991-01-01';

-- Consulta todos os dados das tabelas pedido e cliente
select * from pedido p, cliente c
where p.cliente_id = c.id;

