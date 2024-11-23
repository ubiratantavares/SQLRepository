-- Criando a tabela aluno

use escola_ingles;

create table aluno (
	id bigint primary key auto_increment,
	nome Varchar(100) not null,
	sexo varchar(1) not null,
	matricula varchar(100) not null
) engine=InnoDB;


