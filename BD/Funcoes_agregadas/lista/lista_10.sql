CREATE DATABASE lista_10;
USE lista_10;

CREATE TABLE Grupo(
	id_grupo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    descrisao_projeto VARCHAR(150)
);

CREATE TABLE Professor(
	id_professor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    disciplina VARCHAR(45)
)AUTO_INCREMENT = 1000;

CREATE TABLE Aluno(
	id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    RA CHAR(8),
    nome VARCHAR(45),
    email VARCHAR(100),
    fk_grupo INT,
    CONSTRAINT Cfk_grupo FOREIGN KEY (fk_grupo) REFERENCES Grupo(id_grupo)
);

CREATE TABLE Avaliacao(
	id_avaliacao INT PRIMARY KEY AUTO_INCREMENT,
    nota DECIMAL(5,2),
    dt_inicio_avaliacao DATETIME,
    fk_grupo INT,
    fk_professor INT,
    CONSTRAINT cFk_grupo_avaliacao FOREIGN KEY (fk_grupo) REFERENCES Grupo(id_grupo),
    CONSTRAINT cFk_professor_avaliacao FOREIGN KEY (fk_professor) REFERENCES Professor(id_professor)
);

INSERT INTO Grupo (nome, descrisao_projeto) VALUES
	('Flowtrak', 'Projeto de análise de fluxo de supermercados.'),
    ('DataLumini', 'Projeto de controle de luminosidade em plantas.'),
    ('VinhoBase', 'Projeto que controla temperatura de vinhos.'),
    ('ArcSilos', 'Controla a capacidade de silos.');
    
INSERT INTO Professor (nome, disciplina) VALUES
	('Clara', 'Banco de Dados'),
    ('Giuliana', 'Algoritimos'),
    ('Júlia', 'Projeto e Inovação'),
    ('Matheus', 'Arq. Comp.');
    
INSERT INTO Aluno (nome, RA, email, fk_grupo) VALUES
	('Caio', '12345678', 'caio@gmail.com', 1),
    ('Vitor', '12345671', 'vitor@gmail.com', 1),
    ('Arthur', '12345672', 'arthur@gmail.com', 2),
    ('Alison', '12345673', 'alison@gmail.com', 2),
    ('Eduardo', '12345674', 'eduardo@gmail.com', 3),
    ('Marina', '12345675', 'marina@gmail.com', 3),
    ('Jacob', '12345676', 'jacob@gmail.com', 4),
    ('Emanuelly', '12345677', 'ema@gmail.com', 4);
    
INSERT INTO Avaliacao (nota, dt_inicio_avaliacao, fk_grupo, fk_professor) VALUES
	(7, '2026-06-23 12:00:00', 1, 1000),
    (8, '2026-06-12 08:00:00', 2, 1001),
    (9, '2026-06-23 13:00:00', 3, 1003),
    (10, '2026-06-23 15:00:00', 4, 1002);
    
SELECT * FROM Grupo;
SELECT * FROM Professor;
SELECT * FROM Avaliacao;

SELECT * FROM Grupo g JOIN Aluno a ON a.fk_grupo = g.id_grupo;
SELECT * FROM Grupo g JOIN Aluno a ON a.fk_grupo = g.id_grupo WHERE g.id_grupo = 1;

SELECT g.nome, a.nota FROM Grupo g JOIN Avaliacao a ON g.id_grupo = a.fk_grupo;
SELECT AVG(a.nota) AS 'Média geral de notas:' FROM Grupo g JOIN Avaliacao a ON g.id_grupo = a.fk_grupo;

SELECT 	MIN(a.nota) AS 'Menor nota:',
		MAX(a.nota) AS 'Menor nota:'
	FROM Grupo g
		JOIN Avaliacao a 
			ON g.id_grupo = a.fk_grupo;
  
SELECT 	SUM(a.nota) AS 'Soma das notas:'
	FROM Grupo g
		JOIN Avaliacao a 
			ON g.id_grupo = a.fk_grupo;

SELECT 
	p.nome AS 'Nome Professor:',
	p.disciplina AS 'Disciplina:',
    g.nome AS 'Nome do Grupo:',
    g.descrisao_projeto AS 'Descrisão do Grupo:',
    a.dt_inicio_avaliacao AS 'Data e Hora da Avaliação:',
    a.nota AS 'Avaliação:'
FROM Grupo g
	JOIN Avaliacao a
		ON g.id_grupo = a.fk_grupo
	JOIN Professor p
		ON p.id_professor = a.fk_professor;
        
SELECT 
	p.nome AS 'Nome Professor:',
	p.disciplina AS 'Disciplina:',
    g.nome AS 'Nome do Grupo:',
    g.descrisao_projeto AS 'Descrisão do Grupo:',
    a.dt_inicio_avaliacao AS 'Data e Hora da Avaliação:',
    a.nota AS 'Avaliação:'
FROM Grupo g
	JOIN Avaliacao a
		ON g.id_grupo = a.fk_grupo
	JOIN Professor p
		ON p.id_professor = a.fk_professor
WHERE g.id_grupo = 1;

SELECT 
	p.nome AS 'Nome Professor:',
	p.disciplina AS 'Disciplina:',
    g.nome AS 'Nome do Grupo:',
    g.descrisao_projeto AS 'Descrisão do Grupo:',
    a.dt_inicio_avaliacao AS 'Data e Hora da Avaliação:',
    a.nota AS 'Avaliação:'
FROM Grupo g
	JOIN Avaliacao a
		ON g.id_grupo = a.fk_grupo
	JOIN Professor p
		ON p.id_professor = a.fk_professor
WHERE p.nome = 'Clara';

SELECT 
	p.nome AS 'Nome Professor:',
	p.disciplina AS 'Disciplina:',
    g.nome AS 'Nome do Grupo:',
    g.descrisao_projeto AS 'Descrisão do Grupo:',
    a.dt_inicio_avaliacao AS 'Data e Hora da Avaliação:',
    a.nota AS 'Avaliação:',
    al.nome AS 'Nome Aluno:',
    al.RA AS 'RA:',
    al.email AS 'Email:'
FROM Grupo g
	JOIN Avaliacao a
		ON g.id_grupo = a.fk_grupo
	JOIN Professor p
		ON p.id_professor = a.fk_professor
	JOIN Aluno al 
		ON g.id_grupo = al.fk_grupo;
        
-- não sei distincy

SELECT 
	p.nome AS 'Indentificação Professor:',
    AVG(a.nota) AS 'Média das notas:',
    SUM(a.nota) AS 'Soma das notas:'
FROM Avaliacao a
	JOIN Professor p
		ON p.id_professor = a.fk_professor
GROUP BY p.nome;

SELECT 
	g.nome AS 'Indentificação Grupo:',
    AVG(a.nota) AS 'Média das notas:',
    SUM(a.nota) AS 'Soma das notas:'
FROM Avaliacao a
	JOIN Grupo g
		ON g.id_grupo = a.fk_grupo
GROUP BY g.nome;

SELECT 
	p.nome AS 'Indentificação Professor:',
    MIN(a.nota) AS 'Menor nota:',
    MAX(a.nota) AS 'Maior nota:'
FROM Avaliacao a
	JOIN Professor p
		ON p.id_professor = a.fk_professor
GROUP BY p.nome;

SELECT 
	g.nome AS 'Indentificação Grupo:',
    MIN(a.nota) AS 'Menor nota:',
    MAX(a.nota) AS 'Maior nota:'
FROM Avaliacao a
	JOIN Grupo g
		ON g.id_grupo = a.fk_grupo
GROUP BY g.nome;






        

	

        
