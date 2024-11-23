create database aula6;
use aula6;

create table produto(idproduto int primary key,
			produto varchar(35),
			marca varchar(25),
			preco float);

create table vendedor(idvendedor int primary key,
			vendedor varchar(35),
			email varchar(35));

create table cliente(idcliente int primary key,
			nome varchar(35));

create table pedido(idpedido int primary key,
			id_produto int,
			id_vendedor int,
			datacompra date,
		foreign key(id_produto) references produto(idproduto),
		foreign key(id_vendedor) references vendedor(idvendedor));

create table itempedido(iditempedido int primary key,
			id_pedido int,
			id_cliente int,
			quantidade int,
		foreign key(id_pedido) references pedido(idpedido),
		foreign key(id_cliente) references cliente(idcliente));

insert into cliente values (10,'marcelo');
insert into cliente values (20,'kelly');
insert into cliente values (30,'fabio');

insert into produto values (100,'arroz','tio joao',3);
insert into produto values (101,'feijao','maximo',5);
insert into produto values (102,'açucar','Uniao',2);


insert into vendedor values (1000,'ana','ana@gmail.com');
insert into vendedor values (1001,'etiene','etiene@gmail.com');

insert into pedido values (200, 100, 1000,'2011-07-05');
insert into pedido values (201, 101, 1001,'2011-06-14');
insert into pedido values (202, 102, 1001,'2011-06-08');

insert into itempedido values (300,200,10,5);
insert into itempedido values (301,201,10,15);
insert into itempedido values (302,202,10,205);


select * from produto;
select * from vendedor;
select * from cliente;
select * from pedido;
select * from itempedido;

create view v$mercadorias as
 select c.nome, p.produto, p.marca, p.preco, v.vendedor, ped.datacompra, item.quantidade
 from itempedido item
 inner join
 pedido ped
 on ped.idpedido = item.id_pedido
 inner join
 cliente c
 on c.idcliente = item.id_cliente
 inner join
 produto p
 on p.idproduto = ped.id_produto
 inner join
 vendedor v
 on v.idvendedor = ped.id_vendedor;

select * from v$mercadorias;

select nome , produto, sum(preco*quantidade) as total from v$mercadorias
 group by nome, produto with rollup;




create table funcionario(idfuncionario int primary key,
	nome varchar(25) not null,
	salario float);

insert into funcionario values (1,'vanessa',1500);
insert into funcionario values (2,'kelly',1200);
insert into funcionario values (3,'sergio b',1000);

drop trigger gatilho_funcionario;
delimiter $
create trigger gatilho_funcionario
 before update on funcionario
 for each row
 begin
	if new.salario <old.salario then
		update funcionario set salario=salario where idfuncionario=new.idfuncionario;	
	end if;
end;
$
delimiter ;

update funcionario set salario=800 where idfuncionario=3;




# aprendendo a normalizar

# eis um tabelao escroto

create table coti(idcurso int primary key, nome varchar(35), telefone varchar(20), endereco varchar(35), funcao varchar(35), salario float);

#o nome da tavela é um nome de banco
#os atributos nao podem sser multi valorados ou ter vetor
#uma coluna jamais pode representar o total


#1a forma normal

create table professor(idprofessor int primary key, nome varchar(35), funcao varchar(35), salario float);

create table telefone (idtelefone int primary key, numero varchar(15), tipo varchar(15), id_professor int,
	foreign key(id_professor) references professor(idprofessor));

create table endereco(idendereco int primary key, bairro varchar(35), cidade varchar(35), cidade varchar(35), estado varchar(2), id_professor int,
	foreign key(id_professor) references professor(idprofessor));


#2a forma normal
drop table if exists endereço;
drop table if exists telefone;
drop table if exists professor;

create table professor(idprofessor int primary key, nome varchar(35);

create table pagamento(idpagamento int primary key, funcao varchar(35), salario float, id_professor int,
	foreign key(id_professor) references professor(idprofessor);



create table telefone (idtelefone int primary key, numero varchar(15), tipo varchar(15), id_professor int,
	foreign key(id_professor) references professor(idprofessor));

create table endereco(idendereco int primary key, bairro varchar(35), cidade varchar(35), cidade varchar(35), estado varchar(2), id_professor int,
	foreign key(id_professor) references professor(idprofessor));




#autorelacionamento

drop table if exists empregado;

create table empregado(idempregado int primary key,
			nome varchar(35),
			sexo enum('m','f'),
			salario float,
			nivel int.
			id_empregado int,
	foreign key(id_empregado) references empregado(idemrpegado));

insert into empregado values(100,'sergio a','m',15000,1,null);
insert into empregado values(101,'martin','m',15000,2,1);


EXERCÍCIOS

1) modelar todas as tabelas feitas na aula de hoje
2) modelar uma cesta de compras