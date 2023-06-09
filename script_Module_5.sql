USE curso_sql;

#Script: Module 5 - Join and views

SELECT * FROM funcionarios;
SELECT * FROM veiculos;

#Creates a join between the funcionarios and veiculos tables
#returns only the rows that satisfy the condition
SELECT * FROM funcionarios INNER JOIN veiculos ON veiculos.id_funcionario = funcionarios.id; 
#putting nicknames
SELECT * FROM funcionarios f INNER JOIN veiculos v ON v.id_funcionario = f.id;

#left join: returns all returns all rows in the table on the left, 
#and returns "null" on rows in the other table that do not match.
SELECT * FROM funcionarios f LEFT JOIN veiculos v ON v.id_funcionario = f.id;
SELECT * FROM funcionarios f RIGHT JOIN veiculos v ON v.id_funcionario = f.id;

#uniting joins
SELECT * FROM funcionarios f LEFT JOIN veiculos v ON v.id_funcionario = f.id
UNION
SELECT * FROM funcionarios f RIGHT JOIN veiculos v ON v.id_funcionario = f.id;

INSERT INTO veiculos (id_funcionario, veiculo, placa) VALUES (null, "Moto", "SB-0003");

CREATE TABLE cpfs
(
	id int unsigned not null,
    cpf varchar(14) not null,
    PRIMARY KEY (id),
    CONSTRAINT fk_cpfs_funcionarios FOREIGN KEY (id) REFERENCES funcionarios (id)
);

INSERT INTO cpfs (id, cpf) VALUES (1, '111.111.111-11');
INSERT INTO cpfs (id, cpf) VALUES (2, '222.222.222-22');
INSERT INTO cpfs (id, cpf) VALUES (3, '333.333.333-33');
INSERT INTO cpfs (id, cpf) VALUES (5, '555.555.555-55');

SELECT * FROM cpfs;

SELECT * FROM funcionarios INNER JOIN cpfs ON funcionarios.id = cpfs.id;
SELECT * FROM funcionarios INNER JOIN cpfs USING(id); #another way to do it

CREATE TABLE clientes
(
	id int unsigned not null auto_increment,
    nome varchar(45) not null,
    quem_indicou int unsigned,
    PRIMARY KEY (id),
    CONSTRAINT fk_quem_indicou FOREIGN KEY (quem_indicou) REFERENCES clientes (id)
);#foreign key to another field of the same table

INSERT INTO clientes (id, nome, quem_indicou) VALUES (1, 'André', NULL);
INSERT INTO clientes (id, nome, quem_indicou) VALUES (2, 'Samuel', 1);
INSERT INTO clientes (id, nome, quem_indicou) VALUES (3, 'Carlos', 2);
INSERT INTO clientes (id, nome, quem_indicou) VALUES (4, 'Rafael', 1);

SELECT * FROM clientes;

#self join
SELECT a.nome AS CLIENTE, b.nome AS "QUEM INDICOU" FROM clientes a JOIN clientes b ON a.quem_indicou = b.id;
SELECT * FROM clientes a JOIN clientes b ON a.quem_indicou = b.id;

SELECT * FROM funcionarios 

#join with 3 tables: returns records that satisfy both conditions at the same time.
SELECT * FROM funcionarios INNER JOIN veiculos ON veiculos.id_funcionario = funcionarios.id 
INNER JOIN cpfs ON cpfs.id = funcionarios.id;

#Creates a view
#The following view shows all fields in the funcionarios table where 
#the salario column has a value greater than or equal to 1700.
CREATE VIEW funcionarios_a AS SELECT * FROM funcionarios WHERE salario >= 1700;

SELECT * FROM funcionarios_a; #retuns the vision created
UPDATE funcionarios SET salario = 1500 WHERE id = 3;

DROP VIEW funcionarios_a;
#creates a new vision with tjhe same name.
CREATE VIEW funcionarios_a AS SELECT * FROM funcionarios WHERE salario >= 2000;


