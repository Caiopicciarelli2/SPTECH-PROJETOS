-- atividade prática 1, Banco de dados, Caio Picciarelli Silva 1 CCO-A

/*
Exercício 1:

No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
Escreva e execute os comandos para:
• Criar a tabela chamada Atleta para conter os dados: idAtleta (int e chave primária da
tabela), nome (varchar, tamanho 40), modalidade (varchar, tamanho 40), qtdMedalha
(int, representando a quantidade de medalhas que o atleta possui)
*/

CREATE DATABASE sprint1;

USE sprint1;

CREATE TABLE Atleta(
	idAtleta INT primary key,
	nome varchar(40),
    modalidade varchar(40),
    qtdMedalha INT
);
 
 -- • Inserir dados na tabela, procurando colocar mais de um atleta para cada modalidade.
 
INSERT INTO Atleta (idAtleta, nome, modalidade, qtdMedalha) VALUES
	(1, 'Marcos Antonio', 'Futebol', 3),
	(2, 'Ana Luiza', 'Volei', 1),
	(3, 'Laura S.', 'Xadrez', 5),
	(4, 'Arthur A.', 'Volei', 0),
	(5, 'Ana Maria', 'Handebol', 2),
	(6, 'Miguel A.', 'Futebol', 1),
	(7, 'Lucas R.', 'Handebol', 1),
	(8, 'Caio P.', 'Ping Pong', 9),
	(9, 'Guilherme Q.', 'Ping Pong', 5),
	(10, 'Nicolas O.', 'Xadrez', 0);

-- Escreva e execute os comandos para:

-- • Exibir todos os dados da tabela.

SELECT * FROM Atleta;

-- • Exibir apenas os nomes e quantidade de medalhas dos atletas.

SELECT nome,qtdMedalha FROM Atleta;

-- • Exibir apenas os dados dos atletas de uma determinada modalidade.

SELECT * FROM Atleta WHERE modalidade='Futebol';

-- • Exibir os dados da tabela ordenados pela modalidade.

SELECT * FROM Atleta ORDER BY modalidade ASC;

-- • Exibir os dados da tabela, ordenados pela quantidade de medalhas, em ordem decrescente.

SELECT * FROM Atleta ORDER BY qtdMedalha DESC;

-- • Exibir os dados da tabela, dos atletas cujo nome contenha a letra s

SELECT * FROM Atleta WHERE nome LIKE '%s%';

-- • Exibir os dados da tabela, dos atletas cujo nome comece com uma determinada letra, no caso C.

SELECT * FROM Atleta WHERE nome LIKE 'C%';

-- • Exibir os dados da tabela, dos atletas cujo nome termine com a letra o.

SELECT * FROM Atleta WHERE nome LIKE '%O';

 -- • Exibir os dados da tabela, dos atletas cujo nome tenha a penúltima letra r.
 
 SELECT * FROM Atleta WHERE nome Like '%R_';
 
 -- • Eliminar a tabela.

DROP TABLE Atleta;

/*
Exercício 2:

No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
Criar a tabela chamada Musica para conter os dados: idMusica, titulo (tamanho 40), artista
(tamanho 40), genero (tamanho 40), sendo que idMusica é a chave primária da tabela.
*/

CREATE TABLE Musica (
	IdMusica int primary key, 
	titulo varchar(40),
    artista varchar(40),
    genero varchar(40)
);

/*
Inserir dados na tabela, procurando colocar um gênero de música que tenha mais de uma
música, e um artista, que tenha mais de uma música cadastrada. Procure inserir pelo
menos umas 7 músicas.
*/

INSERT INTO Musica ( IdMusica, titulo, artista, genero) VALUES
	(1, '505', 'Artics Monkeys', 'Love Songs'),
	(2, 'Love', 'Artics Monkeys', 'Love Songs'),
	(3, 'Músicas de Amor Nunca Mais', 'BK', 'Hip-Hop'),
	(4, 'Outra Hora', 'BK', 'Hip-Hop'),
	(5, 'Balada', 'Gusttavo Lima', 'Sertanejo'),
	(6, '60 segundos', 'Gusttavo Lima', 'Sertanejo'),
	(7, 'STAY', 'Justin Bieber', 'POP'),
	(8, 'BABY', 'Justin Bieber', 'POP');

-- Execute os comandos para:

-- a) Exibir todos os dados da tabela

SELECT * FROM Musica;

-- b) Exibir apenas os títulos e os artistas das músicas.

SELECT titulo, artista FROM Musica;

--  c) Exibir apenas os dados das músicas de um determinado gênero

SELECT * FROM Musica WHERE genero = 'Love Songs';

-- d) Exibir apenas os dados das músicas de um determinado artista.

SELECT * FROM Musica WHERE artista = 'Gusttavo Lima';

-- e) Exibir os dados da tabela ordenados pelo título da música.

SELECT * FROM Musica ORDER BY titulo ASC;

-- f) Exibir os dados da tabela ordenados pelo artista em ordem decrescente.

SELECT * FROM Musica ORDER BY artista DESC;

-- g) Exibir os dados da tabela, das músicas cujo título comece com uma determinada letra, no caso M.

SELECT * FROM Musica WHERE titulo LIKE 'M%';

-- h) Exibir os dados da tabela, das músicas cujo artista termine com uma determinada letra, no caso A.

SELECT * FROM Musica WHERE artista LIKE '%A';

-- i) Exibir os dados da tabela, das músicas cujo gênero tenha como segunda letra uma determinada letra, no caso O.

SELECT * FROM Musica WHERE genero LIKE '_O%';

-- j) Exibir os dados da tabela, das músicas cujo título tenha como penúltima letra uma determinada letra, no caso 0.

SELECT * FROM Musica WHERE titulo LIKE '%0_';

-- k) Elimine a tabela.

DROP TABLE Musica;

/*
Exercício 3:

No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
Criar a tabela chamada Filme para conter os dados: idFilme, título (tamanho 50), genero
(tamanho 40), diretor (tamanho 40), sendo que idFilme é a chave primária da tabela.
*/

CREATE TABLE Filme(
	idFilme INT PRIMARY KEY, 
	titulo varchar(50),
	genero varchar(40),
	diretor varchar(40)
);

/*
Inserir dados na tabela, procurando colocar um gênero de filme que tenha mais de um
filme, e um diretor, que tenha mais de um filme cadastrado. Procure inserir pelo menos
uns 7 filmes.
*/

INSERT INTO Filme ( idFilme, titulo, genero, diretor ) VALUES
	(1, 'Gente Grande', 'comédia', 'Dennis Dugan'),
    (2, 'Gente Grande 2', 'comédia', 'Dennis Dugan'),
    (3, 'Velozes e Furiosos', 'ação', 'Rob Cohen'),
    (4, '+Velozes e +Furiosos', 'ação', 'Rob Cohen'),
    (5, 'Jumanji', 'aventura', 'Jake Kasdan'),
    (6, 'Jumanji: O Nível Seguinte', 'aventura', 'Jake Kasdan'),
    (7, 'O Poderoso Chefão', 'drama', 'Francis Ford Coppola'),
    (8, 'O Poderoso Chefão 2', 'drama', 'Francis Ford Coppola');
    
-- Execute os comandos para:

-- • Exibir todos os dados da tabela.

SELECT * FROM Filme;

-- • Exibir apenas os títulos e os diretores dos filmes.

SELECT titulo, diretor FROM Filme;

-- • Exibir apenas os dados dos filmes de um determinado gênero.

SELECT * FROM Filme WHERE genero = 'drama';

-- • Exibir apenas os dados dos filmes de um determinado diretor.

SELECT * FROM Filme WHERE diretor = 'Rob Cohen';

-- • Exibir os dados da tabela ordenados pelo título do filme.

SELECT * FROM Filme ORDER BY titulo ASC;

-- • Exibir os dados da tabela ordenados pelo diretor em ordem decrescente.

SELECT * FROM Filme ORDER BY diretor DESC;

-- • Exibir os dados da tabela, dos filmes cujo título comece com uma determinada letra, no caso O.

SELECT * FROM Filme WHERE titulo LIKE 'O%';

--  • Exibir os dados da tabela, dos filmes cujo diretor termine com uma determinada letra, no caso A.

SELECT * FROM Filme WHERE  diretor LIKE '%A';

-- • Exibir os dados da tabela, dos filmes cujo gênero tenha como segunda letra uma determinada letra, no caso V.

SELECT * FROM Filme WHERE genero LIKE '_V%';

-- • Exibir os dados da tabela, dos filmes cujo título tenha como penúltima letra uma determinada letra, no caso D.

SELECT * FROM Filme WHERE titulo LIKE '%D_';

-- • Elimine a tabela.

DROP TABLE Filme;

/*
Exercício 4:

No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
Criar a tabela chamada Professor para conter os dados: idProfessor, nome (tamanho 50),
especialidade (tamanho 40), dtNasc (date), sendo que idProfessor é a chave primária da
tabela.
Exemplo do campo data: ‘AAAA-MM-DD’ - ‘1983-10-13’.
*/

CREATE TABLE Professor (
	idProfessor INT PRIMARY KEY,
	nome varchar(50),
	especialidade varchar(40),
	dtNasc DATE
);

/*
Inserir dados na tabela, procurando colocar uma especialista para mais de um professor.
Procure inserir pelo menos uns 6 professores.
*/

INSERT INTO Professor ( idProfessor, nome, especialidade, dtNasc ) VALUES
	(1, 'Ana Paula Rodrigues', 'história', '1982-2-02'),
    (2, 'Jóse Roberto Carlos', 'história', '1966-7-18'),
    (3, 'Fabiana Picciarelli André', 'português', '1986-2-28'),
    (4, 'Marcio Paulo Silva', 'português', '1990-9-11'),
    (5, 'Guilherme Barbosa Da Silva', 'geografia', '1995-6-30'),
    (6, 'Matheus Carvalho De Paula', 'geografia', '1971-1-29');

-- Execute os comandos para:

-- a) Exibir todos os dados da tabela.

SELECT * FROM Professor;

-- b) Exibir apenas as especialidades dos professores.

SELECT especialidade FROM Professor;

-- c) Exibir apenas os dados dos professores de uma determinada especialidade.

SELECT * FROM Professor WHERE especialidade = 'história';

-- d) Exibir os dados da tabela ordenados pelo nome do professor.

SELECT * FROM Professor ORDER BY nome ASC;

-- e) Exibir os dados da tabela ordenados pela data de nascimento do professor em ordem decrescente.

SELECT * FROM Professor ORDER BY dtNasc DESC;

-- f) Exibir os dados da tabela, dos professores cujo nome comece com uma determinada letra, no caso M.

SELECT * FROM Professor WHERE nome LIKE 'M%';

-- g) Exibir os dados da tabela, dos professores cujo nome termine com uma determinada letra, no caso A

SELECT * FROM Professor WHERE nome LIKE '%A';

-- h) Exibir os dados da tabela, dos professores cujo nome tenha como segunda letra uma determinada letra, no caso A.

SELECT * FROM Professor WHERE nome LIKE '_A%';

-- i) Exibir os dados da tabela, dos professores cujo nome tenha como penúltima letra uma determinada letra, no caso V.

SELECT * FROM Professor WHERE nome LIKE '%V_';

-- j) Elimine a tabela.

DROP TABLE Professor;

/*
No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
Criar a tabela chamada Jogo para conter os dados: idJogo, nome (tamanho 50), comentario (tamanho 200), ranking (número inteiro), sendo que idJogo é a chave primária da tabela.
*/

CREATE TABLE Jogo (
	idJogo INT PRIMARY KEY,
    nome varchar(50),
    comentario varchar(200),
    ranking INT
);

/*
Inserir dados na tabela.
Procure inserir pelo menos 5 jogos.
*/

INSERT INTO Jogo ( idJogo, nome, comentario, ranking ) VALUES 
	(1, 'Valorant', 'Valorant é um jogo FPS e competitivo, com vários modos de jogo, um deles rankeado, que divide os jogadores entre: Ferro, Bronze, Prata, Ouro, Platina, Dimante, Ascendente, Imortal e Radiante.', 5),
    (2, 'Minecraft', 'Minecraft é um jogo quadrado de aventura, no qual há diversos biomas, mods e desafios para você enfrentar, um deles é o Ender Dragon, um dragão de uma dimensão diferente que é imbatível.', 3),
    (3, 'Fifa26', 'Fifa 2026 é um jogo de futebol que acompanha gerações, tem diversos times e modos para jogar, um deles é o campanha, no qual você escolhe um jogador para ser.', 4),
    (4, 'CS 2', 'Counter-Strike 2 é um jogo FPS e competitivo, que tem disponibilidade de diversos modos, assim como várias skins que podem chegar a valores absurdos.', 1),
    (5, 'Terraria', 'Terraria é um jogo 2D quadrado, no qual você tem vários recuros disponíveis e uma grande aventura a sua espera.', 2);
    
-- Execute os comandos para:

-- a) Exibir todos os dados da tabela.

SELECT * FROM Jogo;

-- b) Exibir apenas os nomes dos jogos

SELECT nome FROM Jogo;

-- c) Exibir apenas o comentário de um determinado jogo.

SELECT comentario FROM JOGO WHERE nome = 'FIFA26';

-- d) Exibir os dados da tabela ordenados pelo nome do jogo.

SELECT * FROM Jogo ORDER BY nome ASC;

-- e) Exibir os dados da tabela ordenados pelo ranking em ordem decrescente.

SELECT * FROm Jogo ORDER BY ranking DESC;

-- f) Exibir os dados da tabela, dos jogos cujo nome comece com uma determinada letra, no caso T.

SELECT * FROM Jogo WHERE nome LIKE 'T%';

-- g) Exibir os dados da tabela, dos jogos cujo nome termine com uma determinada letra, no caso T.

SELECT * FROM Jogo WHERE nome LIKE '%T';

-- h) Exibir os dados da tabela, dos jogos cujo nome tenha como segunda letra uma determinada letra, no caso A.

SELECT * FROM Jogo WHERE nome LIKE '_A%';

-- i) Exibir os dados da tabela, dos jogos cujo nome tenha como penúltima letra uma determinada letra, no caso F.

SELECT * FROM Jogo WHERE nome LIKE '%F_';

-- j) Exibir os dados da tabela, dos jogos cujo nome seja diferente de Minecraft.

SELECT * FROM Jogo WHERE nome != 'Minecraft';

-- k) Elimine a tabela.

DROP TABLE Jogo;

    




 

