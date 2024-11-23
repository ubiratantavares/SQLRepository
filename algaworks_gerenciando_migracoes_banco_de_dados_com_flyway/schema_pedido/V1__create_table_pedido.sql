use pedido;

create table pedido(
	id bigint primary key auto_increment,
	data_criacao datetime not null,
	observacao varchar(100)
)engine=InnoDB;

