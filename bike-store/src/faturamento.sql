USE bike_store;

-- Faturamento por produto e por marca

SELECT * FROM brands;

-- faturamento por produto

WITH faturamento (produto_id, produto, faturamento_produto) AS (
	SELECT o.product_id, p.product_name, (o.list_price * o.quantity) - o.discount 
	FROM order_items AS o
    JOIN
    products AS p
    USING(product_id))
SELECT 
	produto, ROUND(SUM(faturamento_produto),2)  AS faturamento_por_produto
FROM 
	faturamento AS f
GROUP BY 
	produto 
ORDER BY 
	faturamento_por_produto DESC;
    
   -- faturamento por marca
   
    WITH faturamento (produto_id, faturamento_produto) AS (
		SELECT product_id, (list_price * quantity) - discount 
		FROM order_items
    ),
		marcas (produto_id, marca_id, marca) AS (
			SELECT p.product_id, b.brand_id, b.brand_name
            FROM products AS p
            JOIN
            brands AS b
            USING(brand_id)
        )
SELECT 
	m.marca, ROUND(SUM(f.faturamento_produto),2)  AS faturamento_por_marca
    
FROM 
	faturamento AS f
JOIN
    marcas AS m
USING(produto_id)
GROUP BY 
	marca
ORDER BY 
	faturamento_por_marca DESC;

-- produto mais vendido por marca
-- vou usar: brands, products, order_itemsorders
-- vou exibir: nome marca, nome produto mais vendido, quantidade de venda

WITH MarcaProdutoQuantidade (marca_id, produto_id, quantidade_vendida) AS (
	SELECT
		p.brand_id, p.product_id, SUM(o.quantity) AS quantidade_vendida
	FROM
		products AS p
	JOIN
		order_items AS o 
	USING
		(product_id)
	GROUP BY
		p.brand_id, p.product_id
),
MaxQuantidadePorMarca (marca_id, quantidade_maxima) AS (
	SELECT
		marca_id, MAX(quantidade_vendida) AS quantidade_maxima
	FROM
		MarcaProdutoQuantidade
	GROUP BY
		marca_id
)
SELECT
	b.brand_name AS marca, p.product_name AS produto_mais_vendido, mq.quantidade_maxima AS quantidade_vendida
FROM
	MaxQuantidadePorMarca AS mq
JOIN
	MarcaProdutoQuantidade AS mpq 
USING
	(marca_id)
JOIN
	products AS p 
ON 
	mpq.produto_id = p.product_id
JOIN
	brands AS b 
ON 
	mq.marca_id = b.brand_id
WHERE 
	mq.quantidade_maxima = mpq.quantidade_vendida
ORDER BY
	quantidade_vendida DESC;
    
    
    
    
-- Produto mais vendido por categoria    
    
    WITH CategoriaProdutoQuantidade (categoria_id, produto_id, quantidade_vendida) AS (
	SELECT
		p.category_id, p.product_id, SUM(o.quantity) AS quantidade_vendida
	FROM
		products AS p
	JOIN
		order_items AS o 
	USING
		(product_id)
	GROUP BY
		p.category_id, p.product_id
),
MaxQuantidadePorCategoria (categoria_id, quantidade_maxima) AS (
	SELECT
		categoria_id, MAX(quantidade_vendida) AS quantidade_maxima
	FROM
		CategoriaProdutoQuantidade
	GROUP BY
		categoria_id
)
SELECT
	c.category_name AS categoria, p.product_name AS produto_mais_vendido, mq.quantidade_maxima AS quantidade_vendida
FROM
	MaxQuantidadePorCategoria AS mq
JOIN
	CategoriaProdutoQuantidade AS cpq 
USING
	(categoria_id)
JOIN
	products AS p 
ON 
	cpq.produto_id = p.product_id
JOIN
	categories AS c 
ON 
	mq.categoria_id = c.category_id
WHERE 
	mq.quantidade_maxima = cpq.quantidade_vendida
ORDER BY
	quantidade_vendida DESC;