#Script: Module 6 - Special functions and subqueries

USE curso_sql;

SELECT * FROM funcionarios;
#count of number of registers
SELECT COUNT(*) FROM funcionarios;
SELECT COUNT(*) FROM funcionarios WHERE salario > 2000;
SELECT COUNT(*) FROM funcionarios WHERE salario > 1600 AND departamento = 'Jurídico';

#SUM
SELECT SUM(salario) FROM funcionarios;
SELECT SUM(salario) FROM funcionarios WHERE departamento = 'TI';

#Average
SELECT AVG(salario) FROM funcionarios;
SELECT AVG(salario) FROM funcionarios WHERE departamento = 'TI';

#MAX
SELECT MAX(salario) FROM funcionarios;
SELECT MAX(salario) FROM funcionarios WHERE departamento = 'TI';

#MIN
SELECT MIN(salario) FROM funcionarios;
SELECT MIN(salario) FROM funcionarios WHERE departamento = 'TI';

#DISTINCT: NO REPEAT
SELECT DISTINCT(departamento) FROM funcionarios;

#ORDER BY
SELECT * FROM funcionarios ORDER BY nome;
SELECT * FROM funcionarios ORDER BY nome DESC;

SELECT * FROM funcionarios ORDER BY salario;
SELECT * FROM funcionarios ORDER BY salario DESC;

SELECT * FROM funcionarios ORDER BY departamento;
SELECT * FROM funcionarios ORDER BY departamento, salario;
SELECT * FROM funcionarios ORDER BY departamento DESC, salario DESC;

#limit
SELECT * FROM funcionarios LIMIT 2;

#skip records
SELECT * FROM funcionarios LIMIT 1, 2; #skips 1 record, and limits the result to two records, with the exception of the record that was skipped
#another way, using OFFSET parameter
SELECT  * FROM funcionarios LIMIT 2 OFFSET 1;

#GROUP BY
SELECT departamento, AVG(salario) AS 'Média salarial' FROM funcionarios GROUP BY departamento;
#Show only the column you are using for grouping, and the arithmetic functions
#HAVING
SELECT departamento, AVG(salario) FROM funcionarios GROUP BY departamento HAVING AVG(salario) > 2000;

#Subqueries (IN/NOT IN)
SELECT nome FROM funcionarios 
WHERE departamento IN 
(
    SELECT departamento FROM funcionarios GROUP BY departamento HAVING AVG(salario) > 2000
);

