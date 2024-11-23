drop database if exists banco2;

create database banco2;

use banco2;

create table funcionario(idfuncionario int primary key,
				nome varchar(35) not null,
				email varchar(35) not null unique,
				sexo enum('m','f') not null);

create table financeiro(idfinanceiro int primary key,
			setor varchar(15),
			dataentrada date,
			salario double,
			id_funcionario int unique,
	foreign key(id_funcionario) references funcionario(idfuncionario));


insert into funcionario values (1,'netcat','rodrigo@gmail.com','f'),
				(2,'sergio','sergi@gmail.com','m'),
				(3,'tinoco','tinoco@gmail.com','m');

insert into financeiro values (100,'adm','2008-08-19',8000,1),
				(101,'inf','2009-08-19',12000,2),
				(102,'inf','2010-08-19',8000,3);

select * from funcionario;
select * from financeiro;


select f.nome,f.sexo,fi.setor,fi.salario
from funcionario f
inner join
financeiro fi
on f.idfuncionario = fi.id_funcionario;

create view vw_funcionario as
select f.nome,f.sexo,fi.setor,fi.salario
from funcionario f
inner join
financeiro fi
on f.idfuncionario = fi.id_funcionario;

select * from vw_funcionario;

select sum(salario) as total from financeiro;

select count(idfuncionario) as quantidade from funcionario;

select avg(salario) as media from financeiro;

insert into funcionario values (4,'belem','edson@gmail.com','m');
insert into financeiro values (103,'adm','2005-10-23',1200,4);

select sexo from funcionario;
select distinct(sexo) from funcionario;

select sum(fi.salario) as total, f.sexo
from funcionario f
inner join
financeiro fi
on f.idfuncionario = fi.id_funcionario
group by sexo;



select min(fi.salario), f.sexo
from funcionario f
inner join
financeiro fi
on f.idfuncionario = fi.id_funcionario
group by sexo;



select sum(salario) as total, setor from financeiro group by setor;




create table pessoa(idpessoa int primary key,
			nome varchar(35),
			email varchar(35),
			sexo enum('m','f'));

create table banco(idbanco int primary key,
		agencia varchar(35));

create table conta (idconta int primary key,
			id_pessoa int,
			id_banco int);

alter table conta add foreign key(id_pessoa) references pessoa(idpessoa);

alter table conta add foreign key(id_banco) references banco(idbanco);

insert into pessoa values (10,'luis','luis@gmail.com','m'),
				(11,'jose','jose@gmail.com','m'),
				(12,'carla','carla@gmail.com','f');

insert into banco values (1000,'bradesco'),(1001,'santander');


insert into conta values (10000,10,1000),(10001,10,1001),(10002,11,1001),(1003,12,1000);

select * from pessoa;
select * from banco;
select * from conta;

create view v$conta as
select p.nome,p.email,p.sexo,b.agencia,c.idconta
from conta c
inner join
pessoa p
on p.idpessoa = c.id_pessoa
inner join
banco b
on b.idbanco = c.id_banco;

select * from v$conta;


select count(*) as total from v$conta where agencia = 'santander';
select count(*) as total from v$conta where agencia = 'bradesco';

select now();

select date_format(now(),'%d-%M-%Y');

select date_format(now(),'%d-%m-%y');

M = mes por extenso, m = numero
Y = ano completo, y = 2 ultimos digitos

select to_days(now())- to_days('2011-06-01');

select (to_days(now())- to_days('1988-10-18'))/365;

select round((to_days(now())- to_days('1988-10-18'))/365,0);
arredonda

select truncate((to_days(now())- to_days('1988-10-18'))/365,0);
elimina

select truncate(((to_days(now()) - to_days(dataentrada))/365),0) as tempo from financeiro;




exercícios

a) criar as tabekas (1 pra N)
pessoa _ telefone
criar view de uniao

b) 1 pra 1: pessoa _endereço
creiar view de uniao

c) N pra N
paciente - médico
criar view de união
