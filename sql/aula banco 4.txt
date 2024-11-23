create database banco4;
use banco4;

create table vendedor (idvendedor int primary key,
			vendedor varchar(35),
			setor varchar(35),
			sexo varchar(1),
			ano int,
			valor float);

insert into vendedor values(1,'vanessa','marketing','f',2009,20000);	
insert into vendedor values(2,'vanessa','marketing','f',2010,40000);
insert into vendedor values(3,'vanessa','marketing','f',2011,22000);

insert into vendedor values(4,'ana','informatica','f',2009,25000);
insert into vendedor values(5,'ana','informatica','f',2010,48000);
insert into vendedor values(6,'ana','informatica','f',2011,10000);

insert into vendedor values(7,'kelly','marketing','f',2009,30000);
insert into vendedor values(8,'kelly','marketing','f',2010,22000);
insert into vendedor values(9,'kelly','marketing','f',2011,15000);

insert into vendedor values(10,'paulo','informatica','f',2009,23000);
insert into vendedor values(11,'paulo','informatica','f',2010,25000);
insert into vendedor values(12,'paulo','informatica','f',2011,35000);


#distinct evita duplicidade no select
select distinct (vendedor) from  vendedor;

select * from vendedor where sexo='f' and ano=2011;

a) somatorio de toda a venda

--alias

select sum(valor) as total from vendedor;
select sum(valor) total from vendedor;
select sum(valor) "total" from vendedor;

b)somatorio de todas vendas com superior ou igual a 20000...
select sum(valor) from vendedor where valor >=20000;

c) somatorio de cada vendedor
select sum(valor), vendedor from vendedor
 group by (vendedor);


d) somatorio por setor
select sum(valor), setor from vendedor
 group by (setor);

e) errado: por id, pq nao se repete

f) somatorio dos vendedores que venderam igual ou acima de 80k
select sum(valor), vendedor from vendedor group by vendedor having sum(valor)>=80000;


g) total de venda da kelly ou vanessa
select sum(valor), vendedor from vendedor where vendedor = 'kelly' or vendedor = 'vanessa'
  group by vendedor;

h) select diferente

select dia from(select date_format(now(), '%d') as dia)blah;
select now();

select dia, mes, ano from (
	select date_format(now(),'%d') as dia,
		date_format(now(),'%M') as mes,
		date_format(now(),'%Y') as ano
	)data;


##programação para conhecimento 
a)criar uma função retornar a data, dia, mes e ano am mysql (criar function)


delimiter $
select * from vendedor$

para programar mude o estado do fim
para voltar ao normal

delimiter ;
select * from vendedor;


#PROGRAMANDO
#apaga pra refazer

drop function if exists data1;
delimiter $
create function data1()
 returns varchar(30)
 begin
   declare vdia varchar(2) default '00';
   declare vmes varchar(2) default '00';
   declare vano varchar(4) default '0000';

   select date_format(now(),'%d') into vdia;
   select date_format(now(),'%m') into vmes;
   select date_format(now(),'%Y') into vano;
 
 return concat(vdia,'-',vmes,'-',vano);
 end;
$
delimiter ;
select data1();

drop function if exists totalvendedor;
delimiter $
create function totalvendedor(vvendedor char(20)) 
  returns varchar(120)
begin
 declare vtotal float default 0;
 declare vvendedor2 varchar(35) default '';
  select sum(valor), vendedor into vtotal,vvendedor2
   from vendedor where vendedor=vvendedor group by vendedor;
 return concat(vvendedor2,'-',vtotal);
end;
$
delimiter ;
select totalvendedor('kelly');



select sum(valor) as total, sexo, null from vendedor
group by (sexo);
UNION ALL
select sum(valor) as total, null, setor from vendedor
group by(setor);

select sum(valor) as total, sexo, setor from vendedor
group by sexo, setor;

---------------
Exercicio:
produto(id, produto, marca, valor, pais)
a) somatorio do produto por marca
b) somatorio por pais
c) somatorio por marca e pais
d) criar funcao que ao passar pela marca mostre o somatorio
e) mostrar todos os produtos fabricados no Brasil ou na Franca
f) mostrar todos os produtos que tenham o preo entre 100 e 1000 reais