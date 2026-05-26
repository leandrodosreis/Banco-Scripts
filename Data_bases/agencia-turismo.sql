create database db_agencia_turismo;

create table tbl_atracoes (
	id 				int not null auto_increment primary key,
    nome			varchar(150) not null,
    data_atracao	date not null,
    recomendacoes	text not null,
    descricao		text not null,
    valor			decimal (8,2) not null,
    site			varchar(255)
);

create table tbl_hotel (
	id 				int not null auto_increment primary key,
    nome			varchar(150) not null,
    cnpj			varchar(25) not null
);

create table tbl_restaurantes (
	id 				int not null auto_increment primary key,
    nome			varchar(150) not null,
    cnpj			varchar(25) not null,
    estrela			int not null
);

create table tbl_estado (
	id 				int not null auto_increment primary key,
    nome			varchar(30) not null,
    sigla			varchar(3) not null
);

create table tbl_transporte (
	id 				int not null auto_increment primary key,
    tipo			varchar(20) not null
);

create table tbl_email_cliente (
	id 				int not null auto_increment primary key,
    email			varchar(255) not null
);

create table tbl_tipo_telefone (
	id 				int not null auto_increment primary key,
    tipo			varchar(15) not null
);