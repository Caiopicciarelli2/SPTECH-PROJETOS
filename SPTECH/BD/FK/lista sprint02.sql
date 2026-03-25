/*
Praticar - Sprint 2
*/

CREATE DATABASE Sprint02;
USE Sprint02;

/*
- Criar as tabelas;
*/

CREATE TABLE pessoa(
	id_pessoa INT PRIMARY KEY AUTO_INCREMENT,
    nome_pessoa VARCHAR(45),
    cpf_pessoa CHAR(11)
);

/*
- Configurar chave estrangeira
*/

CREATE TABLE reserva(
	id_reserva INT PRIMARY KEY AUTO_INCREMENT,
    dtReserva DATETIME,
    dtRetirada DATETIME,
    dtDevolucao DATETIME,
    fk_pessoa INT,
    CONSTRAINT cFk_pessoa FOREIGN KEY (fk_pessoa) REFERENCES pessoa(id_pessoa) -- chave estrangeira
);

/*
- Inserir 5 registros
*/

INSERT INTO pessoa (nome_pessoa, cpf_pessoa) VALUES
	('Caio Picciarelli Silva', 11999999999),
    ('Robertos Carlos Almeida', 98765456787),
    ('Guilherme cadque lala', 11111111111),
    ('Damn Bro W FLK', 98989765431),
    ('Luiz Carlos', 12345678901);
    
INSERT INTO reserva (dtReserva, dtRetirada, dtDevolucao, fk_pessoa) VALUES
	('2020-02-08', '2020-02-11', '2020-02-15', 1),
    ('2021-06-23', '2021-07-01', '2022-01-02', 2),
    ('2019-05-04', '2019-05-06', '2019-05-05', 3),
    ('2023-10-13', '2023-11-14', '2023-12-18', 4),
    ('2004-04-03', '2005-11-17', '2006-07-09', 5);
 
/*
- Exibir dados;
*/

SELECT * FROM pessoa;
SELECT * FROM reserva JOIN pessoa ON reserva.fk_pessoa = pessoa.id_pessoa;

/*
- Exibir dados com AS;
*/

SELECT 
	fk_pessoa AS 'Indentificador Estrangeiro:',
    nome_pessoa AS 'Nome Cliente:',
    dtReserva AS 'Data de Reserva:'
FROM reserva JOIN pessoa ON reserva.fk_pessoa = pessoa.id_pessoa;

/*
- Exibir dados com CASE;
*/

SELECT
	id_pessoa AS 'Identificador:',
    nome_pessoa AS 'Nome Cliente:',
    dtReserva AS 'Data de Reserva:',
    dtRetirada AS 'Data de Retirada:',
    CASE 
		WHEN id_pessoa = 2 THEN 'Vazio'
        ELSE IFNULL(dtDevolucao, 'Sem Devolução!')
	END AS 'Data de Devolução:'
FROM reserva  JOIN pessoa ON reserva.fk_pessoa = pessoa.id_pessoa;


/*
- Exibir dados com IFNULL;
*/

UPDATE reserva SET dtDevolucao = NULL WHERE id_reserva = 1;

SELECT 
	id_pessoa AS 'Identificador:',
    nome_pessoa AS 'Nome Cliente:',
    dtReserva AS 'Data de Reserva:',
    dtRetirada AS 'Data de Retirada:',
    IFNULL(dtDevolucao, 'Sem Devolução!') AS 'Data de Devolução:'
FROM reserva  JOIN pessoa ON reserva.fk_pessoa = pessoa.id_pessoa;

/*
Exercício 2:
*/

/*
- Criar as tabelas;
*/

CREATE TABLE pessoa1(
	id_pessoa1 INT PRIMARY KEY AUTO_INCREMENT,
    nome_pessoa1 VARCHAR(45),
    dtNascimento_pessoa1 DATE
);

/*
- Configurar chave estrangeira
*/

CREATE TABLE pessoa2(
	id_pessoa2 INT PRIMARY KEY AUTO_INCREMENT,
    nome_pessoa2 VARCHAR(45),
    dtNascimento_pessoa2 DATE,
    fk_pessoa1 INT,
    CONSTRAINT cFk_pessoa1 FOREIGN KEY (fk_pessoa1) REFERENCES pessoa1(id_pessoa1) -- chave estrangeira
);

/*
- Inserir 5 registros
*/


INSERT INTO pessoa1 (nome_pessoa1, dtNascimento_pessoa1) VALUES
	('Caio Picciarelli Silva', '2020-02-08'),
    ('Robertos Carlos Almeida', '2020-02-11'),
    ('Guilherme cadque lala', '2022-01-02'),
    ('Damn Bro W FLK', '2023-12-18'),
    ('Luiz Carlos', '2006-07-09');
    
INSERT INTO pessoa2 (nome_pessoa2, dtNascimento_pessoa2, fk_pessoa1) VALUES
	('Mariana Oliveira Santos', '1998-04-12', 1),
    ('Carlos Eduardo Ferreira', '1987-09-30', 2),
    ('Patricia Gomes Ribeiro', '2001-01-25', 3),
    ('Fernando Henrique Costa', '1995-07-18', 4),
    ('Juliana Martins Lopes', '2003-11-09', 5);
    
/*
- Exibir dados;
*/

SELECT * FROM pessoa1;
SELECT * FROM pessoa2;

SELECT * FROM pessoa2 JOIN pessoa1 ON pessoa2.fk_pessoa1 = pessoa1.id_pessoa1;

/*
- Exibir dados com AS;
*/

SELECT id_pessoa1 AS 'Identificador, Grupo de Pessoas 01:',
	   nome_pessoa1 AS 'Nome, Grupo de Pessoas 01:',
       fk_pessoa1 AS 'Identificador Estrangeiro, Grupo de Pessoas 02:',
       id_pessoa2 AS 'Identificador, Grupo de Pessoas 02:',
       nome_pessoa2 AS 'Nome, Grupo de Pessoas 02:'
FROM pessoa2 JOIN pessoa1 ON pessoa2.fk_pessoa1 = pessoa1.id_pessoa1;

/*
- Exibir dados com CASE;
*/
    
SELECT
	id_pessoa1 AS 'Identificador, Grupo de Pessoas 01:',
	nome_pessoa1 AS 'Nome, Grupo de Pessoas 01:',
	fk_pessoa1 AS 'Identificador Estrangeiro, Grupo de Pessoas 02:',
    CASE 
		WHEN id_pessoa1 = 2 THEN 'Vazio'
        ELSE nome_pessoa2
	END AS 'Identificador, Grupo de Pessoas 02:'
FROM pessoa2  JOIN pessoa1 ON pessoa2.fk_pessoa1 = pessoa1.id_pessoa1;

/*
- Exibir dados com IFNULL;
*/

UPDATE pessoa2 SET nome_pessoa2 = NULL WHERE id_pessoa2 = 1;
SELECT id_pessoa1, IFNULL(nome_pessoa2, 'Damn') FROM pessoa2 JOIN pessoa1 ON pessoa2.fk_pessoa1 = pessoa1.id_pessoa1;

/*
Exercício 3:
*/


