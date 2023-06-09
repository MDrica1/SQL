USE curso_sql;

#Exercises: Module 5 - Creating relationships and views

#Exercise 1
#shows the courses' names and your classification.
SELECT a.curso, b.nome AS tipo FROM curso a JOIN  tipo b ON a.tipo = b.codigo; 
#shows courses' name, instructor's name, type and number of contact of instructor
SELECT a.curso, b.nome AS tipo, c.nome AS instrutor, c.telefone FROM curso a 
JOIN  tipo b ON a.tipo = b.codigo JOIN instrutor c ON a.nome_inst = c.codigo; 

SELECT * FROM pedido_detalhes;
SELECT p.codigo AS "Código do pedido", p.data_hora AS "Data/hora", 
d.curso AS "Código do curso" FROM pedido p JOIN pedido_detalhes d ON p.codigo = d.pedido; 

SELECT p.codigo AS "Código do pedido", p.data_hora AS "Data/hora", 
a.curso AS "Nome do curso" FROM pedido p JOIN pedido_detalhes d ON p.codigo = d.pedido JOIN curso a ON a.codigo=d.curso; 

SELECT * FROM pedido;

SELECT p.codigo AS "Código do pedido", p.data_hora AS "Data/hora", al.nome AS aluno,
a.curso AS "Nome do curso" FROM pedido p JOIN pedido_detalhes d ON p.codigo = d.pedido JOIN alunos al
ON al.codigo = p.aluno JOIN curso a ON a.codigo=d.curso; 
SELECT * FROM tipo;

#Exercise 2
#creating views
CREATE VIEW cursos_s AS SELECT curso, valor FROM curso WHERE tipo = 2;
SELECT * FROM cursos_s; 

CREATE VIEW cursos_2 AS SELECT a.curso, b.nome AS tipo, c.nome  AS instrutor FROM curso a JOIN tipo b ON a.tipo = b.codigo
JOIN instrutor c ON a.nome_inst = c.codigo;
SELECT * FROM cursos_2; 

CREATE VIEW pedidos AS SELECT p.codigo, a.nome, p.data_hora FROM pedido p JOIN alunos a 
ON a.codigo = p.aluno;
SELECT * FROM pedidos; 
