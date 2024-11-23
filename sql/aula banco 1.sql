create database modelo1;
use modelo1;
create table pessoa(idpessoa int primary key,
			nome varchar (35),
			sexo enum('m','f'));

insert into pessoa values(1,'thiago','m'),
			(2, 'luanita','f'),
			(3,'etiene','f'),
			(4,'belem','m'),
			(5,'mauro','m');
			

create table cliente(idcliente int primary key,
			datacadastro date,
			email varchar (35) unique,
			id_pessoa int unique,
		foreign key(id_pessoa) references pessoa(idpessoa));

insert into cliente values (100,'2011-06-20','thiago@gmail.com',1),
			(101,'2011-06-20','sergio@gmail.com',3),
			(102,'2011-06-20','luan@gmail.com',2),
			(103,'2011-06-20','belem@gmail.com',4);


select * from pessoa;
delect idpessoa, nome from pessoa;
select idcliente,datacadastro, email, id_pessoa from cliente;
select * from cliente;

select p.nome, p.sexo, c.datacadastro, c.email
	from pessoa p
	inner join
	cliente c
on p.idpessoa = c.id_pessoa;

select p.nome, p.sexo, c.datacadastro, c.email
	from pessoa p
	left join
	cliente c
on p.idpessoa = c.id_pessoa;


create table fornecedor(idfornecedor int primary key,
			nome varchar(20),
			email varchar (30) unique);

create table produto(idproduto int primary key,
			produto varchar(25),
			marca varchar(25),
			preco double,
			id_fornecedor int not null,
		foreign key(id_fornecedor) references fornecedor(idfornecedor));

insert into fornecedor values (1,'Empresa A','aaaa@gmail.com'),
				(2,'Empresa B','beeeee@gmail.com');

select * from fornecedor;

insert into produto values (1,'Caneta','Bic',0.5,1),
			(2,'Mouse','Microsoft',40,2),
			(3,'Monitor','Sony',200,1),
			(4,'Notebook','Dell',1200,1),
			(5,'Caderno','Hanna Montana',10,1);
select * from produto;

select p.produto, p.marca, p.preco, f.nome, f.email
	from produto p
	inner join
	fornecedor f
	on f.idfornecedor = p.id_fornecedor;

create view vw_produtos
as
select p.produto, p.marca, p.preco, f.nome, f.email
	from produto p
	inner join
	fornecedor f
	on f.idfornecedor = p.id_fornecedor;

select * from vw_produtos order by preco asc;







Uma empresa deseja manter uma banco de dados com o cadastro de todos os seus funcionarios(id,nome e salario), É necessário que cada funcionario seja alocado em um departamento. Um departamaneto pode ter muitos funcionarios mas cada funcionario so podera estar alocado em um unico departamento (nao podem haver funcionarios sem departamento)

crie: tabelas, relacionamentos, visao com nome do funcionario, salario e departamento.

mostre: soma dos salarios, media dos salarios, quantidade de funcionarios.



create table departamento(iddepartamento int primary key, departamento varchar(25));

create table funcionario(idfuncionario int primary key, nome varchar(35), salario double, id_departamento int not null, foreign key(id_departamento) references departamento(iddepartamento));



insert into departamento values (1,'Informatica'),
			(2,'Quimica');

insert into funcionario values (1,'Etiene',5000,1),
				(2,'Adriano',500,2),
				(3,'Thyago',1200,1);

create view visao_bolsistas as
select f.nome, f.salario, d.departamento
from funcionario f
inner join
departamento d
on f.id_departamento = d.iddepartamento;

select sum(salario) from funcionario;
select avg(salario) from funcionario;
select count(*) from funcionario;