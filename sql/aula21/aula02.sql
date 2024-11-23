create database aula2;
use aula2;

--Em procedures, mudamos o delimiter, para o (;) 
--nao parar no meio da programação

delimiter $

--Mudando o delimiter para $

create procedure somar()
	begin
	
		select 9 + 16 as SOMA;
	
	end;
$

--Criando a procedure

call somar()$

--Chamando a procedure

mysql> create database aula2;
Query OK, 1 row affected (0.05 sec)

mysql> use aula2;
Database changed
mysql> delimiter $
mysql> create procedure somar()
    ->  begin
    ->
    ->          select 9 + 16 as SOMA;
    ->
    ->  end;
    -> $
Query OK, 0 rows affected (0.08 sec)

mysql> call somar()$
+------+
| SOMA |
+------+
|   25 |
+------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

create procedure somar2(n1 int, n2 int)
	begin
	
		select n1 + n2 as SOMA;
	
	end;
$

--Criando a procedure

call somar2(10,10)$

--Chamando a procedure

Query OK, 0 rows affected (0.00 sec)

mysql> create procedure somar2(n1 int, n2 int)
    ->  begin
    ->
    ->          select n1 + n2 as SOMA;
    ->
    ->  end;
    -> $
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> call somar2(10,10)$
+------+
| SOMA |
+------+
|   20 |
+------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

--CRIANDO UMA FUNCTION
--Quando se cria uma função, soumos obrigados
--a declarar o tipo de retorno
--As variaveis globais, todo o banco tem acesso,
--porem as variaveis dentro da function, so tem
--validade enqto a function roda

create function msg(nome varchar(20))
	returns varchar(50)
	begin
		declare mensagem varchar(50);
		
		set mensagem = concat('Bem vindo ao Mysql ' , nome);
		
		return mensagem;
	
	end;
	$
--Entrando com parametro na function
select msg('Felipe')$

mysql> drop function msg$
Query OK, 0 rows affected (0.08 sec)

mysql> create function msg(nome varchar(20))
    ->  returns varchar(50)
    ->  begin
    ->          declare mensagem varchar(50);
    ->
    ->          set mensagem = concat('Bem vindo ao Mysql ,' , nome);
    ->
    ->          return mensagem;
    ->
    ->  end;
    ->  $
Query OK, 0 rows affected (0.00 sec)

mysql> select msg('Felipe')$
+---------------------------+
| msg('Felipe')             |
+---------------------------+
| Bem vindo ao Mysql, Felipe|
+---------------------------+
1 row in set (0.00 sec)

set @msg_alta := upper(msg('Felipe'))$

select @msg_alta$

mysql> set @msg_alta := upper(msg('Felipe'))$
Query OK, 0 rows affected (0.03 sec)

mysql> select @msg_alta$
+---------------------------+
| @msg_alta                 |
+---------------------------+
| BEM VINDO AO MYSQL FELIPE |
+---------------------------+
1 row in set (0.00 sec)

----------------------------------------

create table pessoa(
	idpessoa int primary key,
	nome varchar(35) not null,
	idade int not null,
	endereco varchar(255) not null

)$


insert into pessoa values(1, 'Mafra', '42', 'Rua Aquela' 'cidade qq uma');
insert into pessoa values(2, 'Indio', '32', 'Aldeia' 'Cid das Ocas');
insert into pessoa values(3, 'Fashion', '22', 'Rua qualquer' 'cidade de deus');
insert into pessoa values(4, 'Miriam', '32', 'Rua Belford' 'Rio de Janeiro');

mysql> select * from tabela;
ERROR 1146 (42S02): Table 'aula2.tabela' doesnt exist
mysql> select * from pessoa;
+----------+---------+-------+----------------------------+
| idpessoa | nome    | idade | endereco                   |
+----------+---------+-------+----------------------------+
|        1 | Mafra   |    42 | Rua Aquelacidade qq uma    |
|        2 | Indio   |    32 | AldeiaCid das Ocas         |
|        3 | Fashion |    22 | Rua qualquercidade de deus |
|        4 | Miriam  |    32 | Rua BelfordRio de Janeiro  |
+----------+---------+-------+----------------------------+
4 rows in set (0.02 sec)

--TEMOS A COLUNA ENDEREÇO MULTIVALORADA

drop table pessoa;

create table pessoa(
	idpessoa int primary key auto_increment,
	nome varchar(35) not null,
	idade int not null

);

desc pessoa;

mysql> desc pessoa;
+----------+-------------+------+-----+---------+----------------+
| Field    | Type        | Null | Key | Default | Extra          |
+----------+-------------+------+-----+---------+----------------+
| idpessoa | int(11)     | NO   | PRI | NULL    | auto_increment |
| nome     | varchar(35) | NO   |     | NULL    |                |
| idade    | int(11)     | NO   |     | NULL    |                |
+----------+-------------+------+-----+---------+----------------+
3 rows in set (0.01 sec)

create table endereco(
	idendereco int primary key auto_increment,
	rua VARCHAR(60) not null,
	cidade VARCHAR(60) not NULL,
	estado enum('RJ','SP','MG') not null,
	id_pessoa int not null unique,
	FOREIGN KEY(id_pessoa) REFERENCES pessoa(idpessoa)
	on DELETE CASCADE
	
);

--A CHAVE ESTRANGEIRA FK (id_pessoa) se refere a tabela
--ao campo idpessoa, da tabela pessoa pessoa(idpessoa)
--o on delete CASCADE é para qdo uma pessoa for deletada
--o endereço ser deletado tambem.

mysql> desc endereco;
+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| idendereco | int(11)     | NO   | PRI | NULL    | auto_increment |
| rua        | varchar(60) | NO   |     | NULL    |                |
| cidade     | varchar(60) | NO   |     | NULL    |                |
| estado     | char(2)     | NO   |     | NULL    |                |
| id_pessoa  | int(11)     | NO   | UNI | NULL    |                |
+------------+-------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

delimiter $

create function CadPessoa(pnome varchar(20), pidade int)
	returns varchar(40)
	begin
				
		insert into pessoa(nome,idade) values(pnome, pidade);
		
		return 'Cadastrado com sucesso';
	
	end;
	$
	
select CadPessoa('Mafra',30)$
select CadPessoa('Miriam',32) as CADASTRO$
select CadPessoa('Julia',5) as CADASTRO$
select CadPessoa('Emidio',46) as CADASTRO$
select CadPessoa('Paula',42) as CADASTRO$


--Para saber a qtde de registros na tabela.
delimiter ;
select count(idpessoa) from pessoa;
--Soma uma coluna
select sum(idade) as Soma from pessoa;
--Media de uma coluna
select avg(idade) as Media_Idade from pessoa;
--Media de uma coluna com uma casa decimal
select format(avg(idade),1) as Media_Idade from pessoa;

mysql> select count(idpessoa) from pessoa;
+-----------------+
| count(idpessoa) |
+-----------------+
|               5 |
+-----------------+
1 row in set (0.00 sec)

mysql> select sum(idade) as Soma from pessoa;
+------+
| Soma |
+------+
|  155 |
+------+
1 row in set (0.00 sec)

mysql> select avg(idade) as Media_Idade from pessoa;
+-------------+
| Media_Idade |
+-------------+
|     31.0000 |
+-------------+
1 row in set (0.00 sec)

mysql> select format(avg(idade),1) as Media_Idade from pessoa;
+-------------+
| Media_Idade |
+-------------+
| 31.0        |
+-------------+
1 row in set (0.00 sec)


delimiter $

create function CadEndereco(erua varchar(30), ecidade varchar(30),
							eestado varchar(2), eidpessoa int)
	returns varchar(40)
	begin
				
		insert into endereco(rua,cidade,estado,id_pessoa) values(erua, ecidade, eestado,eidpessoa);
		
		return 'Endereco com sucesso';
	
	end;
	$
	
delimiter ;

select CadEndereco('Rua Riachuelo','Rio de Janeiro', 'RJ',1);
select CadEndereco('Rua Belford Roxo','Rio de Janeiro', 'RJ',2);
select CadEndereco('Rua das Ocas','Rio de Janeiro', 'SP',3);
select CadEndereco('Rua Gomes Freire','Rio de Janeiro', 'RJ',4);
select CadEndereco('Rua Oscar Cury','Minas Gerais', 'MG',5);

------FUNCAO CRIADA PELO WALLACE QUE RETORNA O NOME DA
--PESSOA QUE TEVE O ENDERECO CADASTRADO

create function CadEnd(prua varchar(30),
						pcidade varchar(20),
						pestado varchar(2),
						pfk int)
		returns varchar(70)
		BEGIN
			declare vnome varchar(35);
				insert into endereco values(null, prua, pcidade, pestado, pfk);
				
			select nome into vnome from pessoa where idpessoa = pfk;
			return concat('Endereco de ', vnome, ' cadastrado com sucesso');
			
		end;
	$

select CadPessoa('Janaina',70) as CADASTRO$
select CadPessoa('Andreia',42) as CADASTRO$
	
select CadEnd('Rua Mouro','Rio de Janeiro', 'RJ',6)$
select CadEnd('Rua Otto','Minas Gerais', 'MG',7)$

mysql> select CadEnd('Rua Mouro','Rio de Janeiro', 'RJ',6);
    -> $
+----------------------------------------------+
| CadEnd('Rua Mouro','Rio de Janeiro', 'RJ',6) |
+----------------------------------------------+
| Endereco de Janaina cadastrado com sucesso   |
+----------------------------------------------+
1 row in set (0.02 sec)

mysql> select CadEnd('Rua Otto','Minas Gerais', 'MG',7)$
+--------------------------------------------+
| CadEnd('Rua Otto','Minas Gerais', 'MG',7)  |
+--------------------------------------------+
| Endereco de Andreia cadastrado com sucesso |
+--------------------------------------------+
1 row in set (0.00 sec)

--EXERCICIO - TENTAR RETORNAR O NOME NA MENSAGEM


create function CadPessoa3(pnome varchar(20), pidade int)
	returns varchar(40)
	begin
		
		insert into pessoa(nome,idade) values(pnome, pidade);
		
				
		return concat('Pessoa ', pnome,' cadastrado com sucesso!');
	
	end;
	$
	
select CadPessoa3('Mario', 68) as CADASTRO_DE_PESSOA$
	
--agrupando por estado
select count(estado) from endereco;
select estado, count(estado) from endereco group by estado;

--Funcao para cadastrar USER e ENDERECO

create function Total(pnome varchar(20), pidade int)
	returns varchar(40)
	begin
		
		insert into pessoa(nome,idade) values(pnome, pidade);
		
				
		return concat('Pessoa ', pnome,' cadastrado com sucesso!');
	
	end;
	$
	
select CadEnd('Rua General','Sao Paulo', 'SP',8)$
select CadEnd('Rua Dez','Minas Gerais', 'MG',9)$
select CadEnd('Rua Olaria','Sao Paulo', 'SP',11)$
select CadEnd('Rua Tigres','Sao Paulo', 'SP',10)$
	
--CONSULTAS ANALITICAS -- JUNTA 2 OU MAIS TABELAS

select p.nome, e.rua, e.cidade from pessoa p, endereco e;

mysql> select p.nome, e.rua, e.cidade from pessoa p, end
    -> $
+---------+------------------+----------------+
| nome    | rua              | cidade         |
+---------+------------------+----------------+
| Mafra   | Rua Riachuelo    | Rio de Janeiro |
| Miriam  | Rua Riachuelo    | Rio de Janeiro |
| Julia   | Rua Riachuelo    | Rio de Janeiro |
| Emidio  | Rua Riachuelo    | Rio de Janeiro |
| Paula   | Rua Riachuelo    | Rio de Janeiro |
| Janaina | Rua Riachuelo    | Rio de Janeiro |
| Andreia | Rua Riachuelo    | Rio de Janeiro |
| Lidiane | Rua Riachuelo    | Rio de Janeiro |
| Liliane | Rua Riachuelo    | Rio de Janeiro |
| Joao    | Rua Riachuelo    | Rio de Janeiro |
| Mario   | Rua Riachuelo    | Rio de Janeiro |
| Mafra   | Rua Belford Roxo | Rio de Janeiro |
| Miriam  | Rua Belford Roxo | Rio de Janeiro |
| Julia   | Rua Belford Roxo | Rio de Janeiro |
| Emidio  | Rua Belford Roxo | Rio de Janeiro |
| Paula   | Rua Belford Roxo | Rio de Janeiro |
| Janaina | Rua Belford Roxo | Rio de Janeiro |
| Andreia | Rua Belford Roxo | Rio de Janeiro |
| Lidiane | Rua Belford Roxo | Rio de Janeiro |
| Liliane | Rua Belford Roxo | Rio de Janeiro |
| Joao    | Rua Belford Roxo | Rio de Janeiro |
| Mario   | Rua Belford Roxo | Rio de Janeiro |
| Mafra   | Rua das Ocas     | Rio de Janeiro |
| Miriam  | Rua das Ocas     | Rio de Janeiro |
| Julia   | Rua das Ocas     | Rio de Janeiro |
| Emidio  | Rua das Ocas     | Rio de Janeiro |
| Paula   | Rua das Ocas     | Rio de Janeiro |
| Janaina | Rua das Ocas     | Rio de Janeiro |
| Andreia | Rua das Ocas     | Rio de Janeiro |
| Lidiane | Rua das Ocas     | Rio de Janeiro |
| Liliane | Rua das Ocas     | Rio de Janeiro |
| Joao    | Rua das Ocas     | Rio de Janeiro |
| Mario   | Rua das Ocas     | Rio de Janeiro |
| Mafra   | Rua Gomes Freire | Rio de Janeiro |
| Miriam  | Rua Gomes Freire | Rio de Janeiro |
| Julia   | Rua Gomes Freire | Rio de Janeiro |
| Emidio  | Rua Gomes Freire | Rio de Janeiro |
| Paula   | Rua Gomes Freire | Rio de Janeiro |
| Janaina | Rua Gomes Freire | Rio de Janeiro |
| Andreia | Rua Gomes Freire | Rio de Janeiro |
| Lidiane | Rua Gomes Freire | Rio de Janeiro |
| Liliane | Rua Gomes Freire | Rio de Janeiro |
| Joao    | Rua Gomes Freire | Rio de Janeiro |
| Mario   | Rua Gomes Freire | Rio de Janeiro |
| Mafra   | Rua Oscar Cury   | Minas Gerais   |
| Miriam  | Rua Oscar Cury   | Minas Gerais   |
| Julia   | Rua Oscar Cury   | Minas Gerais   |
| Emidio  | Rua Oscar Cury   | Minas Gerais   |
| Paula   | Rua Oscar Cury   | Minas Gerais   |
| Janaina | Rua Oscar Cury   | Minas Gerais   |
| Andreia | Rua Oscar Cury   | Minas Gerais   |
| Lidiane | Rua Oscar Cury   | Minas Gerais   |
| Liliane | Rua Oscar Cury   | Minas Gerais   |
| Joao    | Rua Oscar Cury   | Minas Gerais   |
| Mario   | Rua Oscar Cury   | Minas Gerais   |
| Mafra   | Rua Mouro        | Rio de Janeiro |
| Miriam  | Rua Mouro        | Rio de Janeiro |
| Julia   | Rua Mouro        | Rio de Janeiro |
| Emidio  | Rua Mouro        | Rio de Janeiro |
| Paula   | Rua Mouro        | Rio de Janeiro |
| Janaina | Rua Mouro        | Rio de Janeiro |
| Andreia | Rua Mouro        | Rio de Janeiro |
| Lidiane | Rua Mouro        | Rio de Janeiro |
| Liliane | Rua Mouro        | Rio de Janeiro |
| Joao    | Rua Mouro        | Rio de Janeiro |
| Mario   | Rua Mouro        | Rio de Janeiro |
| Mafra   | Rua Otto         | Minas Gerais   |
| Miriam  | Rua Otto         | Minas Gerais   |
| Julia   | Rua Otto         | Minas Gerais   |
| Emidio  | Rua Otto         | Minas Gerais   |
| Paula   | Rua Otto         | Minas Gerais   |
| Janaina | Rua Otto         | Minas Gerais   |
| Andreia | Rua Otto         | Minas Gerais   |
| Lidiane | Rua Otto         | Minas Gerais   |
| Liliane | Rua Otto         | Minas Gerais   |
| Joao    | Rua Otto         | Minas Gerais   |
| Mario   | Rua Otto         | Minas Gerais   |
| Mafra   | Rua General      | Sao Paulo      |
| Miriam  | Rua General      | Sao Paulo      |
| Julia   | Rua General      | Sao Paulo      |
| Emidio  | Rua General      | Sao Paulo      |
| Paula   | Rua General      | Sao Paulo      |
| Janaina | Rua General      | Sao Paulo      |
| Andreia | Rua General      | Sao Paulo      |
| Lidiane | Rua General      | Sao Paulo      |
| Liliane | Rua General      | Sao Paulo      |
| Joao    | Rua General      | Sao Paulo      |
| Mario   | Rua General      | Sao Paulo      |
| Mafra   | Rua Dez          | Minas Gerais   |
| Miriam  | Rua Dez          | Minas Gerais   |
| Julia   | Rua Dez          | Minas Gerais   |
| Emidio  | Rua Dez          | Minas Gerais   |
| Paula   | Rua Dez          | Minas Gerais   |
| Janaina | Rua Dez          | Minas Gerais   |
| Andreia | Rua Dez          | Minas Gerais   |
| Lidiane | Rua Dez          | Minas Gerais   |
| Liliane | Rua Dez          | Minas Gerais   |
| Joao    | Rua Dez          | Minas Gerais   |
| Mario   | Rua Dez          | Minas Gerais   |
| Mafra   | Rua Olaria       | Sao Paulo      |
| Miriam  | Rua Olaria       | Sao Paulo      |
| Julia   | Rua Olaria       | Sao Paulo      |
| Emidio  | Rua Olaria       | Sao Paulo      |
| Paula   | Rua Olaria       | Sao Paulo      |
| Janaina | Rua Olaria       | Sao Paulo      |
| Andreia | Rua Olaria       | Sao Paulo      |
| Lidiane | Rua Olaria       | Sao Paulo      |
| Liliane | Rua Olaria       | Sao Paulo      |
| Joao    | Rua Olaria       | Sao Paulo      |
| Mario   | Rua Olaria       | Sao Paulo      |
| Mafra   | Rua Tigres       | Sao Paulo      |
| Miriam  | Rua Tigres       | Sao Paulo      |
| Julia   | Rua Tigres       | Sao Paulo      |
| Emidio  | Rua Tigres       | Sao Paulo      |
| Paula   | Rua Tigres       | Sao Paulo      |
| Janaina | Rua Tigres       | Sao Paulo      |
| Andreia | Rua Tigres       | Sao Paulo      |
| Lidiane | Rua Tigres       | Sao Paulo      |
| Liliane | Rua Tigres       | Sao Paulo      |
| Joao    | Rua Tigres       | Sao Paulo      |
| Mario   | Rua Tigres       | Sao Paulo      |
+---------+------------------+----------------+
121 rows in set (0.00 sec)

select p.nome, e.rua, e.cidade from pessoa p, endereco e where
 p.idpessoa = e.id_pessoa;
 
     -> $
+---------+------------------+----------------+
| nome    | rua              | cidade         |
+---------+------------------+----------------+
| Mafra   | Rua Riachuelo    | Rio de Janeiro |
| Miriam  | Rua Belford Roxo | Rio de Janeiro |
| Julia   | Rua das Ocas     | Rio de Janeiro |
| Emidio  | Rua Gomes Freire | Rio de Janeiro |
| Paula   | Rua Oscar Cury   | Minas Gerais   |
| Janaina | Rua Mouro        | Rio de Janeiro |
| Andreia | Rua Otto         | Minas Gerais   |
| Lidiane | Rua General      | Sao Paulo      |
| Liliane | Rua Dez          | Minas Gerais   |
| Joao    | Rua Tigres       | Sao Paulo      |
| Mario   | Rua Olaria       | Sao Paulo      |
+---------+------------------+----------------+
11 rows in set (0.00 sec)

--JOINS
--Inner Join - Esq = Direito
--Left Join - Esq = Direito + toda tabela esquerda
--Right Join - Esq = Direito + toda tabela direita
-- cross join - traz a diferença.

select p.nome,
		e.rua,
		e.cidade,
		e.estado
		from pessoa p
		inner join endereco e
		where p.idpessoa = e.id_pessoa;
		
+---------+------------------+----------------+--------+
| nome    | rua              | cidade         | estado |
+---------+------------------+----------------+--------+
| Mafra   | Rua Riachuelo    | Rio de Janeiro | RJ     |
| Miriam  | Rua Belford Roxo | Rio de Janeiro | RJ     |
| Julia   | Rua das Ocas     | Rio de Janeiro | SP     |
| Emidio  | Rua Gomes Freire | Rio de Janeiro | RJ     |
| Paula   | Rua Oscar Cury   | Minas Gerais   | MG     |
| Janaina | Rua Mouro        | Rio de Janeiro | RJ     |
| Andreia | Rua Otto         | Minas Gerais   | MG     |
| Lidiane | Rua General      | Sao Paulo      | SP     |
| Liliane | Rua Dez          | Minas Gerais   | MG     |
| Joao    | Rua Tigres       | Sao Paulo      | SP     |
| Mario   | Rua Olaria       | Sao Paulo      | SP     |
+---------+------------------+----------------+--------+
11 rows in set (0.00 sec)

--COLOCANDO CONDIÇOES NO JOIN

select p.nome,
		e.rua,
		e.cidade,
		e.estado
		from pessoa p
		inner join endereco e
		on p.idpessoa = e.id_pessoa
		where p.nome = 'Mafra';

+-------+---------------+----------------+--------+
| nome  | rua           | cidade         | estado |
+-------+---------------+----------------+--------+
| Mafra | Rua Riachuelo | Rio de Janeiro | RJ     |
+-------+---------------+----------------+--------+
1 row in set (0.00 sec)

select p.nome,
		e.rua,
		e.cidade,
		e.estado
		from pessoa p
		inner join endereco e
		on p.idpessoa = e.id_pessoa
		where e.estado = 'RJ';

+---------+------------------+----------------+--------+
| nome    | rua              | cidade         | estado |
+---------+------------------+----------------+--------+
| Mafra   | Rua Riachuelo    | Rio de Janeiro | RJ     |
| Miriam  | Rua Belford Roxo | Rio de Janeiro | RJ     |
| Emidio  | Rua Gomes Freire | Rio de Janeiro | RJ     |
| Janaina | Rua Mouro        | Rio de Janeiro | RJ     |
+---------+------------------+----------------+--------+

--PARA QUE O CADASTRO DE PESSOA E ENDERECO ACONTECA
--NO MEMSO MOMENTO, CRIAMOS UMA FUNCAO
--O SET FAZ A MESMA COISA Q O INTO, POREM, O INTO
--SO PODE SER USADO DENTRO DE UMA FUNCTION
--Declaro uma variavel para armazenar a VFK

create function cadastro(pnome VARCHAR(35), pidade int, 
						prua varchar(35), pcidade VARCHAR(35),
						pestado varchar(2))
	returns varchar(50)
		BEGIN
		
			declare vfk int; 
			
			insert into pessoa values(null,pnome, pidade);
			
			select last_insert_id() into vfk;			
			
			insert into endereco values(null, prua, pcidade, pestado, vfk);
		
		return concat('Cadastro da pessoa ', pnome, ' realizado com sucesso');
		end;
		$

select cadastro('Adilio', 33, 'Rua do Mundial', 'Rio de Janeiro', 'RJ')
as CADASTRO_DE_PESSOA;

+--------------------------------+
| CADASTRO_DE_PESSOA             |
+--------------------------------+
| Cadastro realizado com sucesso |
+--------------------------------+
1 row in set (0.00 sec)

select cadastro('Junior', 33, 'Rua do Penta', 'Rio de Janeiro', 'RJ')
as CADASTRO_DE_PESSOA;

+-------------------------------------------------+
| CADASTRO_DE_PESSOA                              |
+-------------------------------------------------+
| Cadastro da pessoa Junior realizado com sucesso |
+-------------------------------------------------+
1 row in set (0.00 sec)

--EXPORTAR AS BUSCAS DO BANCO (DADOS)

select * into outfile 'c:/export.txt' 
		fields terminated by ';'
		lines terminated by '\n'
		from pessoa;
		
select p.nome,
		e.rua,
		e.cidade,
		e.estado
		into outfile 'c:/export2.csv' 
		fields terminated by ';'
		lines terminated by '\n'
		from pessoa p
		inner join endereco e
		on p.idpessoa = e.id_pessoa
		where e.estado = 'RJ';

		