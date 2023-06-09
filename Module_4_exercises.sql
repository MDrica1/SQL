#Module 4 exercises

#Exercise 1: Using the database created in the previous modules, create SQL commands to insert the presented data

USE curso_sql;

INSERT INTO tipo VALUES (1,'Banco de dados');
INSERT INTO tipo VALUES (2,'Programação');
INSERT INTO tipo VALUES (3,'Modelagem de dados');

SELECT * FROM tipo;

INSERT INTO instrutor VALUES (1,'André Milani','1111-1111');
INSERT INTO instrutor VALUES (2,'Carlos tosin','1212-1212');

INSERT INTO curso VALUES (1,'Java Fudamentos',2,2,270);
INSERT INTO curso VALUES (2,'Java Avançado',2,2,330);
INSERT INTO curso VALUES (3,'SQL Completo',1,1,170);
INSERT INTO curso VALUES (4,'PHP Básico',2,1,270);

INSERT INTO alunos (codigo, nome, endereço, email) VALUES (1,'José','Rua XV de Novembro 72','jose@softblue.com.br');
INSERT INTO alunos (codigo, nome, endereço, email) VALUES (2,'Wagner','Av. Paulista','wagner@softblue.com.br');
INSERT INTO alunos (codigo, nome, endereço, email) VALUES (3,'Emíolio','Rua Lajes 103, apt: 701','emilio@softblue.com.br');
INSERT INTO alunos (codigo, nome, endereço, email) VALUES (4,'Cris','Rua Tauney 22','cris@softblue.com.br');
INSERT INTO alunos (codigo, nome, endereço, email) VALUES (5,'Regina','Rua Salles 305','regina@softblue.com.br');
INSERT INTO alunos (codigo, nome, endereço, email) VALUES (6,'Fernando','Av. Central 30','fernando@softblue.com.br');

INSERT INTO pedido VALUES (1, 2, '2010-04-15 11:23:32');
INSERT INTO pedido VALUES (2, 2, '2010-04-15 14:36:21');
INSERT INTO pedido VALUES (3, 3, '2010-04-16 11:17:45');
INSERT INTO pedido VALUES (4, 4, '2010-04-17 14:27:22');
INSERT INTO pedido VALUES (5, 5, '2010-04-18 11:18:19');
INSERT INTO pedido VALUES (6, 6, '2010-04-19 13:47:35');
INSERT INTO pedido VALUES (7, 6, '2010-04-20 18:13:44');

INSERT INTO pedido_detalhes VALUES (1, 1, 270);
INSERT INTO pedido_detalhes VALUES (1, 2, 330);
INSERT INTO pedido_detalhes VALUES (2, 1, 270);
INSERT INTO pedido_detalhes VALUES (2, 2, 330);
INSERT INTO pedido_detalhes VALUES (2, 3, 170);
INSERT INTO pedido_detalhes VALUES (3, 4, 270);
INSERT INTO pedido_detalhes VALUES (4, 2, 330);
INSERT INTO pedido_detalhes VALUES (4, 4, 270);
INSERT INTO pedido_detalhes VALUES (5, 3, 170);
INSERT INTO pedido_detalhes VALUES (6, 3, 170);
INSERT INTO pedido_detalhes VALUES (7, 4, 270);

#Exercise 2: Using SELECT and WHERE

SELECT * FROM alunos;
SELECT curso FROM curso;
SELECT curso,valor FROM curso WHERE valor>200;
SELECT curso,valor FROM curso WHERE valor>200 AND valor<300;
SELECT * FROM pedido WHERE data_hora BETWEEN '2010-04-15' AND '2010-04-19';
SELECT * FROM pedido WHERE DATE(data_hora) = '2010-04-15';

#Exercicio 3: Update data from created tables.

UPDATE alunos SET endereço='Av. Brasil 778' WHERE nome='José';
UPDATE alunos SET email='cristiano@softblue.com.br' WHERE nome='Cris';
#SET SQL_SAFE_UPDATES=0;
#SET SQL_SAFE_UPDATES=1
UPDATE curso SET valor=valor*1.1 WHERE valor < 300;
SELECT * FROM curso;
UPDATE curso SET curso='Php Fundamentos' WHERE codigo=4;
