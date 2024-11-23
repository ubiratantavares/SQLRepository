create database banco3;

use banco3;

create table professor(
					idprofessor		int		primary key,
					nome			varchar(25)		not null,
					especializacao	varchar(30));

desc professor;

create table aluno(
				idaluno		int 		primary key,
				nome 		varchar(35)	not null,
				email		varchar(50)	not null unique,
				telefone	varchar(25)	not null,
				sexo	enum ('m','f')	not null);
					
desc aluno;

create table curso(
				idcurso		int		primary key,
				curso		varchar(25),
				descricao	varchar(255));
				
desc curso;


create table turma(
				idturma		int 	primary key,
				id_professor	int,
				id_aluno	int,
				id_curso	int,
				horario		varchar(255),
foreign key (id_professor) references professor(idprofessor),
foreign key (id_aluno)	   references aluno(idaluno),
foreign key (id_curso)	   references curso(idcurso));

desc turma;

insert into professor values (10,'Sergio','Bacharel Informatica'),(20,'belem','Bacharel Informatica'),(40,'netcat','Bacharel Informatica');

select * from professor;

insert into aluno values (100,'globinho','globinho@gmail.com','1111111','m'),
			(101,'etiene','etiene@gmail.com','22222222','f'),
			(102,'luanita','luanita@gmail.com','33333333','m'),
			(103,'anny','anny@gmail.com','444444','f'),
			(104,'carla','carla@gmail.com','55555','f'),
			(105,'cabelinho','cabelinho@gmail.com','66666','m');

select * from aluno;

insert into curso values (1000,'Java Developer','96 horas'),
			(1001,'Oracle','48 horas'),
			(1002,'Universidade do Banco','30 horas'),
			(1003,'Universidade da Lógica','30 horas');

select * from curso;


insert into turma values(5000,20,100,1002,'seg-qua-sex manha');
insert into turma values(5001,20,101,1002,'seg-qua-sex manha');
insert into turma values(5002,20,102,1002,'seg-qua-sex manha');
insert into turma values(5003,20,103,1002,'seg-qua-sex manha');
insert into turma values(5004,20,104,1002,'seg-qua-sex manha');
insert into turma values(5005,20,105,1002,'seg-qua-sex manha');

insert into turma values(5006,40,100,1003,'ter-qui tarde');
insert into turma values(5007,40,102,1003,'ter-qui tarde');
insert into turma values(5008,40,103,1003,'ter-qui tarde');


insert into turma values(5009,10,101,1000,'ter-qui manha');
insert into turma values(5010,10,104,1000,'ter-qui manha');
insert into turma values(5011,10,105,1000,'ter-qui manha');

select * from turma;


create view v$turma as
 select a.nome,p.nome as professor,c.curso,t.horario
 from turma t
 inner join aluno a
 on a.idaluno = t.id_aluno
 inner join
 professor p
 on p.idprofessor = t. id_professor
 inner join curso c
 on c.idcurso = t.id_curso;

select * from v$turma;

create table situacaoaluno(idsituacao int primary key,
				nota1 float,
				nota2 float,
				id_turma int,
		foreign key(id_turma) references turma(idturma));

insert into situacaoaluno values (200,2.5,4.5,5000);
insert into situacaoaluno values (201,8,7,5001);
insert into situacaoaluno values (202,7.5,3.5,5002);
insert into situacaoaluno values (203,4,8,5003);


create view v$situacao as
 select a.nome,p.nome as professor, c.curso, s.nota1, s.nota2, (s.nota1 + s.nota2)/2 as media
 from situacaoaluno s
 inner join
 turma t
 on t.idturma = s.id_turma
 inner join aluno a
 on a.idaluno = t.id_aluno
 inner join
 professor p
 on p.idprofessor = t. id_professor
 inner join curso c
 on c.idcurso = t.id_curso;

select * from v$situacao;

-------------------------------------------------------------------------------------------------

create table vendas(idvendas int primary key,
			vendedor varchar(35),
			valor float,
			setor varchar(25));

insert into vendas values(1,'anny',4500,'inf');
insert into vendas values(2,'luan',2500,'inf');
insert into vendas values(3,'ana',500,'adm');
insert into vendas values(4,'cabelinho',8000,'eng');
insert into vendas values(5,'thiago',3500,'inf');

select * from vendas;

select max(valor) from vendas;
select min(valor) from vendas;
select sum(valor) from vendas;

select count(*) from vendas;
select count(*) as conta, setor from vendas group by setor;
select count(*) from vendas;
select sum(valor) as soma, setor from vendas group by setor;



			