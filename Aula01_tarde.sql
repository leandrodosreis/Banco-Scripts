#Cria o Banco de dados
create database db_exercicio_a_tarde;

#Mostra os Bancos de Dados conectados
show databases;

#Ativa o banco de dados
use db_exercicio_a_tarde;

#Mostra as tabelas do Banco
show tables;

#Criando tabelas no DB
#Tabela de sexo
create table tbl_sexo(
	id 		int not null auto_increment primary key,
    sigla 	varchar(3) not null,
    sexo 	varchar(15) not null
);

#Retorna a estrutura da tabela
#desc tbl_telefone;

#Tabela de Tipo Telefone
create table tbl_tipo_telefone(
	id 		int not null auto_increment primary key,
    tipo 	varchar(15) not null
);

#Tabela de categoria
create table tbl_categoria(
	id 			int not null auto_increment primary key,
    categoria 	varchar(5) not null
);

#Tabela de Estado
create table tbl_estado(
	id 		int not null auto_increment primary key,
    sigla 	varchar(3) not null,
    nome 	varchar(30) not null
);

#Tabela de cliente com FK
create table tbl_cliente(
	id 					int not null auto_increment primary key,
    nome 				varchar(100) not null,
    cpf 				varchar(18) not null,
    data_nascimento 	date not null,
    email 				varchar(256),
    id_sexo 			int not null, #FK
    
    #Relacionamento
    constraint FK_SEXO_CLIENTE 	#Passo 1 Nome do relacionamento
    foreign key (id_sexo) 		#Passo 2 Qual atributo sera FK
    references tbl_sexo(id) 	#Passo 3 Define de qual tabela vira a FK 
);

#Tabela Telefone
create table tbl_telefone(
	id int not null auto_increment primary key,
    numero varchar(25) not null,
    id_tipo_telefone int not null, #FK
    id_cliente int not null, #FK
    
    #Relacionamento entre tipo e telefone
    constraint FK_TIPOTELEFONE_TELEFONE
    foreign key (id_tipo_telefone)
    references tbl_tipo_telefone(id),
    
    #Relacionamento entre Cliente e telefone
    constraint FK_CLIENTE_TELEFONE
    foreign key (id_cliente)
    references tbl_cliente(id)
);

#Excluir o database e todas suas tabelas
#drop database db_exercicio_a_tarde

#Tabela Habilitação
create table tbl_habilitacao(
	id int not null auto_increment primary key,
    numero varchar(10) not null,
    data_valida date not null
);

#Modifica a estrutura de um atributo
alter table tbl_habilitacao
	modify column numero int not null;
    
#Renomeia a escrita de uma coluna e modifica a estrutura de um dado
alter table tbl_habilitacao
	change column data_valida data_validade date not null;
 
#Adiciona uma nova coluna
alter table tbl_habilitacao
	add column id_cliente int not null;

#Remove uma coluna 
#alter table tbl_habilitacao
#	drop column id_cliente;

alter table tbl_habilitacao
	add 	
		constraint FK_CLIENTE_HABILITACAO
		foreign key (id_cliente)
		references tbl_cliente(id);
        
#Permite remover um relacionamento 
#Primeiro remove o nome da relação e depois o atributo()
alter table tbl_habilitacao
	drop foreign key FK_CLIENTE_HABILITACAO,
	drop column id_cliente;