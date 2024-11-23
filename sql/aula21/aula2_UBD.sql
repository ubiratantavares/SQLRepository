-- Um cadastro requer o nome, o e-mail e o sexo de um cliente.
-- Este cliente poderá, ou não, ter bens. Estes bens deverão ser descritos:
-- bem, tipo(movel, imovel) e valor.
-- Não existirá bem sem proprietario.

drop database aula2;
create database aula2;
use aula2;

create table cliente(
	codcliente 	int			primary key		auto_increment,
	nome		varchar(35)	not null,
	email		varchar(35)	not null unique,
	sexo		enum('m', 'f'));

desc cliente;

create table bens(
	codigo 		int			primary key		auto_increment,
	bem	    	varchar(35)	not null,
	tipo		enum('imovel', 'movel'),
	valor 		float		not null,
	cod_cliente	int			not null);

desc bens;

-- fk_bem é o nome da constraint(regra)
alter table bens add constraint fk_bem
foreign key(cod_cliente) references cliente(codcliente) on delete cascade;

desc bens; 

insert into cliente(nome, email, sexo) values('Wallace', 'walla@gmail.com', 'm');

insert into bens values(null, 'havaina', 'movel', 15, 1);

select * from cliente;
select * from bens;

select c.nome, b.bem from cliente c
	inner join bens b
	on c.codcliente = b.cod_cliente;
	
-- Função (plsql)
-- delimiter responsavel por alterar o caracter que determina o fim de um comando

delimiter $
drop function cadCliente$
create function cadCliente(pnome varchar(35), pemail varchar(35), psexo char(1))
	returns varchar(60)		
		begin
	
			insert into cliente values(null, pnome, pemail, psexo);
	
		return concat(pnome, ', cadastrado com sucesso!');
		end;
$		

select cadCliente('Carla', 'carla@gmail.com', 'f')$
select cadCliente('Luan', 'luanita@gmail.com', 'm') as CADASTRO$
select cadCliente('Jose', 'jose@uol.com', 'm') as CADASTRO$
select cadCliente('Anny', 'anny@aol.com', 'f') as CADASTRO$
select cadCliente('Bruno', 'bruno@gmail.com', 'm') as CADASTRO$
select cadCliente('Allan', 'allan@gmail.com', 'm') as CADASTRO$

select * from cliente$

create function cadBens(pbem varchar(35), ptipo varchar(10), pvalor float, pfk int)
	returns varchar(100)		
		begin
			declare vnome varchar(35);
	
			insert into bens values(null, pbem, ptipo, pvalor, pfk);
	
			select nome into vnome from cliente	where codcliente = pfk;
	
		return concat(vnome, ', cadastrou o bem: ', pbem);
		end;
$		

select cadBens('carro', 'movel', 40000, 3) as CADASTRO_DE_BENS$
select cadBens('apto', 	'imovel', 200000, 3) as cadastro$
select cadBens('carro', 'movel', 50000, 4) as cadastro$
select cadBens('gaiola', 'movel', 15, 1) as cadastro$
select cadBens('casa', 	'imovel', 150000, 6) as cadastro$
select cadBens('fazenda', 'imovel', 	450000, 4) as cadastro$
select cadBens('terreno abandonado', 'imovel', 150, 1) as cadastro$
select cadBens('moto', 	'movel', 19000, 6) as cadastro$
select cadBens('carroca', 'movel', 75, 1) as cadastro$
select cadBens('caminhao ', 'movel', 75000, 3) as cadastro$
select cadBens('barco', 'movel', 90000, 2) as cadastro$
select cadBens('notebook ', 'movel', 4000, 2) as cadastro$

delimiter ;

-- exibir a quantidade de clientes

select count(*) as Clientes from cliente;

-- exibir a quantidade de clientes separados por sexo

select sexo, count(*) as Total from cliente group by sexo;

-- exibir clientes, bens e valores

select c.nome, b.bem, b.valor from cliente c
	inner join bens b
	on c.codcliente = b.cod_cliente
	order by c.nome;

-- exibir clientes, bens e valores de pessoas de sexo feminino

select c.nome, b.bem, b.valor from cliente c
	inner join bens b
	on c.codcliente = b.cod_cliente
	where c.sexo = 'f'
	order by c.nome;

-- exibir clientes, bens e valores dos imoveis ordenando por sexo

select c.nome, b.bem, b.valor from cliente c
	inner join bens b
	on c.codcliente = b.cod_cliente
	where b.tipo = 'imovel'
	order by c.sexo;

-- exibir a quantidade de bens

select count(*) as Bens from bens;

-- exibir a quantidade de bens separando por tipo

select tipo, count(*) as Bens from bens group by tipo;

-- exibir a quantidade de bens separando por sexo

select c.sexo, count(b.bem) from cliente c
	inner join bens b 
	on c.codcliente = b.cod_cliente
	group by c.sexo;

-- exibir a quantidade de clientes pra cada tipo de bem

select b.tipo, count(c.nome) from cliente c
	inner join bens b 
	on c.codcliente = b.cod_cliente
	group by b.tipo;
	
-- Soma dos valores dos bens

select sum(valor) as SOMA from bens;

-- Media dos valores dos bens

select avg(valor) as MEDIA from bens;

-- Media formatada dos valores dos bens

select format(avg(valor), 2) as MEDIA from bens;

-- Maior valor entre os bens

select max(valor) as MAIS_CARO from bens;

-- Menor valor entre os bens

select min(valor) as MAIS_BARATO from bens;

-- A soma dos bens separadas por tipo

select tipo, sum(valor) from bens group by tipo; 

-- A Media dos bens separadas por tipo

select tipo, format(avg(valor),2) as MEDIA from bens group by tipo; 

-- A soma dos bens de cada cliente

select c.nome, sum(b.valor) as SOMA
	from cliente c 
	inner join bens b 
	on c.codcliente = b.cod_cliente
	group by c.nome;
	
-- O nome do cliente que tem o bem mais valioso junto com o valor do bem
-- subquery
select c.nome, b.valor as Maior
	from cliente c 
	inner join bens b 
	on c.codcliente = b.cod_cliente
	where b.valor = (select max(valor) from bens);	
	
-- Criando backup do banco

-- no prompt de comando chegar path de instalação do mysql

cd C:\Arquivos de programas\MySQL\MySQL Server 5.1\bin	

mysqldump -u root -p -B aula2 > c:\backup.txt 

-- Restaurar a partir de um backup

drop database aula2;

create database aula2;

mysql -u root -p -B aula2 < c:\backup.txt

use aula2;

show tables;

