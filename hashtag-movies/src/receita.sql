USE hashtagmovie;

/* Determinar a receita da empresa através do número de locações
receita = SOMATORIO (QF * preço)
QF = quantidade de vezes que um filme foi alugado

*/

CREATE VIEW receita_por_filme AS
SELECT  ROUND(COUNT(*) * f.preco_aluguel,2) AS receita, a.id_filme, COUNT(*) AS quant_alugueis, f.preco_aluguel
FROM alugueis AS a
JOIN filmes AS f USING(id_filme)
GROUP BY a.id_filme, f.preco_aluguel
ORDER BY receita DESC;

SELECT * FROM receita_por_filme;

SELECT ROUND(SUM(receita_por_filme),2) AS receita_total FROM receita_por_filme;
