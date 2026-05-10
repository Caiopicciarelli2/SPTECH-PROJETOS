
CREATE DATABASE 1ccoa_bd_260430;
USE 1ccoa_bd_260430;

CREATE TABLE Aluno(
	id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cpf CHAR(11), 
    dt_nasc DATE
);

CREATE TABLE Curso(
	id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45)
);

CREATE TABLE Aluno_Curso(
	fk_aluno INT,
    fk_curso INT,
    dt_inicio DATE,
    PRIMARY KEY (fk_aluno, fk_curso),
    CONSTRAINT cFk_aluno_AlunoCurso FOREIGN KEY (fk_aluno) REFERENCES aluno(id_aluno),
    CONSTRAINT cFk_curso_AlunoCurso FOREIGN KEY (fk_curso) REFERENCES curso(id_curso)
);

INSERT INTO Aluno (nome, cpf, dt_nasc) VALUES
	('Clara', '11111111111', '1999-06-19'),
    ('João', '11111111112', '1997-04-21');

INSERT INTO Curso (nome) VALUES
	('JavaScript'),
    ('CSS'),
    ('Python');
    
INSERT INTO Aluno_Curso (fk_aluno, fk_curso, dt_inicio) VALUES
	(1, 1, CURDATE()),
    (1, 3, CURDATE()),
    (2, 1, CURDATE()),
    (2, 2, CURDATE()),
    (2, 3, CURDATE());
    
-- tabela associativa ALuno_Curso, que pode repetir as fks, porém não pode repetir a mesma sequencia (1,1) e (1,1)

SELECT * FROM 
	Aluno JOIN 
		Aluno_Curso 
			ON Aluno_Curso.fk_aluno = aluno.id_aluno
	JOIN Curso ON Aluno_curso.fk_curso = curso.id_curso;
    
SELECT 
	a.nome AS 'Nome Aluno:',
    c.nome AS 'Nome Curso:',
    ac.dt_inicio AS 'Data de Início do Curso:',
    TIMESTAMPDIFF(YEAR,  CURDATE(), a.dt-nasc) AS 'Idade Aluno:' -- TIMESTAMPDIFF : diferença de dias/mes/anos que voce seleciona primeiro, CURDATE(data de hoje) - Aluno.dt_nasc
FROM
	Aluno AS a
		JOIN Aluno_Curso AS ac
			ON ac.fk_aluno = a.id_aluno
		JOIN Curso AS c
			ON ac.fk_curso = c.id_curso;

-- tabela virtual que é baseada no resultado do select
-- Não existe a tabela, mas existe a visualização dela

CREATE VIEW info_aluno_curso 
	AS 
		SELECT 
			a.nome AS 'Nome Aluno:',
			c.nome AS 'Nome Curso:',
			ac.dt_inicio AS 'Data de Início do Curso:',
			TIMESTAMPDIFF(YEAR,  CURDATE(), a.dt-nasc) AS 'Idade Aluno:' -- TIMESTAMPDIFF : diferença de dias/mes/anos que voce seleciona primeiro, CURDATE(data de hoje) - Aluno.dt_nasc
		FROM
			Aluno AS a
				JOIN Aluno_Curso AS ac
					ON ac.fk_aluno = a.id_aluno
				JOIN Curso AS c
					ON ac.fk_curso = c.id_curso;
		
-- atualiza conforme o preenchimento das tabelas, sem precisar ficar mudando o create view
-- pode dar drop ou alter table na visualização, porque não vai deletar nada, só a visualização
-- ela é bem util
SELECT * FROM info_aluno_curso;