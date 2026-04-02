/*
Exercício 1.
No MySQL Workbench:
Crie um banco de dados chamado Sprint2;
Use o banco de dados Sprint2;
*/

CREATE DATABASE Sprint2;
USE Sprint2;

-- Escreva e execute os comandos para:

/*
Criar a tabela chamada Atleta para conter os dados: idAtleta (int e chave
primária da tabela), nome (varchar, tamanho 40), modalidade (varchar, tamanho
40), qtdMedalha (int, representando a quantidade de medalhas que o atleta
possui)
*/

CREATE TABLE Atleta (
	id_atleta INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    modalidade VARCHAR(40),
    qtd_medalha INT
);

/*
Inserir dados na tabela, procurando colocar mais de um atleta para cada
modalidade e pelo menos 5 atletas.
*/

INSERT INTO Atleta (nome, modalidade, qtd_medalha) VALUES
    ('Oleksandr Kostyliev (s1mple)', 'CS2', 21),
    ('Mathieu Herbaut (ZywOo)', 'CS2', 18),
    ('Nicolai Reedtz (dev1ce)', 'CS2', 24),
    ('Marcelo David (coldzera)', 'CS2', 19),
    ('Gabriel Toledo (FalleN)', 'CS2', 20);
    
/*
Criar uma tabela chamada País para conter os dados: idPais (int e chave primária
da tabela), nome (varchar, tamanho 30), capital (varchar, tamanho 40);
*/

CREATE TABLE País (
	id_pais INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30),
    capital VARCHAR(40)
);

/*
Inserir pelo menos 4 países na tabela país.
*/

INSERT INTO País (nome, capital) VALUES
    ('Brasil', 'Brasília'),
    ('Estados Unidos', 'Washington, D.C.'),
    ('França', 'Paris'),
    ('Japão', 'Tóquio');
    
/*
Fazer a modelagem lógica conforme a regra de negócio:
	1 país tem 1 ou muitos atletas;
	1 atleta é de 1 e somente 1 país;
*/

/*
Escreva e execute os comandos para:
*/

-- Criar a chave estrangeira na tabela correspondente conforme modelagem;
ALTER TABLE Atleta ADD COLUMN fk_pais INT;
ALTER TABLE Atleta ADD CONSTRAINT cFk_pais FOREIGN KEY (fk_pais) REFERENCES País(id_pais);

-- Atualizar o país de todos os atletas;

UPDATE Atleta SET fk_pais = '1' WHERE id_atleta = 1;
UPDATE Atleta SET fk_pais = '3' WHERE id_atleta = 2;
UPDATE Atleta SET fk_pais = '4' WHERE id_atleta = 3;
UPDATE Atleta SET fk_pais = '2' WHERE id_atleta = 4;
UPDATE Atleta SET fk_pais = '3' WHERE id_atleta = 5;

-- Exibir os atletas e seu respectivo país;

SELECT 
	Atleta.id_atleta AS 'Indentificador Atleta:',
	Atleta.nome AS 'Nome do Atleta:',
    País.nome AS 'País Atleta:'
	FROM País 
		JOIN Atleta ON País.id_pais = Atleta.fk_pais;

-- Exibir apenas o nome do atleta e o nome do respectivo país;

SELECT 
	Atleta.nome AS 'Nome do Atleta:',
    País.nome AS 'País Atleta:'
	FROM País 
			JOIN Atleta ON País.id_pais = Atleta.fk_pais
WHERE Atleta.id_atleta = 1;
    
-- Exibir os dados dos atletas, seus respectivos países, de uma determinada capital;
SELECT 
	Atleta.id_atleta AS 'Indentificador Atleta:',
	Atleta.nome AS 'Nome do Atleta:',
    País.nome AS 'País Atleta:',
    País.capital AS 'Capital:'
	FROM País 
		JOIN Atleta ON País.id_pais = Atleta.fk_pais
WHERE País.capital = 'Brasília';

/*
Exercício 2:
No MySQL Workbench, utilizando o banco de dados ‘sprint2’:
*/

/*
Criar a tabela chamada Musica para conter os dados: idMusica, titulo (tamanho
40), artista (tamanho 40), genero (tamanho 40), sendo que idMusica é a chave
primária da tabela.
*/

CREATE TABLE Musica (
	id_musica INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(40),
    artista VARCHAR(40),
    genero VARCHAR(40)
);

/*
Inserir dados na tabela, procurando colocar um gênero de música que tenha mais
de uma música, e um artista, que tenha mais de uma música cadastrada. Procure
inserir pelo menos umas 3 músicas.
*/

INSERT INTO Musica (titulo, artista, genero, fk_album) VALUES
    ('Evidências', 'Chitãozinho & Xororó', 'Sertanejo'),
    ('Fio de Cabelo', 'Chitãozinho & Xororó', 'Sertanejo'),
    ('Infiel', 'Marília Mendonça', 'Sertanejo'),
    ('Todo Mundo Vai Sofrer', 'Marília Mendonça', 'Sertanejo'),
    ('Notificação Preferida', 'Zé Neto & Cristiano', 'Sertanejo'),
    ('Largado às Traças', 'Zé Neto & Cristiano', 'Sertanejo');

/*
Criar a tabela chamada Album para conter os dados: idAlbum, nome, tipo (digital
ou físico) e dtLancamento (DATE).
*/

CREATE TABLE Album (
	id_album INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    tipo VARCHAR(40) CONSTRAINT cTipo CHECK(tipo IN('Digital', 'Fisíco')),
    dt_lancamento DATE
);

/*
Inserir pelo menos 2 albuns;
*/

INSERT INTO Album (nome, tipo, dt_lancamento) VALUES
    ('Evidências', 'Digital', '1990-01-01'),
    ('Realidade', 'Fisíco', '2017-01-20'),
    ('Esquece o Mundo Lá Fora', 'Fisíco', '2018-02-23'),
    ('Acústico Chitãozinho & Xororó', 'Digital', '2007-01-01');

/*
Fazer a modelagem lógica conforme a regra de negócio:
	1 album pode ter 1 ou muitas músicas;
	1 música é de 1 e somente 1 album;
*/

ALTER TABLE Musica ADD COLUMN fk_album INT;
ALTER TABLE Musica ADD CONSTRAINT cFk_album FOREIGN KEY (fk_album) REFERENCES Album(id_album);

UPDATE Musica SET fk_album = '1' WHERE id_musica = 1;
UPDATE Musica SET fk_album = '4' WHERE id_musica = 2;
UPDATE Musica SET fk_album = '2' WHERE id_musica = 3;
UPDATE Musica SET fk_album = '2' WHERE id_musica = 4;
UPDATE Musica SET fk_album = '3' WHERE id_musica = 5;
UPDATE Musica SET fk_album = '3' WHERE id_musica = 6;

-- Execute os comandos para:

-- a) Exibir todos os dados das tabelas separadamente;

SELECT * FROM Musica;
SELECT * FROM Album;

-- b) Criar a chave estrangeira na tabela de acordo com a regra de negócio (Já feito);
-- c) Atualizar os álbuns de cada música (Já feito);

-- d) Exibir as músicas e seus respectivos álbuns;

SELECT * FROM Album JOIN Musica ON Album.id_album = Musica.fk_album;

-- e) Exibir somente o título da música e o nome do seu respectivo álbum;

SELECT 
	Musica.titulo AS 'Nome da Música:',
    Album.nome AS 'Nome do Álbum:'
FROM Album 
		JOIN Musica ON Album.id_album = Musica.fk_album;
        
-- f) Exibir os dados das músicas e seu respectivo álbum, de um determinado tipo.

SELECT * FROM Album JOIN Musica ON Album.id_album = Musica.fk_album
	WHERE tipo = 'Digital';
    
/*
Exercício 3:

- Criar as tabelas;

*/

CREATE TABLE pessoa(
	id_pessoa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cpf CHAR(11)
);

CREATE TABLE Reserva(
	id_reserva INT PRIMARY KEY AUTO_INCREMENT,
    dt_reserva DATETIME,
    dt_retirada DATETIME,
    dt_devolucao DATETIME,
    fk_pessoa INT,
    CONSTRAINT cFk_pessoa FOREIGN KEY (fk_pessoa) REFERENCES pessoa(id_pessoa)
);

-- Inserir 5 registros

INSERT INTO pessoa (nome, cpf) VALUES
    ('Ana Souza', '12345678900'),
    ('Carlos Pereira', '98765432100'),
    ('Mariana Lima', '45612378900'),
    ('João Oliveira', '78932145600'),
    ('Fernanda Alves', '32165498700');
    
INSERT INTO Reserva (dt_reserva, dt_retirada, dt_devolucao, fk_pessoa) VALUES
    ('2026-03-22 10:00:00', '2026-03-23 08:00:00', '2026-03-25 18:00:00', 1),
    ('2026-03-22 11:30:00', '2026-03-24 09:00:00', '2026-03-26 17:00:00', 2),
    ('2026-03-23 09:15:00', '2026-03-24 10:00:00', '2026-03-27 16:00:00', 1),
    ('2026-03-23 14:00:00', '2026-03-25 08:30:00', '2026-03-28 19:00:00', 3),
    ('2026-03-24 08:45:00', '2026-03-26 09:00:00', '2026-03-29 18:00:00', 2),
    ('2026-03-24 16:20:00', '2026-03-27 07:30:00', '2026-03-30 20:00:00', 4);
    
-- Configurar chave estrangeira (Já feito)
-- Exibir dados;

SELECT * FROM pessoa JOIN Reserva ON pessoa.id_pessoa = Reserva.fk_pessoa;

-- Exibir dados com AS;

SELECT
	pessoa.nome AS 'Nome do Titular:',
	pessoa.cpf AS 'CPF do Titular:',
	Reserva.dt_reserva AS 'Data da Reserva:',
	Reserva.dt_retirada AS 'Data da Retirada:',
	Reserva.dt_devolucao AS 'Data da Devolução:'
FROM pessoa 
	JOIN Reserva ON pessoa.id_pessoa = Reserva.fk_pessoa;
    
-- Exibir dados com CASE:

SELECT
	pessoa.nome AS 'Nome do Titular:',
	pessoa.cpf AS 'CPF do Titular:',
	Reserva.dt_reserva AS 'Data da Reserva:',
	Reserva.dt_retirada AS 'Data da Retirada:',
    CASE 
		WHEN Reserva.dt_devolucao > '2026-03-29 17:00:00' THEN 'Atrasado'
        ELSE dt_devolucao
	END AS 'Data da Devolução:'
FROM pessoa
	JOIN Reserva ON pessoa.id_pessoa = Reserva.fk_pessoa;
    
-- Exibir dados com IFNULL;
UPDATE Reserva SET dt_devolucao = NULL WHERE id_reserva = 5;

SELECT
	pessoa.nome AS 'Nome do Titular:',
	pessoa.cpf AS 'CPF do Titular:',
	Reserva.dt_reserva AS 'Data da Reserva:',
	Reserva.dt_retirada AS 'Data da Retirada:',
    IFNULL(Reserva.dt_devolucao, 'Vazio!')
FROM pessoa
	JOIN Reserva ON pessoa.id_pessoa = Reserva.fk_pessoa;
    
-- Exercício 4:

-- Criar as tabelas;

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

-- Exercício 5:

/*
Referente a regra de negócio acima, cria a modelagem utilizando um relacionamento 1:1,
implemente com o script realizando os seguintes comandos:
*/

-- Criar as tabelas;

CREATE TABLE pessoaHab(
	id_pessoa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45)
);

CREATE TABLE habilitacao(
	id_habilitacao INT PRIMARY KEY AUTO_INCREMENT,
    categoria VARCHAR(45),
    validade DATE,
    acc VARCHAR(10),
	fk_pessoa INT UNIQUE,
    CONSTRAINT cCategoria CHECK (categoria IN('A', 'B', 'ACC', 'A e B')),
    CONSTRAINT cAcc CHECK (acc IN('Possui', 'Não-Possui')),
    CONSTRAINT cFk_pessoaHab FOREIGN KEY (fk_pessoa) REFERENCES pessoaHab(id_pessoa)
);

-- Inserir 5 registros

INSERT INTO pessoaHab (nome) VALUES
('Ana Souza'),
('Carlos Lima'),
('Mariana Alves'),
('João Pedro'),
('Fernanda Costa');

INSERT INTO habilitacao (categoria, validade, acc, fk_pessoa) VALUES
('A', '2027-03-22', 'Possui', 1),
('B', '2027-05-10', 'Não-Possui', 2),
('A e B', '2028-01-15', 'Possui', 3),
('B', '2027-09-30', 'Não-Possui', 4),
('A', '2026-12-01', 'Possui', 5);

-- Configurar chave estrangeira(feito)
-- Exibir dados;

SELECT * FROM pessoaHab JOIN habilitacao ON pessoaHab.id_pessoa = habilitacao.fk_pessoa;

-- Exibir dados com AS;

SELECT
	pessoaHab.nome AS 'Nome:',
	habilitacao.categoria AS 'Categoria:',
	habilitacao.validade AS 'Validade:',
    habilitacao.acc AS 'Situação ACC:'
FROM pessoaHab 
	JOIN habilitacao ON pessoaHab.id_pessoa = habilitacao.fk_pessoa;
    
-- Exibir dados com CASE;

SELECT
	pessoaHab.nome AS 'Nome:',
	habilitacao.categoria AS 'Categoria:',
	habilitacao.validade AS 'Validade:',
    CASE 
		WHEN habilitacao.acc = 'Não-Possui' THEN 'N/A'
        ELSE habilitacao.acc
	END AS 'Situação ACC:'
FROM pessoaHab 
	JOIN habilitacao ON pessoaHab.id_pessoa = habilitacao.fk_pessoa;
    
-- Exibir dados com IFNULL;

SELECT
	pessoaHab.nome AS 'Nome:',
	habilitacao.categoria AS 'Categoria:',
	habilitacao.validade AS 'Validade:',
    IFNULL(habilitacao.acc, 'Vazio!') AS 'Situação ACC:'
FROM pessoaHab 
	JOIN habilitacao ON pessoaHab.id_pessoa = habilitacao.fk_pessoa;
    
-- Exercício 6:

/*
1 Farmácia tem no mínimo 1 e no máximo 1 endereço, 1 endereço é de no mínimo 1 farmácia e no máximo 1.

1 Farmácia tem no mínimo 1 farmacêutico e no máximo n, 1 farmacêutico é de no mínimo 1 farmácia e no máximo 1.

- Criar a modelagem lógica na regra acima, com os campos de sua escolha.
*/
    