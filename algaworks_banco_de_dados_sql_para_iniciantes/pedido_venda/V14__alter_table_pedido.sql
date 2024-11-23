use pedido_venda;

desc pedido;

alter table pedido 
add column forma_pagamento varchar(20) not null;

desc pedido;

