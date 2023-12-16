USE hashtagmovie;

/* Preferências dos clientes por sexo e região, e o engajamento dos clientes( numero de clientes ativos) */

/* Temos 123 clientes */
SELECT COUNT(*) FROM clientes;

SELECT * FROM clientes LIMIT 5;

/*
Vejamos a quantidade de clientes ativos
*/
CREATE VIEW cliente_ativos AS 
SELECT COUNT(DISTINCT id_cliente) AS total_clientes_ativos FROM alugueis;
/* 94% dos clientes são ativos*/
SELECT * FROM cliente_ativos;

SELECT c.sexo, COUNT(DISTINCT id_cliente) AS ativos 
FROM clientes AS c 
JOIN
alugueis AS a
USING(id_cliente)
GROUP BY c.sexo;

/*
Não há diferenças significativas de sexo e região entre os clientes ativos
*/

SELECT c.regiao, COUNT(DISTINCT id_cliente) AS ativos 
FROM clientes AS c 
JOIN
alugueis AS a
USING(id_cliente)
GROUP BY c.regiao;


/*
Vemos que não há diferença significativa de sexo entre os clientes
*/
SELECT sexo, COUNT(*) FROM clientes GROUP BY sexo;

/*
A maioria é do sudeste, com 49,6% das assinaturas
*/
SELECT regiao, COUNT(*) FROM clientes GROUP BY regiao;
SELECT regiao, sexo, COUNT(*) FROM clientes GROUP BY regiao, sexo;

/*
Preferências por sexo
*/
SELECT f.genero, AVG(a.nota) 
FROM filmes AS f
JOIN
alugueis AS a
USING(id_filme)
JOIN
clientes AS c
USING(id_cliente)
WHERE a.nota IS NOT NULL 
AND c.sexo = 'Feminino'
GROUP BY f.genero
ORDER BY AVG(a.nota) DESC;

SELECT f.genero, AVG(a.nota) 
FROM filmes AS f
JOIN
alugueis AS a
USING(id_filme)
JOIN
clientes AS c
USING(id_cliente)
WHERE a.nota IS NOT NULL 
AND c.sexo = 'Masculino'
GROUP BY f.genero
ORDER BY AVG(a.nota) DESC;

/*
Homens preferem filmes de Ação e Aventura, seguido de Ficção e Fantasia.
Mulheres preferem filmes de Arte e Animação.
*/

/*
Agora, avaliemos a preferência por região.
*/
SELECT f.genero, AVG(a.nota) 
FROM filmes AS f
JOIN
alugueis AS a
USING(id_filme)
JOIN
clientes AS c
USING(id_cliente)
WHERE a.nota IS NOT NULL 
AND c.regiao = 'Nordeste'
GROUP BY f.genero
ORDER BY AVG(a.nota) DESC;

SELECT f.genero, AVG(a.nota) 
FROM filmes AS f
JOIN
alugueis AS a
USING(id_filme)
JOIN
clientes AS c
USING(id_cliente)
WHERE a.nota IS NOT NULL 
AND c.regiao = 'Norte'
GROUP BY f.genero
ORDER BY AVG(a.nota) DESC;

SELECT f.genero, AVG(a.nota) 
FROM filmes AS f
JOIN
alugueis AS a
USING(id_filme)
JOIN
clientes AS c
USING(id_cliente)
WHERE a.nota IS NOT NULL 
AND c.regiao = 'Sudeste'
GROUP BY f.genero
ORDER BY AVG(a.nota) DESC;

SELECT f.genero, AVG(a.nota) 
FROM filmes AS f
JOIN
alugueis AS a
USING(id_filme)
JOIN
clientes AS c
USING(id_cliente)
WHERE a.nota IS NOT NULL 
AND c.regiao = 'Sul'
GROUP BY f.genero
ORDER BY AVG(a.nota) DESC;

SELECT f.genero, AVG(a.nota) 
FROM filmes AS f
JOIN
alugueis AS a
USING(id_filme)
JOIN
clientes AS c
USING(id_cliente)
WHERE a.nota IS NOT NULL 
AND c.regiao = 'Centro-oeste'
GROUP BY f.genero
ORDER BY AVG(a.nota) DESC;

/*
Nordeste prefere Ação e Aventura
Norte prefere Comédia e Animação
Sudeste prefere Arte e Ação e Aventura
Sul prefere Ação e Aventura
Centro-oeste prefere Comédia (Arte e Ação e Aventura também muito bem avaliados)

*/



/*
Agora, vejamos a média por região
*/

SELECT c.regiao, AVG(a.nota)
FROM clientes AS c
JOIN
alugueis AS a
USING(id_cliente)
GROUP BY c.regiao
ORDER BY AVG(a.nota) DESC;

/* 
Sul, Sudeste e Centro-Oeste estão com avaliação abaixo da média. São, portanto, os menos satisfeitos com o catálogo.

Neste sentido, pode ser interessante investir em filmes que agradam mais a esses públicos, que são, como mencionados anteriormente, os seguintes:

Norte: Comédia e Animação
Sul: Ação e Aventura
Centro-oeste: Comédia (Arte e Ação e Aventura também muito bem avaliados)

*/