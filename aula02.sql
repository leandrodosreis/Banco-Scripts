use db_filmes_20261_b;

#insert
insert into tbl_filme (
						nome, 
						sinopse, 
						capa, 
						data_lancamento, 
						duracao, 
						valor, 
						avaliacao 
                        ) values (
                        'O Rei da Internet',
                        'Inspirado na vida de Daniel Nascimento, que ficou conhecido como “O Rei da Internet” é uma aventura dramática que conta como Daniel, interpretado aqui por João Guilherme, se destacou como um dos maiores hackers do Brasil. Além de ter feito parte de uma organização criminosa que movimentou milhões de reais, ter vivido intensamente uma vida de ostentação e ter sido alvo de operação da Polícia Federal. Tudo isso antes de completar 17 anos.',
                        'https://br.web.img3.acsta.net/r_1920_1080/img/52/e8/52e8eef82b8842cbc893bd8b2ff02907.jpg',
                        '2026-05-14',
                        '02:15',
                        '66.6',
                        '3'
                        );

insert into tbl_filme (
						nome, 
						sinopse, 
						capa, 
						data_lancamento, 
						duracao, 
						valor, 
						avaliacao 
                        ) values (
                        'Michael',
						'Peter Parker (Tobey Maguire) é um jovem estudioso que vive com seus tios, Ben (Cliff Robertson) e May (Rosemary Harris), desde que seus pais faleceram. Inteligente e com um grande interesse pela ciência, Peter tem dificuldade em se relacionar com seus colegas, por ser tímido e por eles o considerarem um nerd. Até que, em uma demonstração científica, um acidente inesperado faz com que aranha modificada geneticamente pique Peter. A partir de então seu corpo é quimicamente alterado pela picada da aranha, fazendo com que Peter possa escalar paredes e tetos, emitir pelos punhos um fluido ultra-resistente semelhante à uma teia de aranha e passe a ter um "sentido de aranha", que o avisa sempre que há perigo por perto, além de superforça e visão ampliada. Inicialmente Peter pensa em usar seus novos poderes para ganhar dinheiro, adotando o nome de Homem-Aranha e se apresentando em lutas de exibição. Porém, ao permitir que um ladrão fuja por não considerar sua função capturá-lo, o fugitivo acaba assassinando seu tio Ben. A partir de então, Peter decide não mais usar seus poderes para proveito próprio e sim para enfrentar o mal, tendo como seu primeiro grande desafio enfrentar o psicótico Duende Verde (Willem Dafoe), que na verdade é o empresário Norman Osborn após ter sido exposto à um gás experimental que lhe deu uma segunda personalidade e grande força física.',
                        'https://br.web.img3.acsta.net/r_1920_1080/img/52/e8/52e8eef82b8842cbc893bd8b2ff02907.jpg',
                        '2002-05-17',
                        '02:08',
                        '50.6',
                        '4.7'
                        ),
                        (
						'Homem-Aranha',
						'Michael é uma cinebiografia musical sobre o rei do pop Michael Jackson. O longa retrata a vida e o legado do cantor (Jaafar Jackson), desde a descoberta de seu espetacular talento como líder do Jackson Five até o impacto cultural de sua visão artística ímpar. Para além da música, este drama biográfico traça as ambições criativas de um homem que buscou ativamente se tornar um dos maiores artistas do mundo, destacando os passos dados por Jackson fora dos palcos. Performances icônicas de sua carreira solo, ainda, compõem esse retrato íntimo e nunca antes visto do artista.',
						'https://br.web.img2.acsta.net/c_310_420/pictures/bzp/01/29007.jpg',
                        '2026-04-26',
                        '02:01',
                        '70.6',
                        '4.4'
                        ),
                        (
                        'De Volta para o Futuro',
						'Um jovem (Michael J. Fox) aciona acidentalmente uma máquina do tempo construída por um cientista (Christopher Lloyd) em um Delorean, retornando aos anos 50. Lá conhece sua mãe (Lea Thompson), antes ainda do casamento com seu pai, que fica apaixonada por ele. Tal paixão põe em risco sua própria existência, pois alteraria todo o futuro, forçando-o a servir de cupido entre seus pais.',						
						'https://br.web.img3.acsta.net/c_310_420/medias/nmedia/18/90/95/62/20122008.jpg',
                        '1985-12-25',
                        '01:56',
                        '80.6',
                        '4.7'
                        );

#update

update tbl_filme set nome = 'Filme para testar o BD' where id = 36;
update tbl_filme set capa = 'http://filme.jpg';

#delete

delete from tbl_filme where id = 31;

#select
#Retorna todos os atributos de tabela
select * from tbl_filme;
select tbl_filme.* from tbl_filme;

#Retorna atributos especificos da tabela
select nome, sinopse, capa from tbl_filme;
select tbl_filme.nome, tbl_filme.sinopse, tbl_filme.capa from tbl_filme;

#as -> alias(do ingles) Permite alterar virtualmente o nome das colunas ou tabelas
select nome as nome_filme, sinopse as sinopse_filme from tbl_filme;

#Ordenação de dados crescente ou descrescente 
#crescente
select * from tbl_filme order by nome;
select * from tbl_filme order by nome asc;

#decrescente
select * from tbl_filme order by nome desc;
select * from tbl_filme order by nome, sinopse desc, valor asc;


#Like 
select * from tbl_filme where nome = 'Homem-Aranha';
#parecido com o =
select * from tbl_filme where nome like 'Homem-Aranha';

#retorna films que termina com com a palavra
select * from tbl_filme where nome like 'Homem-Aranha%';

#retorna films que inicia com a palavra
select * from tbl_filme where nome like '%Aranha';

#retorna films que encontra a palavra
select * from tbl_filme where nome like '%Aranha%';
select * from tbl_filme where nome like '%A%' order by nome asc;

#Operadores Logicos
#AND
#OR
#NOT

#ordem de processamento dos operadores logicos
# 1° ()
# 2° NOT
# 3° AND
# 4° OR

select * from tbl_filme
	where nome like '%Michael%' or
			sinopse like '%Michael%';
            
select * from tbl_filme where data_lancamento >= '2026-01-01' and data_lancamento <= '2026-12-31';

select * from tbl_filme where not nome = 'Michael';

select * from tbl_filme where (duracao >= '2:00' or nome like 'F%') and data_lancamento >= '2010-01-01';

select * from tbl_filme;

select * from tbl_filme where id = 2 or id = 4 or id = 10 or id =12 or id =20 or id = 21 or id =22;

#IN permite encaminhar uma lista de opções, utilizar apenas para substitui o OR e funciona com NOT
select * from tbl_filme where id in (2,4,10,12,20,21,22);


#Comandos para trabalhar com String
#ucase() Maiusculo / 
#lcase() Minusculo /
#length() Quantidade de caracteres / 
#concat() Permite concatenar conteudos
#substr() Permite limitar a quantidade de caracteres de uma string
select 	ucase(nome) as nome_titulo , 
		lcase(nome) as nome_lista, 
		length(nome) as qtde_nome,
        concat('Nome: ', nome) as nome_formato,
        concat('O Filme ', nome, ' tem a sinopse ', sinopse) as filme_sinopse,
		concat(substr(sinopse,1,20), ' ... <a href = "detalhes.html">leia mais</a>') as sinopse_formatada,
		sinopse, data_lancamento, duracao
	from tbl_filme;
    
#Trabalhando com valores (calculos matematicos)

#Retorna quantidade de registros
select count(*) as qtd_filmes from tbl_filme;

#Retorna a soma de valores de uma coluna
select sum(valor) as total from tbl_filme;

#Retorna a media de valores 
select avg(valor) as media from tbl_filme;

#limita a quantidade de  casas decimais
select round(avg(valor), 3) as media_arredondada from tbl_filme;

#
select concat('R$', round(avg(valor), 2)) as media_arredondada_moeda from tbl_filme;
##format e round

select nome, 
		valor,
        concat('R$ ', valor + round(((valor * 30)/100),2)) as valor_venda
        from tbl_filme;
        
