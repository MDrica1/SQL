USE curso_sql;

#Module 3 exercises

#Exercise1: Program the SQL code necessary to generate the structure of the database created 
#in the proposed exercise of the Data Normalization module.
#Note: It is not necessary to create the code that populates the tables, 
#as this is the theme of the next module.


CREATE TABLE tipo 
(
  codigo int unsigned not null auto_increment,
  tipo varchar(45) not null,
  PRIMARY KEY (codigo)
);

ALTER TABLE tipo CHANGE COLUMN tipo nome varchar(45) not null;

CREATE TABLE instrutor
(  
  codigo int unsigned not null auto_increment,
  nome varchar(45) not null,
  telefone varchar(20) default '',
  PRIMARY KEY (codigo)
);

CREATE TABLE curso
(
  codigo int unsigned not null auto_increment,
  curso varchar(40) not null,
  tipo int unsigned default null,
  nome_inst int unsigned default null,
  valor smallint default '0',
  PRIMARY KEY (codigo),
  CONSTRAINT fk_curso_tipo FOREIGN KEY (tipo) REFERENCES tipo (codigo),
  CONSTRAINT fk_curso_instrutor FOREIGN KEY (nome_inst) REFERENCES instrutor (codigo)
);

CREATE TABLE alunos
(
  codigo int unsigned not null auto_increment,
  nome varchar(45) not null,
  endereço varchar(90) default '',
  email varchar(50) default '',
  PRIMARY KEY (codigo) 
);

CREATE TABLE pedido
(
  codigo int unsigned not null auto_increment,
  aluno int unsigned default null,
  data_hora DATETIME NOT NULL,
  PRIMARY KEY (codigo),
  CONSTRAINT fk_pedido_aluno FOREIGN KEY (aluno) REFERENCES alunos (codigo)
);

CREATE TABLE pedido_detalhes
(
  pedido int unsigned,
  curso int unsigned,
  valor smallint,
  CONSTRAINT fk_detalhes_pedido FOREIGN KEY (pedido) REFERENCES pedido (codigo),
  CONSTRAINT fd_detalhes_curso FOREIGN KEY (curso) REFERENCES curso (codigo)
);

#Exercise 2: Changing structures in the database.

ALTER TABLE alunos ADD COLUMN data_nascimento varchar(10) default '';
ALTER TABLE alunos CHANGE COLUMN data_nascimento nascimento date;

CREATE INDEX aluno ON alunos (nome); 

ALTER TABLE instrutor ADD COLUMN email varchar(100) default '';

CREATE INDEX instrutor ON curso (nome_inst);

ALTER TABLE instrutor DROP COLUMN email;
