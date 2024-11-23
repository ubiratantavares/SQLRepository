-- Inserindo na tabela pedido
use pedido_venda;

insert into pedido(data_criacao, observacao, data_entrega, valor_frete, valor_total, cliente_id)
values ('2014-06-10 10:03:20', 'Pedido normal', '2014-06-12', 30.25, 352.50, 1);

insert into pedido(data_criacao, observacao, data_entrega, valor_frete, valor_total, cliente_id) 
values ('2014-07-11 15:22:00', 'Pedido normal', '2014-07-15', 33.00, 400.00, 2);

insert into pedido(data_criacao, observacao, data_entrega, valor_frete, valor_total, cliente_id)
values ('2014-08-19 15:22:22', 'Pedido normal', '2004-08-25', 10.22, 100.00, 1);

insert into pedido(data_criacao, observacao, data_entrega, valor_frete, valor_total, cliente_id)
values ('2014-08-20 20:53:20', 'Pedido urgente', '2004-08-22', 30.22, 400.00, 1);

insert into pedido(data_criacao, observacao, data_entrega, valor_frete, valor_total, cliente_id)
values (now(), 'Pedido urgente', '2017-01-01', 10.00, 100.00, 2);

select * from pedido;