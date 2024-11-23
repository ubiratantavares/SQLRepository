use pedido_venda;

select * from pedido;

update pedido
set observacao = 'Pedido normal'
where cliente_id = 1;

select * from pedido;

