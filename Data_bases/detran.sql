create database db_detran;

create table tbl_sexo (
	id 				int not null auto_increment primary key,
    sigla			varchar(3) not null,
    sexo			varchar(15) not null
);

create table tbl_categoria (
	id 				int not null auto_increment primary key,
    categoria			varchar(5) not null
);

create table tbl_tipo_telefone (
	id 				int not null auto_increment primary key,
    tipo			varchar(15) not null
);

create table tbl_estado (
	id 				int not null auto_increment primary key,
    sigla			varchar(3) not null,
    nome 			varchar(30) not null
);

create table tbl_agente (
	id 				int not null auto_increment primary key,
    codigo_agente			int not null,
    nome					varchar(30)
);

create table tbl_gravidade (
	id 				int not null auto_increment primary key,
    nome			varchar(15) not null
);

create table tbl_tipo (
	id 				int not null auto_increment primary key,
    nome			varchar(30) not null,
    codigo_infracao	varchar(10) not null
);

create table tbl_veiculo (
	id 				int not null auto_increment primary key,
    placa			varchar(20) not null,
    ano				year(4) not null,
    chassi 			varchar(25) not null,
    valor			decimal(7,2)
    
);

create table tbl_fabricante (
	id 				int not null auto_increment primary key,
    nome			varchar(30) not null
);

create table tbl_cor (
	id 				int not null auto_increment primary key,
    nome			varchar(5) 
);

create table tbl_tipo (
	id 				int not null auto_increment primary key,
    nome			varchar(20) not null
);