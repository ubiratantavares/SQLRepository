create table professor (
	id bigint primary key auto_increment,
	nome Varchar(100) not null,
	sexo varchar(1) not null,
	registro varchar(10) not null,
	data_contrato date
) engine=InnoDB;


