-- Criando a tabela curso

use escola_ingles;

create table curso (
	id bigint primary key auto_increment,
	descricao Varchar(50),
	carga_horaria int
) engine=InnoDB;


