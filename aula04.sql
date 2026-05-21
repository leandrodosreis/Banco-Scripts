use db_filmes_20261_b;

#RELACIONAMENTO ENTRE TABELAS 
select * from tbl_filme;
select * from tbl_classificacao;

#Exemplo de como relacionar tabelas no select para unir atributos

#INNER JOIN
#Retorna todos os filmes que somente estao relacionados com a classificação
select tbl_filme.nome as nome_filme, tbl_filme.sinopse, tbl_filme.duracao,
		tbl_classificacao.nome as nome_classificacao, tbl_classificacao.sigla
from tbl_filme
		inner join tbl_classificacao 
			on tbl_classificacao.id = tbl_filme.id_classificacao;
            
#LEFT JOIN
#Retorna todos os filmes que estao relacionados com a classificação e tambem os filmes que não foram relacionados
select tbl_filme.nome as nome_filme, tbl_filme.sinopse, tbl_filme.duracao,
		tbl_classificacao.nome as nome_classificacao, tbl_classificacao.sigla
from tbl_filme
		left join tbl_classificacao 
			on tbl_classificacao.id = tbl_filme.id_classificacao;
            
#RIGHT JOIN            
#Retorna todos os filmes que estao relacionados com a classificação e tambem as classificações que não foram relacionadas com nenhum filme
select tbl_filme.nome as nome_filme, tbl_filme.sinopse, tbl_filme.duracao,
		tbl_classificacao.nome as nome_classificacao, tbl_classificacao.sigla
from tbl_filme
		right join tbl_classificacao 
			on tbl_classificacao.id = tbl_filme.id_classificacao;
            