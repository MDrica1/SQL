#Exercise 6
USE curso_sql;

SELECT * FROM pedido;
#names of students who have already enrolled
SELECT DISTINCT(a.nome) FROM alunos a INNER JOIN pedido p ON a.codigo = p.aluno;  
#most recent e most old student: order by order date, in descending order, and limit to the first record
SELECT a.nome FROM alunos a INNER JOIN pedido p ON a.codigo=p.aluno ORDER BY p.data_hora DESC LIMIT 1; 
SELECT a.nome FROM alunos a INNER JOIN pedido p ON a.codigo=p.aluno ORDER BY p.data_hora LIMIT 1; 
#3th most old student 
SELECT a.nome FROM alunos a INNER JOIN pedido p ON a.codigo=p.aluno ORDER BY p.data_hora LIMIT 2,1;

SELECT * FROM pedido_detalhes;
SELECT COUNT(*) FROM pedido_detalhes; 
SELECT SUM(valor) FROM pedido_detalhes; #amount raised from the sale of courses
SELECT AVG(valor) FROM pedido_detalhes WHERE pedido = 2; 
SELECT MAX(valor) FROM curso;
SELECT MIN(valor) FROM curso;
#grouping
SELECT pedido, SUM(valor) FROM pedido_detalhes GROUP BY pedido;
#name of instructor and number of courses taught
SELECT a.nome AS 'instrutor', COUNT(b.codigo) AS 'cursos ministrados' FROM instrutor a INNER JOIN curso b ON a.codigo = b.nome_inst GROUP BY a.nome;

#join, grouping an having
SELECT d.pedido AS 'Nº do pedido', a.nome AS 'aluno', SUM(d.valor) AS 'valor total' FROM pedido p 
INNER JOIN 
alunos a ON a.codigo = p.aluno 
INNER JOIN 
pedido_detalhes d ON d.pedido = p.codigo
GROUP BY d.pedido 
HAVING
SUM(d.valor) > 500;

SELECT d.pedido AS 'Nº do pedido', a.nome AS 'aluno', COUNT(d.curso) AS 'cursos comprados' FROM pedido p 
INNER JOIN 
alunos a ON a.codigo = p.aluno 
INNER JOIN 
pedido_detalhes d ON d.pedido = p.codigo
GROUP BY d.pedido 
HAVING
COUNT(d.valor) >= 2;

SELECT nome, endereço FROM alunos WHERE endereço LIKE 'Av%';
SELECT curso FROM curso WHERE curso LIKE '%java%';

#SUBQUERIES
SELECT * FROM curso;
SELECT * FROM pedido_detalhes;
SELECT c.curso, (SELECT MIN(d.valor) FROM pedido_detalhes d WHERE d.curso = c.codigo) AS 'menor valor' FROM curso c;


SELECT curso FROM curso WHERE tipo IN 
(
  SELECT codigo FROM tipo WHERE nome = 'Programação'
);

#using EXISTS
SELECT curso FROM curso WHERE EXISTS 
(
  SELECT codigo FROM tipo WHERE tipo.codigo = curso.tipo AND tipo.nome = 'Programação'
); #tem de ter essa estrutura na subconsulta com EXISTS

SELECT * FROM instrutor;
SELECT * FROM curso;
SELECT * FROM pedido_detalhes;

SELECT nome AS 'instrutor', (
			   SELECT SUM(d.valor) FROM pedido_detalhes d INNER JOIN  curso c ON d.curso = c.codigo 
			   WHERE c.nome_inst = i.codigo
               ) AS 'Total de vendas' FROM instrutor i;

#creating a view with subquery
CREATE VIEW gastos_alunos AS SELECT a.nome AS 'aluno', (
	SELECT SUM(d.valor) FROM pedido_detalhes d INNER JOIN pedido p ON p.codigo = d.pedido 
    WHERE p.aluno = a.codigo
                                                        ) AS 'Total de gasto' FROM alunos a;
SELECT * FROM gastos_alunos;
