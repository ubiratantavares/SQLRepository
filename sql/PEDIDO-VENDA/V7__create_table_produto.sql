-- Criando a tabela produto

use pedido_venda;

create table produto(
   id bigint primary key auto_increment,
   nome varchar(50),
   valor_unitario decimal(10,2),
   quantidade_estoque integer
) engine=InnoDB;
