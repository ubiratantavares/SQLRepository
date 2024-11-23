-- criando a tabela item_pedido
use pedido_venda;

create table item_pedido (
   pedido_id bigint,
   produto_id bigint,
   quantidade integer,
   primary key (pedido_id, produto_id),
   foreign key (pedido_id) references pedido(id),
   foreign key (produto_id) references produto(id)
) engine=InnoDB;
