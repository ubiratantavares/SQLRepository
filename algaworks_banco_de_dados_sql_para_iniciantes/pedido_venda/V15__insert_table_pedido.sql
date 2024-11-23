use pedido_venda;

desc pedido;

select * from pedido;

insert into pedido (data_criacao, data_entrega, valor_total, cliente_id, forma_pagamento)
values (now(), '2017-04-30', 200, 1, 'DINHEIRO');

select * from pedido;