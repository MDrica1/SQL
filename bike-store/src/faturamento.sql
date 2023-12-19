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
	produto_id, produto, ROUND(SUM(faturamento_produto),2)  AS faturamento_por_produto
FROM 
	faturamento AS f
GROUP BY 
	produto_id, produto 
ORDER BY 
	produto_id;
    
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
	m.marca_id, m.marca, ROUND(SUM(f.faturamento_produto),2)  AS faturamento_por_marca
    
FROM 
	faturamento AS f
JOIN
    marcas AS m
USING(produto_id)
GROUP BY 
	marca_id, marca
ORDER BY 
	marca_id;

