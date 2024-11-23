
use pedido_venda;

select * from pedido
where cliente_id is null;

delete from pedido
where cliente_id is null;