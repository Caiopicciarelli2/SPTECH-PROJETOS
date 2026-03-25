-- Prática 2 BD

-- 1) No MySQL Workbench, utilizando o banco de dados ‘sprint1’:

CREATE DATABASE sprint1;

USE sprint1;

-- Escreva e execute os comandos para:

/*
Criar a tabela chamada Atleta para conter os dados: idAtleta (int e chave primária da
tabela), nome (varchar, tamanho 40), modalidade (varchar, tamanho 40), qtdMedalha
(int, representando a quantidade de medalhas que o atleta possui)
*/

CREATE TABLE Atleta ( 
	idAtleta INT PRIMARY KEY,
    nome VARCHAR(40),
    modalidade VARCHAR(40),
    qtdMedalha INT
);

/*
Inserir dados na tabela, procurando colocar mais de um atleta para cada modalidade
e pelo menos 5 atletas.
*/

INSERT INTO Atleta ( idAtleta, nome, modalidade, qtdMedalha ) VALUES
	(1, 'Caio Picciarelli', 'Ping Pong', 5),
	(2, 'Guilherme Barbosa', 'Ping Pong', 2),
	(3, 'Lucas Rossi', 'Futebol', 1),
	(4, 'Jõao Vitor', 'Futebol', 8),
	(5, 'Carlos Alberto', 'Handebol', 0),
	(6, 'Ana Carolina', 'Handebol', 3);

-- Escreva e execute os comandos para:

-- Exibir todos os dados da tabela.

SELECT * FROM Atleta;

-- Atualizar a quantidade de medalhas do atleta com id=1;

UPDATE Atleta SET qtdMedalha = 3 WHERE idAtleta = 1;
SELECT * FROM Atleta;

-- Atualizar a quantidade de medalhas do atleta com id=2 e com o id=3;

UPDATE Atleta SET qtdMedalha = 10 WHERE idAtleta IN ( 2,3 );
SELECT * FROM Atleta;

-- Atualizar o nome do atleta com o id=4;

UPDATE Atleta SET nome = 'Biribinha' WHERE idAtleta = 4;
SELECT * FROM Atleta;

-- Adicionar o campo dtNasc na tabela, com a data de nascimento dos atletas, tipo date;

ALTER TABLE Atleta ADD COLUMN dtNasc date;
DESCRIBE Atleta;

-- Atualizar a data de nascimento de todos os atletas;

UPDATE Atleta SET dtNasc = '2001-01-31' WHERE idAtleta = 1;
UPDATE Atleta SET dtNasc = '2005-06-12' WHERE idAtleta = 2;
UPDATE Atleta SET dtNasc = '2013-12-08' WHERE idAtleta = 3;
UPDATE Atleta SET dtNasc = '1999-01-01' WHERE idAtleta = 4;
UPDATE Atleta SET dtNasc = '2020-03-27' WHERE idAtleta = 5;
UPDATE Atleta SET dtNasc = '1998-07-21' WHERE idAtleta = 6;
SELECT * FROM Atleta;

-- Excluir o atleta com o id=5;

DELETE FROM Atleta WHERE idAtleta = 5;
SELECT * FROM Atleta;

-- Exibir os atletas onde a modalidade é diferente de natação;

SELECT * FROM Atleta WHERE modalidade != 'natação';

-- Exibir os dados dos atletas que tem a quantidade de medalhas maior ou igual a 3;

SELECT * FROM Atleta WHERE qtdMedalha >= 3;

-- Modificar o campo modalidade do tamanho 40 para o tamanho 60;

ALTER TABLE Atleta MODIFY COLUMN modalidade VARCHAR(60);

-- Descrever os campos da tabela mostrando a atualização do campo modalidade; 

DESCRIBE Atleta;

-- Limpar os dados da tabela;

TRUNCATE Atleta;
SELECT * FROM Atleta;

-- 2) No MySQL Workbench, utilizando o banco de dados ‘sprint1’:

/*
Criar a tabela chamada Musica para conter os dados: idMusica, titulo (tamanho 40), artista
(tamanho 40), genero (tamanho 40), sendo que idMusica é a chave primária da tabela.
*/

CREATE TABLE Musica (
	idMusica INT PRIMARY KEY,
    titulo VARCHAR(40),
    artista VARCHAR(40),
    genero VARCHAR(40)
);

/*
Inserir dados na tabela, procurando colocar um gênero de música que tenha mais de uma
música, e um artista, que tenha mais de uma música cadastrada. Procure inserir pelo
menos umas 7 músicas.
*/

INSERT INTO Musica ( idMusica, titulo, artista, genero ) VALUES
	(1, 'Visões', 'VEIGH', 'TRAP'),
	(2, 'Vem Desestressar', 'VEIGH', 'TRAP'),
	(3, 'Camisa 10', 'Grupo Revelação', 'Pagode'),
	(4, 'Deixa Alagar', 'Grupo Revelação', 'Pagode'),
	(5, 'BUM BUM TAM TAM', 'MC FIOTE', 'FUNK'),
	(6,'VOCÊ ME DEIXOU', 'MC FIOTE', 'FUNK'),
	(7, 'AROCHEDA', 'BARÕES DA PISADINHA', 'FORRÓ'),
	(8, 'JÁ QUE ME ENSINOU A BEBER', 'BARÕES DA PISADINHA', 'FORRÓ');
    
-- Execute os comandos para:

-- a) Exibir todos os dados da tabela.

SELECT * FROM Musica;

-- b) Adicionar o campo curtidas do tipo int na tabela;

ALTER TABLE Musica ADD COLUMN curtidas INT;
DESC Musica;

-- c) Atualizar o campo curtidas de todas as músicas inseridas;

UPDATE Musica SET curtidas = 1 WHERE idMusica = 1;
UPDATE Musica SET curtidas = 12 WHERE idMusica = 2;
UPDATE Musica SET curtidas = 7 WHERE idMusica = 3;
UPDATE Musica SET curtidas = 10 WHERE idMusica = 4;
UPDATE Musica SET curtidas = 4 WHERE idMusica = 5;
UPDATE Musica SET curtidas = 0 WHERE idMusica = 6;
UPDATE Musica SET curtidas = 78 WHERE idMusica = 7;
UPDATE Musica SET curtidas = 2 WHERE idMusica = 8;
SELECT * FROM Musica;

-- d) Modificar o campo artista do tamanho 40 para o tamanho 80;

ALTER TABLE Musica MODIFY COLUMN artista VARCHAR(80);
DESC Musica;

-- e) Atualizar a quantidade de curtidas da música com id=1;

UPDATE Musica SET curtidas = 100 WHERE idMusica = 1;
SELECT * FROM Musica;

-- f) Atualizar a quantidade de curtidas das músicas com id=2 e com o id=3;

UPDATE Musica SET curtidas = 199 WHERE idMusica IN ( 2,3 );
SELECT * FROM Musica;

-- g) Atualizar o nome da música com o id=5;

UPDATE Musica SET titulo = 'Damn' WHERE idMusica = 5;
SELECT * FROM Musica;

-- h) Excluir a música com o id=4;

DELETE FROM Musica WHERE idMusica = 4;
SELECT * FROM Musica;

-- i) Exibir as músicas onde o gênero é diferente de funk;

SELECT * FROM Musica WHERE genero != 'FUNK';

-- j) Exibir os dados das músicas que tem curtidas maior ou igual a 20;

SELECT * FROM Musica WHERE curtidas >= 20;

-- k) Descrever os campos da tabela mostrando a atualização do campo artista;

DESC Musica;

-- l) Limpar os dados da tabela;

TRUNCATE Musica;


-- 3) No MySQL Workbench, utilizando o banco de dados ‘sprint1’:

/*
Criar a tabela chamada Filme para conter os dados: idFilme, título (tamanho 50), genero
(tamanho 40), diretor (tamanho 40), sendo que idFilme é a chave primária da tabela.
*/

CREATE TABLE Filme (
	idFilme INT PRIMARY KEY,
    titulo VARCHAR(50),
    genero VARCHAR(40),
    diretor VARCHAR(40)
);

/*
Inserir dados na tabela, procurando colocar um gênero de filme que tenha mais de um
filme, e um diretor, que tenha mais de um filme cadastrado. Procure inserir pelo menos
uns 7 filmes.
*/

INSERT INTO Filme ( idFilme, titulo, genero, diretor ) VALUES
	(1, 'CAMPNOU 1', 'Drama', 'Roberto de Andrade Carvalho'),
	(2, 'CAMPNOU, O RESGATE', 'Drama', 'Roberto de Andrade Carvalho'),
	(3, 'A PISCINA E O CHURRASCO', 'Comedia', 'Carlinhos Pereira Silva'),
	(4, 'A PISCINA E O SOL', 'Comedia', 'Carlinhos Pereira Silva'),
	(5, 'O MATADOR 12', 'Ação', 'Juscelino Kubchek'),
	(6,'O MATADOR, A VINGANÇA', 'Ação', 'Juscelino Kubchek'),
	(7, 'A ROCHA E A LUA', 'Aventura', 'Fabiana Carolina André'),
	(8, 'A ROCHA E O TUBARÃO', 'Aventura', 'Fabiana Carolina André');
    
-- Execute os comandos para:

-- Exibir todos os dados da tabela.

SELECT * FROM Filme;

-- Adicionar o campo protagonista do tipo varchar(50) na tabela;

ALTER TABLE Filme ADD COLUMN protagonista VARCHAR(50);
DESC Filme;

--  Atualizar o campo protagonista de todas os filmes inseridos;

UPDATE Filme SET protagonista = 'Lionel Messi' WHERE IdFilme = 1;
UPDATE Filme SET protagonista = 'Lionel Messi' WHERE IdFilme = 2;
UPDATE Filme SET protagonista = 'Piscineiro Douglas' WHERE IdFilme = 3;
UPDATE Filme SET protagonista = 'Filho do Piscineiro Douglas' WHERE IdFilme = 4;
UPDATE Filme SET protagonista = 'The Killer' WHERE IdFilme = 5;
UPDATE Filme SET protagonista = 'The kid Killer' WHERE IdFilme = 6;
UPDATE Filme SET protagonista = 'ROCHA' WHERE IdFilme = 7;
UPDATE Filme SET protagonista = 'ROCHA' WHERE IdFilme = 8;
SELECT * FROM Filme;

-- Modificar o campo diretor do tamanho 40 para o tamanho 150;

ALTER TABLE Filme MODIFY COLUMN diretor VARCHAR(150);
DESC Filme;

-- Atualizar o diretor do filme com id=5;

UPDATE Filme SET diretor = 'Eu da silva' WHERE idFilme = 5;
SELECT * FROM Filme;

-- Atualizar o diretor dos filmes com id=2 e com o id=7;

UPDATE Filme SET diretor = 'Robertinho' WHERE idFilme IN ( 2,7 );
SELECT * FROM Filme;

-- Atualizar o título do filme com o id=6;

UPDATE Filme SET titulo = 'O Meu Malvado Favorito' WHERE idFilme = 6;
SELECT * FROM Filme;

-- Excluir o filme com o id=3;

DELETE FROM Filme WHERE idFilme = 3;
SELECT * FROM Filme;

-- Exibir os filmes em que o gênero é diferente de drama;

SELECT * FROM Filme WHERE genero != 'Drama';

-- Exibir os dados dos filmes que o gênero é igual ‘suspense’;

SELECT * FROM Filme WHERE genero = 'Suspense';

-- Descrever os campos da tabela mostrando a atualização do campo protagonista e diretor;

DESC Filme;

-- Limpar os dados da tabela;

TRUNCATE Filme;

-- 4) No MySQL Workbench, utilizando o banco de dados ‘sprint1’:

/*
Criar a tabela chamada Professor para conter os dados: idProfessor, nome (tamanho 50),
especialidade (tamanho 40), dtNasc (date), sendo que idProfessor é a chave primária da
tabela.
*/

CREATE TABLE Professor (
	idProfessor INT PRIMARY KEY,
    nome VARCHAR(50),
    especialidade VARCHAR(40),
    dtNasc DATE
);

-- Exemplo do campo data: ‘AAAA-MM-DD’, ‘1983-10-13’.

/*
Inserir dados na tabela, procurando colocar uma especialista para mais de um professor.
Procure inserir pelo menos uns 6 professores.
*/

INSERT INTO Professor ( idProfessor, nome, especialidade, dtNasc ) VALUES
	(1, 'Meliodas Ira', 'História', '2002-07-25'),
	(2, 'Elizabeth Liones', 'História', '2003-06-12'),
	(3, 'Ban Imortal', 'Química', '2001-02-14'),
	(4, 'Diane Gigante', 'Química', '2006-12-24'),
	(5, 'King Harlequin', 'Biologia', '2001-04-01'),
	(6,'Gowther Boneco', 'Biologia', '2004-06-02');
    
-- Execute os comandos para:

-- a) Exibir todos os dados da tabela.

SELECT * FROM Professor;

-- b) Adicionar o campo funcao do tipo varchar(50), onde a função só pode ser ‘monitor’, ‘assistente’ ou ‘titular’;

ALTER TABLE Professor ADD COLUMN funcao VARCHAR(50);
DESC Professor;

-- c) Atualizar os professores inseridos e suas respectivas funções;

UPDATE Professor SET funcao = 'Monitor' WHERE idProfessor = 1;
UPDATE Professor SET funcao = 'Titular' WHERE idProfessor = 2;
UPDATE Professor SET funcao = 'Monitor' WHERE idProfessor = 3;
UPDATE Professor SET funcao = 'Assistente' WHERE idProfessor = 4;
UPDATE Professor SET funcao = 'Assistene' WHERE idProfessor = 5;
UPDATE Professor SET funcao = 'Titular' WHERE idProfessor = 6;
SELECT * FROM Professor;

-- d) Inserir um novo professor;

INSERT INTO Professor ( idProfessor, nome, especialidade, dtNasc, funcao ) VALUES
	(7, 'Escanor Sol', 'Física', '1995-07-01', 'Monitor');
    
SELECT * FROM Professor;

-- e) Excluir o professor onde o idProfessor é igual a 5;

DELETE FROM Professor WHERE idProfessor = 5;
SELECT * FROM Professor;

-- f) Exibir apenas os nomes dos professores titulares;

SELECT nome FROM Professor WHERE funcao = 'Titular';

-- g) Exibir apenas as especialidades e as datas de nascimento dos professores monitores;

SELECT especialidade, dtNasc FROM Professor WHERE funcao = 'Monitor';

-- h) Atualizar a data de nascimento do idProfessor igual a 3;

UPDATE Professor SET dtNasc = '2000-01-01' WHERE idProfessor = 3;
SELECT * FROM Professor;

-- i) Limpar a tabela Professor;

TRUNCATE Professor;

-- 5) No MySQL Workbench, utilizando o banco de dados ‘sprint1’:

/*
Criar a tabela chamada Curso para conter os dados: idCurso, nome (tamanho 50), sigla
(tamanho 3), coordenador, sendo que idCurso é a chave primária da tabela.
*/

CREATE TABLE Curso (
	idCurso INT PRIMARY KEY,
    nome VARCHAR(50),
    sigla VARCHAR(3),
    coordenador VARCHAR(50)
);

-- Inserir dados na tabela, procure inserir pelo menos 3 cursos.

INSERT INTO Curso ( idCurso, nome, sigla, coordenador ) VALUES
	(1, 'PoliCursos', 'PLC', 'Claudiana'),
    (2, 'ETAPA', 'ETP', 'Fabiana'),
    (3, 'DESCOMPLICA', 'DCP', 'Isabela'),
    (4, 'Minalba', 'MNB', 'Rogério');
    
-- Execute os comandos para:

-- a) Exibir todos os dados da tabela.

SELECT * FROM Curso;

-- b) Exibir apenas os coordenadores dos cursos.

SELECT coordenador FROM Curso;

-- c) Exibir apenas os dados dos cursos de uma determinada sigla.

SELECT * FROM Curso WHERE sigla = 'ETP';

-- d) Exibir os dados da tabela ordenados pelo nome do curso.

SELECT * FROM Curso ORDER BY nome ASC;

-- e) Exibir os dados da tabela ordenados pelo nome do coordenador em ordem decrescente.

SELECT * FROM Curso ORDER BY coordenador DESC;

-- f) Exibir os dados da tabela, dos cursos cujo nome comece com uma determinada letra, no caso D.

SELECT * FROM Curso WHERE nome LIKE 'D%';

-- g) Exibir os dados da tabela, dos cursos cujo nome termine com uma determinada letra, no caso A.

SELECT * FROM Curso WHERE nome LIKE '%A';

-- h) Exibir os dados da tabela, dos cursos cujo nome tenha como segunda letra uma determinada letra, no caso I.

SELECT * FROM Curso WHERE nome LIKE '_I%';

-- i) Exibir os dados da tabela, dos cursos cujo nome tenha como penúltima letra uma determinada letra, no caso B.

SELECT * FROM Curso WHERE nome LIKE '%B_';

-- j) Elimine a tabela.

DROP TABLE Curso;

-- 6) No MySQL Workbench, utilizando o banco de dados ‘sprint1’:

/*
Você vai criar uma tabela para armazenar os dados de revistas (como por ex: Veja, Isto é,
Epoca, Quatro Rodas, Claudia, etc).
*/

-- Escreva e execute os comandos para:

/*
Criar a tabela chamada Revista para conter os campos: idRevista (int e chave
primária da tabela), nome (varchar, tamanho 40), categoria (varchar, tamanho 30). Os
valores de idRevista devem iniciar com o valor 1 e ser incrementado automaticamente
pelo sistema.
*/

CREATE TABLE Revista ( 
	idRevista INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    categoria VARCHAR(30)
);

-- Inserir 4 registros na tabela, mas sem informar a categoria.

INSERT INTO Revista ( nome ) VALUE
	('Veja'),
	('Isto é'),
	('Epoca'),
	('Quatro Rodas');
    
-- Escreva e execute os comandos para:

-- Exibir todos os dados da tabela.

SELECT * FROM Revista;

/*
Atualize os dados das categorias das 3 revistas inseridas. Exibir os dados da tabela
novamente para verificar se atualizou corretamente.
*/

UPDATE Revista SET categoria = 'S' WHERE idRevista = 1;
UPDATE Revista SET categoria = 'A' WHERE idRevista = 2;
UPDATE Revista SET categoria = 'A' WHERE idRevista = 3;
UPDATE Revista SET categoria = 'B' WHERE idRevista = 4;

SELECT * FROM Revista;

-- Insira mais 3 registros completos.

INSERT INTO Revista ( nome, categoria) VALUES
	('Vogue', 'S'),
    ('CartaCapital', 'B'),
    ('ESPN Magazine', 'A');

-- Exibir novamente os dados da tabela.

SELECT * FROM Revista;

-- Exibir a descrição da estrutura da tabela.

DESC Revista;

-- Alterar a tabela para que a coluna categoria possa ter no máximo 40 caracteres.

ALTER TABLE Revista MODIFY COLUMN categoria VARCHAR(40);

-- • Exibir novamente a descrição da estrutura da tabela, para verificar se alterou o tamanho da coluna categoria:

DESC Revista;

-- Acrescentar a coluna periodicidade à tabela, que é varchar(15).

ALTER TABLE Revista ADD COLUMN periodicidade VARCHAR(15);

-- Exibir os dados da tabela.

SELECT * FROM Revista;

-- Excluir a coluna periodicidade da tabela.

ALTER TABLE Revista DROP COLUMN periodicidade;
DESC Revista;

-- 7) No MySQL Workbench, utilizando o banco de dados ‘sprint1’:

-- Você vai criar uma tabela para armazenar os dados de Carros (como por ex: Gol, Fusca, Onix, HB20, Corola, etc).

-- Escreva e execute os comandos para:

/*
Criar a tabela chamada Carro para conter os campos: idCarro (int e chave primária da tabela),
nome (varchar, tamanho 40), placa (char, tamanho 7). 
Os valores de idCarro devem iniciar com o valor 1000 e ser incrementado
automaticamente pelo sistema.
*/

CREATE TABLE Carro (
	idCarro INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    placa CHAR(7)
)AUTO_INCREMENT = 1000;

-- Inserir 4 registros na tabela;

INSERT INTO Carro ( nome, placa ) VALUES
	('Gol', '1WX-40P'),
    ('Fusca', '88P-EYK'),
    ('Onix', '9OP-MCH'),
    ('HB20', 'KLZ-M02');
    
-- Escreva e execute os comandos para:

-- Exibir todos os dados da tabela.

SELECT * FROM Carro;

-- Insira mais 3 registros sem a placa dos carros.

INSERT INTO Carro ( nome ) VALUE
	('Camaro'),
    ('Dodge'),
    ('Ferrari');
    
-- Exibir novamente os dados da tabela.

SELECT * FROM Carro;

-- Exibir a descrição da estrutura da tabela.

DESC Carro;

-- Alterar a tabela para que a coluna nome possa ter no máximo 28 caracteres.

ALTER TABLE Carro MODIFY COLUMN nome VARCHAR(28);

--  Exibir novamente a descrição da estrutura da tabela, para verificar se alterou o tamanho da coluna;

DESC Carro;

-- Acrescentar a coluna ano à tabela, que é char(4);

ALTER TABLE Carro ADD COLUMN ano CHAR(4);

-- Atualizar todos os dados nulos da tabela;

UPDATE Carro SET ano = '2020' WHERE idCarro IN ( 1000, 1001 );
UPDATE Carro SET ano = '2019' WHERE idCarro IN ( 1002, 1003 );
UPDATE Carro SET ano = '2022' WHERE idCarro IN ( 1004, 1005, 1006);
UPDATE Carro SET placa = 'ERP-22R' WHERE idCarro = 1004;
UPDATE Carro SET placa = 'UVK-09L' WHERE idCarro = 1005;
UPDATE Carro SET placa = 'CVF-FG4' WHERE idCarro = 1006;

SELECT * FROM Carro;

-- FIM

 


