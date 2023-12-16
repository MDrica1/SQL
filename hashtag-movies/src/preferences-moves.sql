/* 

A hashtagmovie é um banco de dados que tem como principal objetivo armazenar as informações de
aluguéis e de desempenho dos filmes alugados pelo serviço de streaming da empresa ao longo do período.

Com esses dados será possível fazer análises dos dados para tomadas de decisão de curto e longo prazo,
como:
i) Decisão de investir em determinados filmes baseado na sua popularidade (nota)
ii) Número total de locações definirá a RECEITA DA EMPRESA
iii) A média de avaliação dos filmes definirá a SATISFAÇÃO DOS CLIENTES
iv) O número de clientes ativos definirá o ENGAJAMENTO DOS CLIENTES

Além disso, esses dados serão um prato cheio para descobrir coisas como:
• As preferências dos clientes de acordo com região e sexo
• Popularidade dos filmes por gênero e ano de lançamento
• Filmes com nota acima da média
• Dentre outros

*/

/* 
Em quais generos de filmes investir baseado na popularidade? 
Número de filmes com nota acima da média e distribuição das médias por ano de lançamento.
Satisfação dos clientes baseada na média geral dos filmes.

*/
USE hashtagmovie;

/* Primeiramente, iremos identificar em qual genero de filmes a hashtag movie deve investir, baseando-se nas notas dadas pelos clientes

Observamos que a amostra é constituida de 578 alugueis, referentes a 71 filmes*/
SELECT COUNT(id_filme) FROM alugueis;
SELECT COUNT(id_filme) FROM filmes;

/* Aqui, observamos que há valores nulos na amostra, correspondentes a 250. Ou seja, cerca de 43% dos filmes alugados não foram avaliados.*/
SELECT nota, COUNT(id_filme) FROM alugueis WHERE nota IS NULL;

/* Eis a amostra sem valores nulos de nota, agrupadas por genero*/
SELECT f.genero, COUNT(a.id_filme) 
FROM alugueis AS a 
JOIN
filmes AS f
USING(id_filme)
WHERE nota IS NOT NULL 
GROUP BY f.genero;

/* Dentre as avaliações disponíveis, observamos que 82,6% apresentam nota >= 7, sendo 7 a nota mais comum */
SELECT nota, COUNT(id_filme) 
FROM alugueis WHERE nota IS NOT NULL 
GROUP BY nota ORDER BY nota DESC;

/* Cerca de 52% das notas 10 foram dadas a filmes de drama.
No entanto, essa quantidade corresponde a apenas 20,5% dos filmes de drama, considerando a quantidade total de filmes deste genero
que foram avaliados.

Quem recebeu, percentualmente, o maior número de notas 10 foi o genero Ação e Aventura
 */
SELECT f.genero, COUNT(a.id_filme) 
FROM alugueis AS a 
JOIN 
filmes AS f 
USING(id_filme)
WHERE a.nota=10
GROUP BY f.genero;

/* Ampliando a consideração de notas excelentes para 10 e 9, os filmes de Ação e aventura continuam com a preferência,
71,4% das avaliações 9 e 10, seguido do genero Arte, com 66,7% */
SELECT f.genero, COUNT(a.id_filme) 
FROM alugueis AS a 
JOIN 
filmes AS f 
USING(id_filme)
WHERE a.nota=10 OR a.nota=9
GROUP BY f.genero;

/* Confiramando os resultados das queries anterioes, o gênero mais bem avaliado é Ação e aventura,
seguido de Arte. */
SELECT f.genero, AVG(a.nota)
FROM filmes AS f
JOIN
alugueis AS a
USING(id_filme)
GROUP BY f.genero
ORDER BY AVG(a.nota) DESC;