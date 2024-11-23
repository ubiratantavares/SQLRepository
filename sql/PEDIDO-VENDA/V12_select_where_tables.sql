-- Consulta com a clausula where nas tabelas

use pedido_venda;

select * from pedido p, cliente c
where p.cliente_id = c.id;

