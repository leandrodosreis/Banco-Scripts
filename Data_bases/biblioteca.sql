create database db_biblioteca;

create table tbl_genero (
	id 				int not null auto_increment primary key,
    nome			varchar(55) not null
    );
    
create table tbl_faixa (
	id 				int not null auto_increment primary key,
    idade			int
    );
    
create table tbl_publico (
	id 				int not null auto_increment primary key,
    alvo			varchar(15) not null
    );
    
create table tbl_texto (
	id 				int not null auto_increment primary key,
    tipo			varchar(55) not null
    );
    
create table tbl_autor (
	id 				int not null auto_increment primary key,
    nome			varchar(80) not null
    );
    
create table tbl_secao (
	id 				int not null auto_increment primary key,
    nome			varchar(50) not null
    );
    
create table tbl_disponibilidade (
	id 				int not null auto_increment primary key,
    disponivel			varchar(15) not null
    );
    
create table tbl_condicao (
	id 				int not null auto_increment primary key,
    estado			varchar(15) not null
    );
    
create table tbl_sexo (
	id 				int not null auto_increment primary key,
    sigla			varchar(5) not null,
    genero			varchar(20)
    );
    
create table tbl_estado (
	id 				int not null auto_increment primary key,
    sigla			varchar(3) not null,
    nome			varchar(30) not null
    );
    
create table tbl_tipo_telefone (
	id 				int not null auto_increment primary key,
    tipo			varchar(20) not null
    );
    
create table tbl_email (
	id 				int not null auto_increment primary key,
    nome			varchar(255) not null
    );
    
create table tbl_biblioteca (
	id 				int not null auto_increment primary key,
    nome_fantasia			varchar(150) not null,
    cnpj					varchar(20)
    );
    
create table tbl_editora (
	id 				int not null auto_increment primary key,    
    nome_fantasia			varchar(150) not null,
    cnpj					varchar(20)
    );