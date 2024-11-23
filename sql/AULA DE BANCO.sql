
	--------------------------------------------------------------
	--PARTE 1 -> MODELAGEM E CONSULTAS SQL
	--------------------------------------------------------------

	drop database if exists aula08;
	create database aula08;
	use aula08;

	create table cliente(
		idcliente	integer		auto_increment,
		nome		varchar(35)	not null,
		email		varchar(25)	not null,
		primary key(idcliente));

	create table produto(
		idproduto	integer		auto_increment,
		nome		varchar(35)	not null,
		preco		double		not null,
		primary key(idproduto));
	
	insert into cliente(nome,email) values('Cid','cid@gmail.com');	
	insert into cliente(nome,email) values('Dayse','dayse@gmail.com');	
	insert into cliente(nome,email) values('Carvi','carvi@gmail.com');	
	
	insert into produto(nome,preco) values('Notebook',2000);
	insert into produto(nome,preco) values('Impressora',300);
	insert into produto(nome,preco) values('Mouse',50);
	insert into produto(nome,preco) values('Monitor',200);

	select * from cliente;
	select * from produto;

	create table pedido(
		idpedido	integer		auto_increment,
		datapedido	date		not null,
		idcliente	integer		not null,
		primary key(idpedido));

	alter table pedido add constraint fk_pedidocliente
	foreign key(idcliente) references cliente(idcliente);

	insert into pedido(datapedido, idcliente) values(now(), 1);
	insert into pedido(datapedido, idcliente) values(now(), 2);

	select * from pedido;

	create table itempedido(
		iditempedido	integer		auto_increment,
		idpedido	integer		not null,
		idproduto	integer		not null,
		primary key(iditempedido));

	ALTER TABLE itempedido ADD CONSTRAINT fk_item_pedido
	FOREIGN KEY(idpedido) REFERENCES pedido(idpedido);

	ALTER TABLE itempedido ADD CONSTRAINT fk_item_produto
	FOREIGN KEY(idproduto) REFERENCES produto(idproduto);

	INSERT INTO itempedido VALUES(null,1,1);
	INSERT INTO itempedido VALUES(null,1,2);
	INSERT INTO itempedido VALUES(null,1,3);
	INSERT INTO itempedido VALUES(null,2,4);
	INSERT INTO itempedido VALUES(null,2,2);

	SELECT * FROM itempedido;

	select
	   date_format(p.datapedido, '%W %d %M %Y') as datapedido,
	   c.idcliente,
	   c.nome,
	   c.email
	from cliente c
	inner join pedido p
	on c.idcliente = p.idcliente;

	
	select 
	   it.iditempedido,
	   pe.idpedido,
	   pe.datapedido,
	   pd.nome,
	   pd.preco
	from itempedido it
	inner join pedido pe
	on it.idpedido = pe.idpedido
	inner join produto pd
	on it.idproduto = pd.idproduto;		

	
	--quantidade de produtos por pedido
	select
	   pe.idpedido,
	   pe.datapedido,
	   count(it.idproduto) as "Qtd Produtos"
	from pedido pe
	inner join itempedido it
	on pe.idpedido = it.idpedido
	group by	
		pe.idpedido, 
		pe.datapedido;

	
	--total de cada pedido (valor)
	select
	   pe.idpedido,
	   pe.datapedido,
	   cl.nome,
	   cl.email,
	   sum(pd.preco) as "Valor Total"
	from cliente cl
	inner join pedido pe
	on cl.idcliente = pe.idcliente
	inner join itempedido it
	on pe.idpedido = it.idpedido
	inner join produto pd
	on it.idproduto = pd.idproduto
	group by
		pe.idpedido,
	   	pe.datapedido,
	   	cl.nome,
	   	cl.email;


	--VIEW

	--drop view vwpedido;

	create view vwpedido as 
	select
	   pe.idpedido,
	   pe.datapedido,
	   cl.nome,
	   cl.email,
	   sum(pd.preco) as total
	from cliente cl
	inner join pedido pe
	on cl.idcliente = pe.idcliente
	inner join itempedido it
	on pe.idpedido = it.idpedido
	inner join produto pd
	on it.idproduto = pd.idproduto
	group by
		pe.idpedido,
	   	pe.datapedido,
	   	cl.nome,
	   	cl.email;
	   

	select * from vwpedido;	

	

	--------------------------------------------------------------
	--PARTE 2 -> EXPORTAÇÃO E IMPORTAÇÃO DE DADOS
	--------------------------------------------------------------

	delimiter $
	
	select * into outfile 'c:/produtos.txt'
	fields terminated by ';' 
	lines  terminated by '\n'
	from produto
	$	

	create table produtobackup 
	as select * from produto
	$

	desc produtobackup
	$

	select * from produtobackup
	$

	load data infile 'c:/produtos.txt' 
	into table produtobackup
	fields terminated by ';' 
	lines  terminated by '\n'
	$
	
	select * from produtobackup
	$



	--------------------------------------------------------------
	--PARTE 3 -> PROCEDURES E VARIAVEIS
	--------------------------------------------------------------
	
	--drop procedure operacao$

	create procedure operacao(opcao int)
	begin
		case opcao
			when 1 then select sum(total) as total from vwpedido;
			when 2 then select avg(total) as media from vwpedido;
			when 3 then select max(total) as maximo from vwpedido;
			when 4 then select min(total) as minimo from vwpedido;
		end case;
	end
	$


	call operacao(1)
	$
	
		

	--Variável no MySQL
	
	set @nome := 'Sergio Mendes'
	$

	select @nome$


	select nome into @nome from produto where idproduto = 1$

	select @nome$

   	   
	set @cliente := ''$
	set @email   := ''$

			
	select nome, email into @cliente, @email
	from cliente
	where idcliente = 1
	$

	
	--drop procedure imprimir$

	create procedure imprimir()
	begin
		select @cliente;
		select @email;
	end
	$

	call imprimir()$


	
	--------------------------------------------------------------
	--PARTE 4 -> EXPORTAÇÃO DO BANCO DE DADOS
	--------------------------------------------------------------
	
	
	--Backup do banco (TODO!!)

	--Acessar o caminho:
	cd\
	cd C:\Arquivos de programas\MySQL\MySQL Server 5.0\bin

	mysqldump -u root -p -B aula > c:\dump.txt	



	--------------------------------------------------------------
	--PARTE 5 -> CRIAÇÃO DE USUÁRIOS
	--------------------------------------------------------------

	--CRIAÇÂO DE USUARIO

	
	grant select on aula.*
	to estagiario@localhost
	identified by '123'
	$
	
	
	PERMISSOES
		select
		update
		insert
		delete
		create
		drop

	
	exit

	
	cd\
	cd C:\Arquivos de programas\MySQL\MySQL Server 5.0\bin

	mysql -u estagiario -p

	use aula;


	grant select, insert, update on aula.*
	to xara@localhost
	identified by 'viado';

	
	--USUARIO (P* das galáxias)

	grant all privileges on *.*
	to sergio@localhost
	identified by '999';

	









	