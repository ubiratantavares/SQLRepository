DROP DATABASE IF EXISTS vendas;

CREATE DATABASE vendas;

USE vendas;

CREATE TABLE cliente (
	idCliente INTEGER AUTO_INCREMENT,
	cliente VARCHAR(80) NOT NULL,
	endereco VARCHAR(80) NOT NULL,
	cidade VARCHAR(50) NOT NULL,
	cep VARCHAR(9) NOT NULL,
	uf CHAR(2) NOT NULL,
	cgc VARCHAR(20) NOT NULL,
	estado VARCHAR(20) NOT NULL,
	PRIMARY KEY (idCliente)
);

CREATE TABLE vendedor (
	idVendedor INTEGER AUTO_INCREMENT,
	vendedor VARCHAR(60) NOT NULL,
	salario DECIMAL(10,2) NOT NULL,
	comissao CHAR(1) NOT NULL,
	PRIMARY KEY (idVendedor)	
);

CREATE TABLE produto (
	idProduto INTEGER AUTO_INCREMENT,
	produto VARCHAR(60) NOT NULL,
	unidade VARCHAR(10) NOT NULL,
	valor DECIMAL(10,2) NOT NULL,
	PRIMARY KEY(idProduto)
);

CREATE TABLE pedido (
	idPedido INTEGER,
	prazo INTEGER NOT NULL,
	cliente INTEGER UNIQUE,
	vendedor INTEGER UNIQUE,
	PRIMARY KEY (idPedido),
	FOREIGN KEY(cliente) REFERENCES cliente (idCliente) 
	ON DELETE CASCADE,
	FOREIGN KEY(vendedor) REFERENCES vendedor (idVendedor)
	ON DELETE CASCADE
);


CREATE TABLE item_pedido (
	id_item_pedido INTEGER AUTO_INCREMENT,	
	pedido INTEGER UNIQUE,
	produto INTEGER UNIQUE,
	quantidade INTEGER NOT NULL,
	PRIMARY KEY(id_item_pedido),
	FOREIGN KEY(pedido) REFERENCES pedido(idPedido)
	ON DELETE CASCADE,
	FOREIGN KEY(produto) REFERENCES produto(idProduto)
	ON DELETE CASCADE
);
