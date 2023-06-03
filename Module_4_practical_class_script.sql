#Module 4 practical class script.

USE curso_sql;

INSERT INTO funcionarios (id, nome, salario, departamento) VALUES (1,'Fernando','1400','TI');
INSERT INTO funcionarios (nome, salario, departamento) VALUES ('Guilherme','2500','Jurídico');
INSERT INTO funcionarios (nome, salario, departamento) VALUES ('Fábio','1700','TI');
INSERT INTO funcionarios (nome, salario, departamento) VALUES ('José','1800','Marketing');
INSERT INTO funcionarios (nome, salario, departamento) VALUES ('Isabela','2200','Jurídico');

SELECT * FROM funcionarios WHERE salario > 2000;

update funcionarios set salario = salario*1.1 where id=1;
SET SQL_SAFE_UPDATES = 0;
update funcionarios set salario = salario*1.1;
SET SQL_SAFE_UPDATES = 1;
SET SQL_SAFE_UPDATES = 0;
update funcionarios set salario = ROUND(salario*1.1,2);

DELETE FROM funcionarios WHERE id=4;

INSERT INTO veiculos (id_funcionario,veiculo,placa) VALUES(1,'carro','SB-0001');
INSERT INTO veiculos (id_funcionario,veiculo,placa) VALUES(1,'carro','SB-0002');

UPDATE veiculos SET id_funcionario=5 WHERE id=2;
SELECT * FROM veiculos;

INSERT INTO salarios (faixa,inicio,fim) VALUES ('Analista Jr.', 1000, 2000);
INSERT INTO salarios (faixa,inicio,fim) VALUES ('Analista Pleno', 2000, 4000);
SELECT * FROM salarios; 

#Apelidos
SELECT * FROM funcionarios f WHERE salario > 2000;
#Quando se trabalha com relacionamentos  e mais de uma tabela tem campos com o mesmo nome,
#se torna conveniente utilizar a apelidos e referenciar os campos da seguinte forma:

SELECT * FROM funcionarios f WHERE f.salario >2000; #mesmo após já ter sido criado o apelido, deve-se
#fazer a operação com o 'nome apelido'.

SELECT nome,salario FROM funcionarios f WHERE f.salario >2000;

#Apelidos para os campos:

SELECT nome AS 'Funcionário',salario FROM funcionarios f WHERE f.salario >2000;

#Utilizando o UNION
SELECT * FROM funcionarios WHERE nome='Guilherme';
SELECT * FROM funcionarios WHERE id=5;

SELECT * FROM funcionarios WHERE nome='Guilherme'
UNION
SELECT * FROM funcionarios WHERE id=5;

SELECT * FROM funcionarios WHERE nome='Guilherme'
UNION
SELECT * FROM funcionarios WHERE id=2;

SELECT * FROM funcionarios WHERE nome='Guilherme'
UNION ALL
SELECT * FROM funcionarios WHERE id=2;
