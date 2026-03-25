-- @ separar name e tipo / % vários ips diferentes podem acessar esse user / ( localhost só localmente )
-- identified by = senha user
CREATE USER 'gestor'@'%' IDENTIFIED BY 'senha@123';

-- * todas os schemas . ( separara ) * todas as tabelas / primeiro * seleciona todos os esquemas, segundo * tabelas
-- GARANTE ( ALL PRIVILEGES ) - todos os privilegios
GRANT ALL PRIVILEGES ON DataLumini.* TO 'gestor'@'%';

-- confirmação dos comandos 
FLUSH PRIVILEGES;

-- estagiario
-- se você quer adicionar permissões especificas, você terá de digitar todos os comandos que ele pode fazer
GRANT SELECT ON DataLumini.* TO 'estagiario'@'%';

-- se eu quiser que o estágiario tenha permissões diferentes usando localhost ou % qualquer outro IP, trocaria o segundo '' depois da %
FLUSH PRIVILEGES;

-- tirando privilegios 
-- RETIRAR ( todos os privilegios ), ou retirar só permissões expecificas também
REVOKE ALL PRIVILEGES ON DataLumini.* FROM 'gestor'@'%';

FLUSH PRIVILEGES;

-- excluir usuarios

DROP USER 'gestor'@'%';
DROP USER 'estagiario'@'%';

-- cmd line WINDOWS:

-- cd 

/*
aluno@sptech01698:~$ mysql -u aluno -p
Enter password: 
ERROR 1045 (28000): Access denied for user 'aluno'@'localhost' (using password: YES)
aluno@sptech01698:~$ mysql -u aluno -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 21
Server version: 8.0.45-0ubuntu0.24.04.1 (Ubuntu)

Copyright (c) 2000, 2026, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> USE DataLumini
Database changed
mysql> USE DataLumini;
Database changed
mysql> DESC DataLumini;
ERROR 1146 (42S02): Table 'DataLumini.DataLumini' doesn't exist
mysql> CREATE TABLE data (
    -> nome varchar(40),
    -> nome varchar(40),
[1]+  Parado                  mysql -u aluno -p
aluno@sptech01698:~$ 
aluno@sptech01698:~$ myqsl -u aluno -p
Comando 'myqsl' não encontrado, você quis dizer:
  comando 'mysql' do deb mysql-client-core-8.0 (8.0.45-0ubuntu0.24.04.1)
  comando 'mysql' do deb mariadb-client-core (1:10.11.14-0ubuntu0.24.04.1)
Experimente: apt install <deb name>
aluno@sptech01698:~$ mysql -u aluno -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 22
Server version: 8.0.45-0ubuntu0.24.04.1 (Ubuntu)

Copyright (c) 2000, 2026, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> USE DataLumini
Database changed
mysql> CREATE TABLE data ( id INT PRIMARY KEY, nome VARCHAR(40) );
Query OK, 0 rows affected (0,59 sec)

mysql> SELECT * FROM data;
Empty set (0,03 sec)

mysql> INSERT INTO data (
    -> id, nome) VALUES
    -> (1, 'Caio');
Query OK, 1 row affected (0,10 sec)

mysql> SELECT * FROM data;
+----+------+
| id | nome |
+----+------+
|  1 | Caio |
+----+------+
1 row in set (0,00 sec)

mysql> exit
Bye
aluno@sptech01698:~$ ^C
aluno@sptech01698:~$ ^C
aluno@sptech01698:~$ 
*/

-- chave estrangeira

CREATE DATABASE ccoa;
USE ccoa;

CREATE TABLE turma (
	id_turma INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    ra CHAR(8),
    descrisao VARCHAR(20),
    periodo YEAR
);

CREATE TABLE aluno (
	id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    ra CHAR(8),
    dtNascimento DATE,
    fk_turma INT,
    CONSTRAINT cFkTurma FOREIGN KEY (fk_turma) REFERENCES turma(id_turma)
    -- referencia tabela turma(campo_turma)
);

INSERT INTO turma ( descrisao, periodo ) VALUES
	('1CCOA 20261', 2026),
    ('1CCOB 20261', 2026),
    ('1CCOK 20252', 2025);
    
INSERT INTO turma ( descrisao, periodo ) VALUES
	('1CCOK 20242', 2024),
    ('1CCOC 20232', 2023),
    ('2CCOK 20231', 2023);
    
SELECT * FROM turma;
    
INSERT INTO aluno (nome, ra, dtNascimento, Fk_turma) VALUES
	('Marcos Paulo', '04261999', '2007-10-10', 1),
    ('Rafael Canudo', '04261998', '2007-01-13', 2),
    ('George Smith', '04261997', '2006-02-27', 3);

INSERT INTO aluno (nome, ra, dtNascimento, Fk_turma) VALUES
	('Caio Picci', '04261499', '2006-10-10', 1),
    ('Gustavo Damn', '04261998', '2007-01-16', 3),
    ('Baka oioioi', '04261997', '2006-02-12', 2);
    
SELECT * FROM aluno;

CREATE TABLE disciplina(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    fk_turma INT,
    FOREIGN KEY (fk_turma) REFERENCES turma(id_turma)
);

ALTER TABLE disciplina DROP COLUMN fk_turma;

-- CONCEITO SELECT JOIN - Não existe JOIN SEM ON 

SELECT * FROM aluno JOIN turma ON aluno.fk_turma = turma.id_turma;

-- aluno ( table ) . id_aluno ( campo) 

SELECT aluno.id_aluno AS 'ID Aluno', 
	   turma.id_turma AS 'ID turma',
       aluno.nome AS 'Nome Aluno',
       turma.descrisao AS 'turma'
FROM aluno JOIN turma ON aluno.fk_turma = turma.id_turma WHERE id_turma = 1;

INSERT INTO disciplina (nome, fk_turma) VALUES
	('Banco de Dados', 1),
    ('Algoritimos', 2);

-- 3 tabelas

SELECT aluno.id_aluno AS 'ID Aluno', 
	   turma.id_turma AS 'ID turma',
       aluno.nome AS 'Nome Aluno',
       turma.descrisao AS 'turma',
       disciplina.nome AS 'Nome Disciplina'
FROM aluno
JOIN turma ON aluno.fk_turma = turma.id_turma
JOIN disciplina ON disciplina.fk_turma = turma.id_turma;

CREATE TABLE empresa (
	id_empresa INT PRIMARY KEY AUTO_INCREMENT,
    razao_social VARCHAR(45),
    cnpj CHAR(14)
);

CREATE TABLE pessoa (
	id_pessoa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cpnj CHAR(11),
    fk_empresa INT,
    CONSTRAINT cFk_empresa FOREIGN KEY (fk_empresa) REFERENCES empresa(id_empresa)
);

ALTER TABLE pessoa RENAME COLUMN cpnj TO cnpj;
 
INSERT INTO empresa ( razao_social, cnpj ) VALUES
	('Safra', '00000000000000');
    
INSERT INTO pessoa ( nome, cnpj, fk_empresa ) VALUES
	('Raphael Canudo', '99999999999', 1);
    
SELECT razao_social,nome FROM empresa JOIN pessoa ON id_empresa = fk_empresa
WHERE razao_social LIKE 'Safra%' ORDER BY nome DESC;
    
