-- criando tabela cliente
use pedido_venda;

create table cliente(
   id bigint primary key auto_increment,
   nome varchar(100),
   email varchar(50),
   data_nascimento date
) engine=InnoDB;
