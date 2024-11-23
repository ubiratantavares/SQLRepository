-- criando tabela pedido
use pedido_venda;

create table pedido (
   id bigint primary key auto_increment,
   data_criacao datetime,
   observacao text,
   data_entrega date,
   valor_frete decimal(8,2),
   valor_total decimal(10,2)
) engine=InnoDB;