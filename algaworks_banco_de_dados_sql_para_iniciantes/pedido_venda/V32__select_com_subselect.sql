use pedido_venda;

select * from pedido;

select * from cliente;

select distinct cliente_id
from pedido;

select nome, email
from cliente
where id in (select distinct cliente_id from pedido);


select distinct cliente_id 
from pedido 
where forma_pagamento = 'DINHEIRO';



select nome, email 
from cliente
where id in (select distinct cliente_id from pedido where forma_pagamento = 'DINHEIRO');
