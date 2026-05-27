create database db_condominios;

create table tbl_administradora (
	id 				int not null auto_increment primary key,
    nome			varchar(80) not null,
    data_nascimento	date not null,
    cpf				varchar(20) not null
);

create table tbl_pessoa (
	id 				int not null auto_increment primary key,
    nome			varchar(20) not null,
    cpf				varchar(18) not null,
    email			varchar(255),
    data_nascimento	date not null
);

create table tbl_tipo_contrato (
	id 				int not null auto_increment primary key,
    tipo			varchar(15) not null,
    id_pessoa		int not null,
    
	constraint FK_PESSOA_TIPOCONTRATO
    foreign key (id_pessoa)
    references tbl_pessoa(id)
);

create table tbl_tipo_telefone (
	id 				int not null auto_increment primary key,
    tipo			varchar(15) not null
);

create table tbl_telefone(
	id 				int not null auto_increment primary key,
    numero 			varchar(25) not null,
    id_tipo_telefone int not null, #FK

    
    #Relacionamento entre tipo e telefone
    constraint FK_TIPOTELEFONE_TELEFONE
    foreign key (id_tipo_telefone)
    references tbl_tipo_telefone(id)
);

create table tbl_estado (
	id 				int not null auto_increment primary key,
    nome			varchar(30) not null,
    sigla			varchar(3) not null
);

create table tbl_cidade (
	id 				int not null auto_increment primary key,
    nome			varchar(60) not null,
    id_estado		int not null,
    
	constraint FK_ESTADO_CIDADE
    foreign key (id_estado)
    references tbl_estado(id)
);

create table tbl_endereco (
	id 				int not null auto_increment primary key,
	logradouro		varchar(100) not null,
    cep				varchar(10) not null,
    bairro			varchar(80) not null,
    complemento		varchar(20) ,
    latitude		varchar(15) ,
    longitude		varchar(15)	,
    id_cidade		int not null,
    
	constraint FK_CIDADE_ENDERECO
    foreign key (id_cidade)
    references tbl_cidade(id)
    );

create table tbl_condominio (
	id 				int not null auto_increment primary key,
    nome_fantasia			varchar(100) not null,
    data_criacao			date not null
);

create table tbl_condominio_endereco(
	id 				int not null auto_increment primary key,
    id_condominio		int not null,
    id_endereco		int not null,
    
	constraint FK_CONDOMINIO_CONDOMINIOENDERECO
    foreign key (id_condominio)
    references tbl_condominio(id),
    
	constraint FK_ENDERECO_CONDOMINIOENDERECO
    foreign key (id_endereco)
    references tbl_endereco(id)
    );
    
create table tbl_bloco (
	id 				int not null auto_increment primary key,
    numero			int not null,
    data_criacao			date not null,
    id_condominio		int not null,
    
	constraint FK_CONDOMINIO_CONDOMINIOBLOCO
    foreign key (id_condominio)
    references tbl_condominio(id)
);

create table tbl_unidade (
	id 				int not null auto_increment primary key,
    numero			int not null,
    data_criacao	date not null,
    id_bloco		int not null,
    
	constraint FK_BLOCO_BLOCOUNIDADE
    foreign key (id_bloco)
    references tbl_bloco(id)
);