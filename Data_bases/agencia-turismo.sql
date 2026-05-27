create database db_agencia_turismo;

use db_agencia_turismo;

show tables;

create table tbl_atracoes (
	id 				int not null auto_increment primary key,
    nome			varchar(150) not null,
    data_atracao	date not null,
    recomendacoes	text not null,
    descricao		text not null,
    valor			decimal (8,2) not null,
    site			varchar(255)
);

create table tbl_atracoes_endereco(
	id 				int not null auto_increment primary key,
    id_atracoes		int not null,
    id_endereco		int not null,
    
	constraint FK_ATRACOES_ATRACOESENDERECO
    foreign key (id_atracoes)
    references tbl_atracoes(id),
    
	constraint FK_ENDERECO_ATRACOESENDERECO
    foreign key (id_endereco)
    references tbl_endereco(id)
    );


create table tbl_categoria(
	id 				int not null auto_increment primary key,
    nome			varchar(50),
    id_atracoes		int not null,
    
	constraint FK_ATRACOES_CATEGORIA
    foreign key (id_atracoes)
    references tbl_atracoes(id)
    );

create table tbl_hotel (
	id 				int not null auto_increment primary key,
    nome			varchar(150) not null,
    cnpj			varchar(25) not null
);

create table tbl_hotel_endereco(
	id 				int not null auto_increment primary key,
    id_hotel		int not null,
    id_endereco		int not null,
    
	constraint FK_HOTEL_ATRACOESENDERECO
    foreign key (id_hotel)
    references tbl_hotel(id),
    
	constraint FK_ENDERECO_ATRACOESENDERECO
    foreign key (id_endereco)
    references tbl_endereco(id)
    );
    
    create table tbl_classificacao(
	id 				int not null auto_increment primary key,
	nome_classificacao	varchar(30) not null,
    
	constraint FK_HOTEL_CLASSIFICACAO
    foreign key (id_hotel)
    references tbl_hotel(id)
    );

create table tbl_restaurantes (
	id 				int not null auto_increment primary key,
    nome			varchar(150) not null,
    cnpj			varchar(25) not null,
    estrela			int not null
);

create table tbl_restaurantes_endereco(
	id 				int not null auto_increment primary key,
    id_restaurantes		int not null,
    id_endereco		int not null,
    
	constraint FK_RESTAURANTES_RESTAURANTESENDERECO
    foreign key (id_restaurante)
    references tbl_restaurante(id),
    
	constraint FK_ENDERECO_ATRACOESENDERECO
    foreign key (id_endereco)
    references tbl_endereco(id)
    );
    
create table tbl_disponibilidade(
	id 				int not null auto_increment primary key,
	dia_semana		varchar(15),
    sigla			varchar(5),
    hora_abertura	time not null,
    hora_fechamento	time not null,
    id_restaurantes		int not null,
    
	constraint FK_RESTAURANTES_DISPONIBILIDADE
    foreign key (id_restaurante)
    references tbl_restaurante(id)
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

create table tbl_email_cliente (
	id 				int not null auto_increment primary key,
    email			varchar(255) not null
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

create table tbl_agencia(
	id 				int not null auto_increment primary key,
	nome			varchar(150) not null,
    cnpj			varchar(25) not null,
    id_telefone 	int not null, #FK
	
    constraint FK_TELEFONE_AGENCIA
    foreign key (id_telefone)
    references tbl_telefone(id)
);

create table tbl_cliente (
	id 					int not null auto_increment primary key,
	nome				varchar(80) not null,
    cpf					varchar(20) not null,
    data_nascimento		date not null,
    email				varchar(255)
);

create table tbl_viagem (
	id 					int not null auto_increment primary key,
	nome				varchar(80) not null,
    data_inicio			date not null,
    data_termino		date not null,
    orcamento			decimal(8,2) not null,
    milhas_obtidas		int
	);
    
create table tbl_transporte (
	id 				int not null auto_increment primary key,
    tipo			varchar(20) not null
);

create table tbl_transporte_viagem (
	id 				int not null auto_increment primary key,
    id_transporte	int not null,
    id_viagem		int not null,
    
	constraint FK_TRANSPORTE_TRANSPORTEVIAGEM
    foreign key (id_transporte)
    references tbl_transporte(id),
    
	constraint FK_VIAGEM_TRANSPORTEVIAGEM
    foreign key (id_viagem)
    references tbl_viagem(id)
);


create table tbl_passagem(
	id 				int not null auto_increment primary key,
	data_emissao	date not null,
    assento			varchar(10) not null,
    portao			varchar(10) not null,
    numero_voo		text not null,
    id_agencia		int not null, #FK
    id_cliente		int not null,
    id_viagem		int not null,
    
	constraint FK_AGENCIA_PASSAGEM
    foreign key (id_agencia)
    references tbl_agencia(id),
    
	constraint FK_CLENTE_PASSAGEM
    foreign key (id_cliente)
    references tbl_cliente(id),
    
	constraint FK_VIAGEM_PASSAGEM
    foreign key (id_viagem)
    references tbl_viagem(id)
);