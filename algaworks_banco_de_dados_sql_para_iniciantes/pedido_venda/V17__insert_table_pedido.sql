use pedido_venda;

desc pedido;

select * from pedido;

insert into pedido (data_criacao, data_entrega, valor_total, cliente_id, forma_pagamento, status)
values (now(), '2014-08-25', 200, 1, 'DINHEIRO', 'CANCELADO');

select * from pedido;