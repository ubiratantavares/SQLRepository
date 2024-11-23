create database escola;

use escola;

create table cursos (
	curso_sigla char(3) not null,
	curso_nome varchar(35) not null,
	curso_cargahoraria int(4),
	curso_datacriacao date not null,
	primary key (curso_sigla)
);

desc cursos;

drop table cursos;

drop database escola;


