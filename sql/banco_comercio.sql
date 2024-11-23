create database comercio;

use comercio;

create table tipo_prod (
	cod_tipo int(5) not null auto_increment,
	desc_tipo varchar(50) not null,
	primary key(cod_tipo)
);

desc tipo_prod;

create table produtos (
	cod_prod int(5) not null auto_increment,
	desc_prod varchar(50) not null,
	cod_tipoprod int(5) not null,
	preco_prod decimal(16,2) not null,
	quant_prod int(4) not null,	
	primary key(cod_prod),
	foreign key(cod_tipoprod) references tipo_prod(cod_tipo)
);

desc produtos;

alter table produtos change quant_prod quantidade_prod int (5) not null;
	
desc produtos;

alter table produtos add vendido char(3)  not null after preco_prod;


alter table produtos drop vendido;

show tables;

insert into tipo_prod value (null, "Bebidas");

select * from tipo_prod;

drop table tipo_prod;

create index produto on produtos(desc_prod);

drop index produto on produtos;

show tables;

desc produtos;

desc tipo_prod;

select * from produtos;

select * from tipo_prod;

delete from tipo_prod where cod_tipo = 1;

desc tipo_prod;

insert into tipo_prod values (null, "Bebidas");
insert into tipo_prod values (null, "Higiene");
insert into tipo_prod values (null, "Alimentício");

select * from tipo_prod;

desc produtos;

insert into produtos values (null, "Arroz integral", 4, 5.40, 10);
insert into produtos values (null, "Arroz branco", 4, 4.70, 100);
insert into produtos values (null, "Sabonete", 3, 1.20, 500);

select * from produtos;

select * from tipo_prod;

update tipo_prod 
set desc_tipo = "Bebida" 
where cod_tipo = 2;

select * from produtos;

update produtos 
set desc_prod = "Feijão Preto", preco_prod = 3.50 
where cod_prod = 2;

delete from produtos 
where quantidade_prod <= 50;

select desc_prod, quantidade_prod from produtos;

select * from tipo_prod
group by desc_tipo asc;

select * from tipo_prod
group by desc_tipo desc;

select desc_prod, quantidade_prod 
from produtos
where quantidade_prod between 50 and 150;

select desc_prod, quantidade_prod, preco_prod
from produtos
where quantidade_prod >= 50 and quantidade_prod <= 150;

select AVG(preco_prod) as "media de precos" from produtos;

select SUM(preco_prod) as "soma dos precos" from produtos;

select MAX(preco_prod) as "maior preco" from produtos;

select MIN(preco_prod) as "menor preco" from produtos;

select MIN(quantidade_prod) as "menor quantidade" from produtos;

select count(cod_tipo) as "Total de tipos" from tipo_prod;

select desc_prod as "produto", desc_tipo as "tipo", preco_prod as "preco unitario", quantidade_prod as "estoque"
from produtos as p, tipo_prod as t
where p.cod_tipoprod = t.cod_tipo;

select desc_prod as "produto", desc_tipo as "tipo", preco_prod as "preco unitario", quantidade_prod as "estoque"
from produtos as p
inner join tipo_prod as t
on p.cod_tipoprod = t.cod_tipo;
