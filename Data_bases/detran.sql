create database db_detran;

create table tbl_sexo (
	id 				int not null auto_increment primary key,
    sigla			varchar(3) not null,
    sexo			varchar(15) not null
);

create table tbl_cliente (
	id 					int not null auto_increment primary key,
	nome				varchar(80) not null,
    cpf					varchar(20) not null,
    data_nascimento		date not null,
    email				varchar(255),
    id_sexo 			int not null,
    
	constraint FK_SEXO_CLIENTE
    foreign key (id_sexo)
    references tbl_sexo(id)
);

create table tbl_categoria (
	id 				int not null auto_increment primary key,
    categoria			varchar(5) not null
);

create table tbl_habilitacao(
	id 				int not null auto_increment primary key,
    numero 			varchar(10) not null,
    data_valida 	date not null,
    id_cliente		int not null,
    
	constraint FK_CLIENTE_HABILITACAO
    foreign key (id_cliente)
    references tbl_cliente(id)
);

create table tbl_foto(
	id int not null auto_increment primary key,
	imagem		varchar(255) not null,
    id_habilitacao		int not null,
    
	constraint FK_HABILITACAO_FOTO
    foreign key (id_habilitacao)
    references tbl_habilitacao(id)
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

create table tbl_agente (
	id 				int not null auto_increment primary key,
    codigo_agente			int not null,
    nome					varchar(30)
);

create table tbl_gravidade (
	id 				int not null auto_increment primary key,
    nome			varchar(15) not null
);

create table tbl_imagem(
	id 				int not null auto_increment primary key,
	imagem			varchar(255) not null,
    id_agente		int not null,
    
	constraint FK_AGENTE_IMAGEM
    foreign key (id_agente)
    references tbl_agente(id)
);

create table tbl_tipo (
	id 				int not null auto_increment primary key,
    nome			varchar(30) not null,
    codigo_infracao	varchar(10) not null
);

create table tbl_infracao(
	id 				int not null auto_increment primary key,
    data_infracao	date not null,
    hora_infracao	time not null,
    endereco		varchar(80),
    descricao		text,
    referencias		text,
    data_emissao	date not null,
    periodo_recorrencia		int not null,
    pontuacao		int not null,
    id_gravidade	int not null,
    id_imagem		int not null,
    
	constraint FK_GRAVIDADE_INFRACAO
    foreign key (id_gravidade)
    references tbl_gravidade(id),
    
	constraint FK_IMAGEM_INFRACAO
    foreign key (id_imagem)
    references tbl_imagem(id)
);

create table tbl_tipo_infracao (
	id 				int not null auto_increment primary key,
    id_tipo			int not null,
    id_infracao		int not null,
    
	constraint FK_TIPO_TIPOINFRACAO
    foreign key (id_tipo)
    references tbl_tipo(id),
    
	constraint FK_INFRACAO_TIPOINFRACAO
    foreign key (id_infracao)
    references tbl_infracao(id)
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

create table tbl_modelo(
	id 				int not null auto_increment primary key,
    nome			varchar(30),
    id_fabricante	int not null,
    
	constraint FK_FABRICANTE_MODELO
    foreign key (id_fabricante)
    references tbl_fabricante(id)
);

create table tbl_veiculo_tipo_modelo_cor(
	id 				int not null auto_increment primary key,
    id_veiculo		int not null,
    id_tipo			int not null,
    id_modelo		int not null,
    id_cor			int not null,
    
	constraint FK_VEICULO_VEICULOTIPOMODELOCOR
    foreign key (id_veiculo)
    references tbl_veiculo(id),
    
	constraint FK_TIPO_VEICULOTIPOMODELOCOR
    foreign key (id_tipo)
    references tbl_tipo(id),
    
	constraint FK_MODELO_VEICULOTIPOMODELOCOR
    foreign key (id_modelo)
    references tbl_modelo(id),
    
    constraint FK_COR_VEICULOTIPOMODELOCOR
    foreign key (id_cor)
    references tbl_cor(id)
);

create table tbl_cliente_veiculo_infracao(
	id 				int not null auto_increment primary key,
    id_veiculo		int not null,
    id_cliente		int not null,
    id_infracao		int not null,
    
	constraint FK_VEICULO_CLIENTEVEICULOINFRACAO
    foreign key (id_veiculo)
    references tbl_veiculo(id),
    
	constraint FK_CLIENTE_CLIENTEVEICULOINFRACAO
    foreign key (id_cliente)
    references tbl_cliente(id),
    
	constraint FK_INFRACAO_CLIENTEVEICULOINFRACAO
    foreign key (id_infracao)
    references tbl_infracao(id)
);
