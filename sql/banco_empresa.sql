create database empresa;

use empresa;


create table departamentos (
	depto_cod int(3) not null auto_increment,
	depto_descricao varchar(30) not null,
	primary key(depto_cod)
);

desc departamentos;

create table funcionarios (
	func_cod int(3) not null,
	func_nome varchar(50) not null,
	func_endereco varchar(50) not null,
	func_depto int(3) not null,
	primary key(func_cod),
	foreign key(func_depto) references departamentos(depto_cod),
	index(func_nome)
);

desc funcionarios;




