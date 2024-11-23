create database revenda;

use revenda;

create table marcas (
	marca_cod int(3) not null auto_increment,
	marca_desc varchar(35) not null,
	primary key (marca_cod)
);

show tables;

desc marcas;

insert into marcas values (null, "Fiat");
insert into marcas values (null, "Ford");
insert into marcas values (null, "Chevrolet");

select * from marcas;

create table modelos (
	modelo_cod int(3) not null auto_increment,
	modelo_desc varchar(35) not null,
	modelo_marca_cod int(3) not null,
	primary key(modelo_cod),
	foreign key(modelo_marca_cod) references marcas(marca_cod)
);

show tables;

desc modelos;

insert into modelos values (null, "Palio EX", 1);
insert into modelos values (null, "Celta 1.0", 3);
insert into modelos values (null, "Fiesta 1.0", 2);

select * from modelos;

create table clientes (
	cliente_cod int(4) not null,
	cliente_nome varchar(50) not null,
	cliente_endereco varchar(50) not null,
	cliente_bairro varchar(35) not null,
	cliente_cidade varchar(35) not null,
	cliente_cep varchar(9) not null,
	cliente_uf varchar(2) not null,
	cliente_telefone varchar(15),
	cliente_email varchar(50),
	cliente_datanasc date not null,
	cliente_sexo char(1) not null,
	primary key(cliente_cod)
);

show tables;

desc clientes;

insert into clientes values (1, "José dos Santos", "Rua das Flores, 485", "Centro", "Joinville", "89325-000", "SC", "(47)3461-0911", "", "1970/10/05", "M");  
insert into clientes values (2, "Maria dos Santos", "Rua das Neves, 500", "Brasilia", "Curitiba", "89670-000", "PR", "(41)3431-0900", "mariasantos@uol.com.br", "1975/07/25", "F");

select cliente_nome as "nome", cliente_bairro as "bairro" from clientes;


create table funcionarios (
	func_cod int(4) not null,
	func_nome varchar(50) not null,
	func_endereco varchar(50) not null,
	func_bairro varchar(35) not null,
	func_cidade varchar(35) not null,
	func_cep varchar(9) not null,
	func_uf varchar(2) not null,
	func_telefone varchar(15),
	func_email varchar(50),
	func_datanasc date not null,
	func_sexo char(1) not null,
	primary key(func_cod)
);

desc funcionarios;

insert into funcionarios values (1, "Sandra Torres", "Rua da Figueira, 20", "Centro", "Joinville", "89325-000", "SC", "(47)3432-0500", "sandrat@pop.com.br", "1965/08/30", "M");  
insert into funcionarios values (2, "Fabio da Silva", "Rua das Palmeiras, 45", "Centro", "Joinville", "89670-000", "SC", "(41)3439-0600", "", "1978/10/15", "M");

select func_nome as "Nome do Funcionario", func_bairro as "Bairro" from funcionarios;
	
create table veiculos (
	veiculo_placa varchar(8) not null,
	veiculo_modelo_cod int(3) not null,
	veiculo_ano int(4) not null,
	veiculo_preco decimal(16,2) not null,
	veiculo_cor varchar(35) not null,
	veiculo_combustivel varchar(35) not null,
	veiculo_km decimal(16,2) not null,
	veiculo_arcondicionado int(1),
	veiculo_vidroeletrico int(1),
	veiculo_vidroverde int(1),
	veiculo_airbag int(1),
	veiculo_travaeletrica int(1),
	veiculo_alarme int(1),
	veiculo_desembacador int(1),
	veiculo_rodaliga int(1),
	veiculo_volantehidraulico int(1),
	veiculo_arquente int(1),
	veiculo_freioabs int(1),
	veiculo_cambioaut int(1),
	veiculo_cdplayer int(1),
	veiculo_isufilm int(1),
	veiculo_limpadortraseiro int(1),
	veiculo_outros text,
	veiculo_vendido int(1),
	primary key(veiculo_placa),
	foreign key (veiculo_modelo_cod) references modelos (modelo_cod)
);

select * from modelos;

desc veiculos;

insert into veiculos values ("WAS-3030", 2, 2003, 18500, "Prata", "Gasolina", 89390.50, 1, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1, 0, "Possui MP3, Banco de Couro, 2.dono", 0);
insert into veiculos values ("VRE-4030", 1, 2003, 21000, "Branca", "Gasolina", 80390, 1, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1, 0, "Possui MP3, 1.dono", 0);
insert into veiculos values ("GRE-3118", 3, 2001, 13500, "Preta", "Gasolina", 120390, 1, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1, 0, "", 1);

select modelo_desc, veiculo_vendido, veiculo_preco, veiculo_ano
from modelos, veiculos
where modelo_cod=veiculo_modelo_cod
and veiculo_vendido = 0
and veiculo_preco >= 15000;


create table operacao (
	oper_cod int(5) not null,
	oper_placa varchar(8) not null,
	oper_funccod int(4) not null,
	oper_clientecod int(4) not null,
	oper_date date not null,
	oper_hora time not null,
	oper_tipo varchar(25),
	primary key(oper_cod),
	foreign key(oper_placa) references veiculos(veiculo_placa),
	foreign key(oper_funccod) references funcionarios(func_cod),
	foreign key(oper_clientecod) references clientes(cliente_cod)
);
	
insert into operacao values (1, "WAS-3030", 1, 1, "2007/12/05", "11:21", "Venda");

update veiculos set veiculo_vendido = 1 where veiculo_placa = "WAS-3030";

insert into operacao values (2, "VRE-4030", 2, 1, "2007/12/05", "11:25", "Venda");

update veiculos set veiculo_vendido = 1 where veiculo_placa = "VRE-4030";


select modelo_desc, veiculo_preco, veiculo_ano
from modelos, veiculos
where modelo_cod=veiculo_modelo_cod
and veiculo_vendido = 1;


desc operacao;

select oper_placa, oper_tipo, func_nome, cliente_nome
from operacao, funcionarios, clientes
where oper_funccod=func_cod
and oper_clientecod=cliente_cod
and oper_date="2007/12/05";










	







