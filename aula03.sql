use db_filmes_20261_b;

#Retorna a data atual do servidor
select curdate() as data_atual;
select current_date() as data_atual;

#Retorna a hora atual do servidor
select curtime() as hora_atual;
select current_time() as hora_atual;

#Retorna a data e a hora atual do servidor
select current_timestamp() as data_hora_atual;

#Funções para retornar hota, minuto, segundo
select hour(curtime()) as hora;
select minute(curtime()) as minuto;
select second(curtime()) as segundos;

#Função para formatar a hora
#Retotna a hora 00...23
select time_format(curtime(), '%H') as hora_formatada;

#Retorna a hora 00...12
select time_format(curtime(), '%h') as hora_formatada;

#Retorna minuto
select time_format(curtime(), '%I') as hora_formatada;

#Retorna segundo
select time_format(curtime(), '%s') as hora_formatada;

#Retorna apenas hora e minuto
select time_format(curtime(), '%h:%i') as hora_formatada;

#Retorna o tempo com AM ou PM
select time_format(curtime(), '%r') as hora_formatada;

#Retorna time normal 00...23
select time_format(curtime(), '%T') as hora_formatada;

#Retorna uma formatação do AM ou PM
select concat(time_format(curtime(), '%h:%i'), ' AM') as hora_formatada;

#Retorna apenas AM ou PM
select time_format(curtime(), '%p') as hora_formatada;

#Retorna microsegundos
select time_format(curtime(), '%f') as hora_formatada;


##FORMATAÇÃO PARA DATA
#Retorna o dia referente a data em formato numeral
select date_format(curdate(), '%d') as data_formatada;

#Retorna o dia referente a data em formato ordinal
select date_format(curdate(), '%D') as data_formatada;

#Retorna o dia a partir de 0 a 31
select date_format(curdate(), '%e') as data_formatada;

#Retorna o mês referente a data
#Retorna o mes por numeral
select date_format(curdate(), '%m') as data_formatada;
#Retorna o mes por extenso
select date_format(curdate(), '%M') as data_formatada;
#Retorna o mes por extenso(abreviado)
select date_format(curdate(), '%b') as data_formatada;

#Retorna o ano 
select date_format(curdate(), '%y') as data_formatada;
select date_format(curdate(), '%Y') as data_formatada;

#Retorna o dia da semana
select date_format(curdate(), '%W') as data_formatada;
#Retorna o dia da semana por extenso (abreviado)
select date_format(curdate(), '%a') as data_formatada;
#Retorna o dia da semana numeral (0 = domingo)
select date_format(curdate(), '%w') as data_formatada;

#Retorna o numero da semana referente ao ano
select date_format(curdate(), '%U') as data_formatada;

#Retorna o dia do ano
select date_format(curdate(), '%j') as data_formatada;

#Padrao utilizado como chega e como deve sair do banco
select date_format(curdate(), '%Y-%m-%d') as data_formatada;
select date_format(curdate(), '%d/%m/%Y') as data_formatada;

##Exemplo
select nome, sinopse, 
	data_lancamento, 
    date_format(data_lancamento, '%d/%m/%Y') as data_lancamento_brasil
from tbl_filme;

#Funções para retornar dia mes ou ano
select day(curdate()) as data_formatada;
select month(curdate()) as data_formatada;
select year(curdate()) as data_formatada;

#Retorna somente a data ou a hora de um atributo datetime
select date(current_timestamp()) as data_hora;
select time(current_timestamp()) as data_hora;

#Calcula a diferença de datas
select datediff('2005-01-24', '2026-05-21') as diferenca;
select year('2026-05-21') - year('2005-01-24') as anos;

#Calcula a difença de horas 
select timediff('13:40', '10:30') as diferenca;

select hour(timediff('13:40', '10:30')) as diferenca,
		hour(timediff('13:40', '10:30'))*5 as diferenca;
        
select hour(timediff('13:40', '10:30')) as diferenca,
		concat('R$ ', hour(timediff('13:40', '10:30'))*5) as diferenca;