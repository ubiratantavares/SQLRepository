-- Consulta com a clausula where e and nas tabelas

use pedido_venda;

-- Consulta o pedido com observacao nao nulo e valor_total > 200
select * from pedido
where observacao is not null
and valor_total > 200;

-- Consulta os dados dos pedidos do cliente Joao Silva
select p.data_entrega, p.valor_frete, p.valor_total
from pedido p, cliente c
where p.cliente_id = c.id
and c.nome = 'João Silva';

-- Consulta os dados dos produtos dos pedidos do cliente Joao Silva
select pr.*
from cliente c, pedido pe, item_pedido i, produto pr
where c.id = pe.cliente_id
and pe.id = i.pedido_id
and i.produto_id = pr.id
and c.nome = 'João Silva';

-- Consulta o produto e o item do pedido do cliente Joao Silva
select pr.nome, i.quantidade
from cliente c, pedido pe, item_pedido i, produto pr
where c.id = pe.cliente_id
and pe.id = i.pedido_id
and i.produto_id = pr.id
and c.nome = 'João Silva';

-- Consulta o produto e o item do pedido do cliente Maria Santos
select pr.nome, i.quantidade
from cliente c, pedido pe, item_pedido i, produto pr
where c.id = pe.cliente_id
and pe.id = i.pedido_id
and i.produto_id = pr.id
and c.nome = 'Maria Santos';

-- Consulta os pedidos realizados no mes de agosto no ano de 2014
select * from pedido
where month(data_criacao) = 8
and year(data_criacao) = 2014;

-- Consulta os pedidos realizados dentro do mes de julho no ano de 2014
select * from pedido
where data_criacao >= '2014-07-01 00:00:00'
and data_criacao <= '2014-07-31 23:59:59';

-- Consulta os pedidos realizados dentro do mes de julho no ano de 2014
select * from pedido
where date(data_criacao) >= '2014-07-01'
and date(data_criacao) <= '2014-07-31';