use pedido_venda;

desc pedido;

alter table pedido 
add column status varchar(20) not null default 'ORCAMENTO';

desc pedido;

