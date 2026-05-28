#Gere um relatório que exiba o nome do autor e o nome por extenso do seu sexo
select tbl_autor.nome as nome_autor, tbl_sexo.nome as sexo_nome
	from tbl_autor
		inner join tbl_sexo 
			on tbl_sexo.id = tbl_autor.id_sexo;
            
            
#Escreva uma consulta que liste o nome do autor e a sua respectiva nacionalidade.
select tbl_autor.nome as nome_autor, tbl_nacionalidade.nome as nacionalidade_nome
	from tbl_autor
		inner join tbl_autor_nacionalidade
			on tbl_autor.id = tbl_autor_nacionalidade.id_autor
		inner join tbl_nacionalidade
			on tbl_nacionalidade.id = tbl_autor_nacionalidade.id_nacionalidade;
            
            
#A editora quer saber quais autores foram cadastrados no sistema, mas ainda
#não possuem nenhuma obra vinculada. Liste o nome de todos os autores e,
#ao lado, o título do livro. Caso o autor não tenha livro, o título deve aparecer
#como NULL.
select tbl_autor.nome as nome_autor, tbl_livro.titulo as titulo_livro
	from tbl_autor
		left join tbl_livro_autor
	on tbl_autor.id = tbl_livro_autor.id_autor
		left join tbl_livro
        on tbl_livro.id = tbl_livro_autor.id_livro;
        
#Faça um levantamento de todos os gêneros cadastrados no sistema e os títulos
#dos livros associados a eles. O relatório deve exibir inclusive os gêneros que não
#possuem nenhum livro atrelado a eles até o momento.
select tbl_genero.genero as genero, tbl_livro.titulo as titulo_livro
	from tbl_genero
		left join tbl_livro_genero
	on tbl_genero.id = tbl_livro_genero.id_genero
		left join tbl_livro
	on tbl_livro.id = tbl_livro_genero.id_livro;
    
    
#O setor de marketing precisa de uma listagem simples para o site contendo: o
#título do livro, o nome do autor principal e o nome da editora que o publicou.
select tbl_livro.titulo as titulo_livro, tbl_autor.nome as autor_livro, tbl_editora.nome as nome_editora
	
    from tbl_livro	
		inner join tbl_livro_autor
	on tbl_livro.id = tbl_livro_autor.id_livro
		inner join tbl_autor
	on tbl_autor.id = tbl_livro_autor.id_autor
    
		inner join tbl_livro_editora
	on tbl_livro.id = tbl_livro_editora.id_livro
		inner join tbl_editora
	on tbl_editora.id = tbl_livro_editora.id_editora ;
    
    
#Para organizar o estoque, monte uma consulta que retorne o título do livro, o
#tipo de acabamento (ex: Capa Dura, Brochura) e o país de origem daquela
#obra.
select tbl_livro.titulo as titulo_livro, tbl_acabamento.tipo as tipo_acabamento, tbl_pais_origem.pais as pais_origem
		from tbl_livro
			inner join tbl_acabamento 
            on tbl_acabamento.id = tbl_livro.id_acabamento
            
			inner join tbl_pais_origem
            on tbl_pais_origem.id = tbl_livro.id_pais_origem;
            
            
#O clube de leitura quer uma lista apenas com os títulos dos livros e suas
#biografias, mas o resultado deve trazer apenas as obras que pertençam ao
#gênero 'Terror ou Horror'.
select tbl_livro.titulo as titulo_livro, tbl_livro.biografia as biografia_livro, tbl_genero.genero as genero
	from tbl_livro
		inner join tbl_livro_genero
			on tbl_livro.id = tbl_livro_genero.id_livro
		inner join tbl_genero
			on tbl_genero.id = tbl_livro_genero.id_genero
            where tbl_genero.id = 5;
            

#O Diretor da empresa quer um relatório completo e unificado de todo o
#ecossistema. Escreva uma consulta que exiba, em uma única tabela, as seguintes
#informações de cada obra:
#• Do Livro: Título, valor, quantidade de páginas, data de publicação e o
#código ISBN.
#• Das Características: O tipo de acabamento e o país de origem.
#• Do Gênero: O nome do gênero literário.
#• Da Editora: O nome da editora e o seu telefone de contato.
#• Do Autor: O nome do autor, a data de nascimento e o nome por extenso do
#seu sexo.
#• Da Origem do Autor: A nacionalidade do autor.

select tbl_livro.titulo , tbl_livro.valor, tbl_livro.qtde_paginas, tbl_livro.data_publicacao, tbl_livro.isbn,
		tbl_acabamento.tipo,
        tbl_pais_origem.pais,
        tbl_genero.nome,
        tbl_editora.nome,
        tbl_telefone.telefone,
        tbl_autor.nome, tbl_autor.data_nascimento,
        tbl_sexo.nome,
        tbl_nacionalidade.nome
        
        from tbl_livro
			inner join tbl_acabamento 
            on tbl_acabamento.id = tbl_livro.id_acabamento
			inner join tbl_pais_origem
            on tbl_pais_origem.id = tbl_livro.id_pais_origem
			inner join tbl_genero
			on tbl_genero.id = tbl_livro_genero.id_genero
			inner join tbl_editora
			on tbl_editora.id = tbl_livro_editora.id_editora
			inner join tbl_autor
			on tbl_autor.id = tbl_livro_autor.id_autor
			inner join tbl_sexo 
			on tbl_sexo.id = tbl_autor.id_sexo
			inner join tbl_nacionalidade
			on tbl_nacionalidade.id = tbl_autor_nacionalidade.id_nacionalidade
            