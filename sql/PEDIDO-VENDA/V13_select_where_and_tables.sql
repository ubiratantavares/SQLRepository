-- Consulta com a clausula where e and nas tabelas

use pedido_venda;

select p.data_entrega, p.valor_frete, p.valor_total
from pedido p, cliente c
where p.cliente_id = c.id
and c.nome = 'João Silva';

select pr.*
from cliente c, pedido pe, item_pedido i, produto pr
where c.id = pe.cliente_id
and pe.id = i.pedido_id
and i.produto_id = pr.id
and c.nome = 'João Silva';

select pr.nome, i.quantidade
from cliente c, pedido pe, item_pedido i, produto pr
where c.id = pe.cliente_id
and pe.id = i.pedido_id
and i.produto_id = pr.id
and c.nome = 'João Silva';

select pr.nome, i.quantidade
from cliente c, pedido pe, item_pedido i, produto pr
where c.id = pe.cliente_id
and pe.id = i.pedido_id
and i.produto_id = pr.id
and c.nome = 'Maria Santos';

select * from pedido
where month(data_criacao) = 8
and year(data_criacao) = 2014;

select * from pedido
where data_criacao >= '2014-07-01 00:00:00'
and data_criacao <= '2014-07-31 23:59:59';
