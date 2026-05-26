create database db_condominios;

create table tbl_administradora (
	id 				int not null auto_increment primary key,
    nome			varchar(80) not null,
    data_nascimento	date not null,
    cpf				varchar(20) not null
);

create table tbl_estados (
	id 				int not null auto_increment primary key,
    nome			varchar(30) not null,
    sigla			varchar(3) not null
);

create table tbl_pessoa (
	id 				int not null auto_increment primary key,
    nome			varchar(20) not null,
    cpf				varchar(18) not null,
    email			varchar(255),
    data_nascimento	date not null
);

create table tbl_tipo_telefone (
	id 				int not null auto_increment primary key,
    tipo			varchar(20) not null
);

create table tbl_condominio (
	id 				int not null auto_increment primary key,
    nome_fantasia			varchar(100) not null,
    data_criacao			date not null
);