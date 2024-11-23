drop database if existis aula;
create database aula;

create table paciente(
	idpaciente	integer	auto_increment,
	nome	varchar(25)	not null,
	datanascimento	date	not null,
	primary key(idpaciente));

insert into paciente values(null, 'Globinho','1986-03-02');
insert into paciente values(null, 'Hannah','1990-07-22');
insert into paciente values(null, 'Etiene','1988-10-18');

select * from paciente;

create table hospital(
	idhospital	integer	auto_increment,
	nome	varchar(25)	not null,
	especialidade	varchar(25)	not null,
	primary key(idhospital));

insert into hospital values(null, 'Clinica A','Psiquiatria');
insert into hospital values(null, 'Clinica B','Reumatologia');
insert into hospital values(null, 'Clinica C','Pediatria');

select * from hospital;

create table atendimento(
	idatendimento integer auto_increment,
	id_hospital	integer	not null,
	id_paciente	integer	not null,
	dataatendimento	varchar(25)	not null,
	primary key(idatendimento));

alter table atendimento add constraint fk_atendimento_hospital
 foreign key(id_hospital) references hospital(idhospital)
 on delete cascade;

alter table atendimento add constraint fk_atendimento_paciente
 foreign key(id_paciente) references paciente(idpaciente)
 on delete cascade;

insert into atendimento values(null,1,1,now());
insert into atendimento values(null,1,2,now());
insert into atendimento values(null,2,1,now());
insert into atendimento values(null,2,2,now());
insert into atendimento values(null,2,3,now());
insert into atendimento values(null,3,1,now());


create view v$paciente




select p.nome, a.dataatendimento
 from paciente p
 join atendimento a
 on p.idpaciente = a.id_paciente;

select  * from paciente where datanascimento between '1980-01-01' and '2000-01-01';

create view v$atendimento
as
select
	a.idatendimento	as	id,
	p.nome	as	paciente,
	h.nome	as	hospital,
	h.especialidade	as	tipo,
	a.dataatendimento	as data
from atendimento a
join paciente p
on p.idpaciente = a.id_paciente
join hospital h
on h.idhospital = a.id_hospital;

select * from v$atendimento;


----------------------------

create table venda(
	idvenda	integer	auto_increment,
	vendedor	varchar(25)	not null,
	loja	varchar(25)	not null,
	valor	double not null,
	primary key(idvenda));

insert into venda values(null,'Fabio','RJ','2000');
insert into venda values(null,'Fabio','RJ','4000');
insert into venda values(null,'Fabio','RJ','5000');
insert into venda values(null,'Globo','RJ','2000');
insert into venda values(null,'GLobo','RJ','6000');
insert into venda values(null,'GLobo','RJ','500');
insert into venda values(null,'Cabelo','SP','1000');
insert into venda values(null,'Cabelo','SP','600');
insert into venda values(null,'Cabelo','SP','8000');
insert into venda values(null,'Hanna','MG','2000');
insert into venda values(null,'Hanna','MG','1000');

select * from venda;

select sum(valor) as somatorio from venda;
select avg(valor) as media from venda;
select max(valor) as maior from venda;
select min(valor) as menor from venda;
select count(valor) as quantidade from venda;


select vendedor, loja, max(valor) from venda;

select vendedor, loja, min(valor) from venda;

select * from venda where valor >= (select avg(valor) from venda);

select vendedor, sum(valor)
from venda
group by vendedor;

select loja, sum(valor)
from venda
group by loja;

select vendedor,loja,sum(valor)
from venda
group by vendedor, loja with rollup;

select
	v.vendedor,
	v.valor,
	case when v.valor >= 5000 then 'BOM' else 'RUIM' end as Situacao
from venda v;

select
	v.vendedor,
	v.valor,
	case when v.valor >= (select avg(valor) from venda) then 'Acima' else 'Abaixo' end as Situacao
from venda v;



delimiter $

create table aluno(
	idaluno	integer,
	nome varchar(35),
	primary key(idaluno))$
insert into aluno values(1,'max')$
insert into aluno values(2,'cid')$
insert into aluno values(3,'xara')$
select * from aluno$

create table backup
as select * from aluno$

select * from backup$




create trigger gatilho
before delete on aluno
for each row
begin
	insert into backup values(old.idaluno, old.nome);

end;
$


insert into aluno values(4,'Hanna')$
select * from aluno$

delete from aluno where idaluno = 4$
select * from aluno$
select * from backup$


