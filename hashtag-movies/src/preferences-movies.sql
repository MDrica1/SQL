/* 
Em quais generos de filmes investir baseado na popularidade? 
Número de filmes com nota acima da média e distribuição das médias por ano de lançamento.
Satisfação dos clientes baseada na média geral dos filmes.

*/
USE hashtagmovie;


/*
Observamos que a amostra é constituida de 578 alugueis, referentes a 71 filmes*/
SELECT COUNT(id_filme) FROM alugueis;
SELECT COUNT(id_filme) FROM filmes;

/* Aqui, observamos que há valores nulos na amostra, correspondentes a 250. Ou seja, cerca de 43% dos filmes alugados não foram avaliados.*/
SELECT COUNT(*) FROM alugueis WHERE nota IS NULL;

/* Primeiramente, analisaremos a satisfação dos clientes, baseados na média geral de avaliação dos filmes.
A média é 7.9, o que pode ser considerado uma satisfação mediana. */
SELECT AVG(nota) FROM alugueis WHERE nota IS NOT NULL;

/* Dentre as avaliações disponíveis, observamos que 58,8% apresentam nota acima da média (7.9) */
CREATE VIEW high_rating AS
SELECT COUNT(*) AS movies_high_rating
FROM alugueis 
WHERE nota IS NOT NULL 
AND 
nota > (SELECT AVG(nota) FROM alugueis);

SELECT * FROM high_rating;

/* O que fazer para aumentar a satisfação dos clientes? Investir nos filmes que os clientes mais gostam.
Para isso, precisamos descobrir quais gêneros possuem melhor avaliação no catálogo. 

Observando a média por genero, vemos que 4 estão acima da média: Ação e aventura, arte, ficção e fantasia e animação. Dentre os quais, 
os dois com maior média são Ação e aventura e Arte*/
SELECT f.genero, AVG(a.nota) AS media 
FROM alugueis AS a
JOIN
filmes AS f
USING(id_filme)
WHERE a.nota IS NOT NULL 
GROUP BY f.genero
ORDER BY AVG(a.nota) DESC;

/* Podemos ainda, ir mais além e buscar os gênero com maior número de avaliações excelentes (10 e 9)
 Eis a amostra sem valores nulos de nota, agrupadas por genero*/
 
CREATE VIEW filmes_alugados_genero AS
SELECT f.genero, COUNT(a.id_filme) AS n_filmes_alugados
FROM alugueis AS a 
JOIN
filmes AS f
USING(id_filme)
WHERE nota IS NOT NULL 
GROUP BY f.genero;

SELECT * FROM filmes_alugados_genero;
/* 
Cerca de 52% das notas 10 foram dadas a filmes de drama. No entanto, essa quantidade corresponde a apenas 20,5% dos filmes de drama que foram alugados e avaliados.
Quem recebeu, percentualmente, o maior número de notas 10 foi o gênero Ação e Aventura
 */
 
SELECT f.genero, COUNT(a.id_filme) AS n_avaliações
FROM alugueis AS a 
JOIN 
filmes AS f 
USING(id_filme)
WHERE a.nota=10
GROUP BY f.genero
ORDER BY n_avaliações DESC;

/* Ampliando a consideração de notas excelentes para 10 e 9, os filmes de Ação e aventura continuam com a preferência,
71,4% das avaliações 9 e 10, seguido do genero Arte, com 66,7% */


SELECT f.genero, COUNT(a.id_filme) AS n_avaliações
FROM alugueis AS a 
JOIN 
filmes AS f 
USING(id_filme)
WHERE a.nota=10 OR a.nota=9
GROUP BY f.genero
ORDER BY n_avaliações DESC;


/* 
Podemos ainda, olhar como se distribuem as avaliação por ano de lançamento dos filmes.
Observamos que, agrupando as médias por ano, os anos com filmes com avaliação acima da média são, em ordem:
2009,2012,2001,2004,2007 e 2014. 
*/

SELECT f.ano_lancamento, AVG(a.nota) AS media
FROM alugueis AS a
JOIN
filmes AS f
USING(id_filme)
WHERE a.nota IS NOT NULL 
GROUP BY f.ano_lancamento HAVING AVG(a.nota) > (SELECT AVG(nota) FROM alugueis WHERE nota IS NOT NULL)
ORDER BY AVG(a.nota) DESC;

/* Agrupando as médias por gênero e ano de lançamento */

SELECT f.genero, f.ano_lancamento, AVG(a.nota) AS media, COUNT(*) AS n_avaliações 
FROM alugueis AS a
JOIN
filmes AS f
USING(id_filme)
WHERE a.nota IS NOT NULL 
GROUP BY f.genero, f.ano_lancamento HAVING AVG(a.nota) > (SELECT AVG(nota) FROM alugueis WHERE nota IS NOT NULL)
ORDER BY AVG(a.nota) DESC;

/*
E, considerando que a maioria dos filmes alugados foram de drama, embora mal avaliados, buscando aumentar a 
satisfação dos clientes, investiguei em qual ano foram produzidos os filmes de drama com melhor nota, afim de melhorar a 
qualidade dos filmes deste gênero, que é o mais buscado.
*/
SELECT f.ano_lancamento, AVG(a.nota) AS media
FROM alugueis AS a
JOIN
filmes AS f
USING(id_filme)
WHERE a.nota IS NOT NULL 
AND f.genero = 'Drama'
GROUP BY f.ano_lancamento HAVING AVG(a.nota) > (SELECT AVG(nota) FROM alugueis WHERE nota IS NOT NULL)
ORDER BY AVG(a.nota) DESC;

/* 
Assim, observamos que a Hashtag Movie deve investir em filmes de Ação e aventura (especialmente de 2009 e 2012) e Arte.
Também é interessante investir em filmes de Ficção e Fantasia de 2001, e filmes de Drama de 2011.
 */
 