CREATE DATABASE pratica_complementar_n_para_n;
USE pratica_complementar_n_para_n;

-- tabelas

CREATE TABLE curso(
	id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nomeCurso VARCHAR(50),
    coordenador VARCHAR(50)
);

CREATE TABLE professor(
	id_professor INT PRIMARY KEY AUTO_INCREMENT,
    nomeProfessor VARCHAR(50),
    especialidade VARCHAR(50)
);

CREATE TABLE disciplina(
	id_disciplina INT PRIMARY KEY AUTO_INCREMENT,
    nomeDisciplina VARCHAR(50),
    carga_hr DECIMAL (4,2),
    fk_professor INT,
    CONSTRAINT cFK_professor_TDisciplina FOREIGN KEY (fk_professor) REFERENCES professor(id_professor)
);

CREATE TABLE aluno(
	id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nomeAluno VARCHAR(50),
    email VARCHAR(100),
    fk_curso INT,
    CONSTRAINT cFK_curso_TAluno FOREIGN KEY (fk_curso) REFERENCES curso(id_curso) 
);

CREATE TABLE projeto(
	id_projeto INT PRIMARY KEY AUTO_INCREMENT,
    nomeProjeto VARCHAR(50),
    descricao VARCHAR(250)
);

CREATE TABLE aluno_has_projeto(
	fk_aluno INT,
    fk_projeto INT,
    dt_entrada DATE,
    CONSTRAINT cFk_aluno_TAluno_has_Projeto FOREIGN KEY (fk_aluno) REFERENCES aluno(id_aluno),
    CONSTRAINT cFk_projeto_TAluno_has_Projeto FOREIGN KEY (fk_projeto) REFERENCES projeto(id_projeto),
    PRIMARY KEY(fk_aluno, fk_projeto)
);

CREATE TABLE aluno_has_disciplina(
	fk_aluno INT,
    fk_disciplina INT,
    semestre INT,
    CONSTRAINT cFk_aluno_TAluno_has_Disciplina FOREIGN KEY (fk_aluno) REFERENCES aluno(id_aluno),
    CONSTRAINT cFk_disciplina_TAluno_has_Disciplina FOREIGN KEY (fk_disciplina) REFERENCES disciplina(id_disciplina),
    PRIMARY KEY(fk_aluno, fk_disciplina)
);

-- Inserts

INSERT INTO curso (nomeCurso, coordenador) VALUES
('Análise e Desenvolvimento de Sistemas', 'Carlos Silva'),
('Ciência da Computação', 'Mariana Souza'),
('Sistemas de Informação', 'Ricardo Lima'),
('Engenharia de Software', 'Fernanda Alves');

INSERT INTO professor (nomeProfessor, especialidade) VALUES
('João Pereira', 'Banco de Dados'),
('Ana Costa', 'Programação Web'),
('Lucas Martins', 'Redes de Computadores'),
('Patricia Gomes', 'Engenharia de Software'),
('Roberto Dias', 'Inteligência Artificial');

INSERT INTO disciplina (nomeDisciplina, carga_hr, fk_professor) VALUES
('Banco de Dados I', 80.00, 1),
('Desenvolvimento Web', 60.00, 2),
('Redes de Computadores', 70.00, 3),
('Engenharia de Software', 80.00, 4),
('Machine Learning', 90.00, 5);

INSERT INTO aluno (nomeAluno, email, fk_curso) VALUES
('Gabriel Santos', 'gabriel.santos@email.com', 1),
('Juliana Rocha', 'juliana.rocha@email.com', 2),
('Pedro Henrique', 'pedro.henrique@email.com', 3),
('Larissa Melo', 'larissa.melo@email.com', 4),
('Felipe Andrade', 'felipe.andrade@email.com', 1),
('Camila Fernandes', 'camila.fernandes@email.com', 2);

-- alunos sem projetos
INSERT INTO aluno(nomeAluno, email, fk_curso) VALUES
	('Caio', 'caio@gmail.com', 2),
    ('Bruno', 'bruno@gmail.com', 3);

INSERT INTO projeto (nomeProjeto, descricao) VALUES
('Sistema Acadêmico', 'Projeto para gerenciamento de alunos e disciplinas'),
('Aplicativo Delivery', 'Aplicativo para pedidos online'),
('Rede Inteligente', 'Monitoramento de redes utilizando IA'),
('Portal de Notícias', 'Site responsivo para publicação de notícias');

INSERT INTO projeto (nomeProjeto, descricao) VALUES
('FlowTrak', 'Projeto para gerenciamento de fluxo em supermercados'),
('DataLumini', 'Projeto para gerenciamento de luminosidade em estufas');

INSERT INTO aluno_has_projeto (fk_aluno, fk_projeto, dt_entrada) VALUES
(1, 1, '2026-02-10'),
(2, 2, '2026-02-15'),
(3, 3, '2026-03-01'),
(4, 4, '2026-03-05'),
(5, 1, '2026-03-10'),
(6, 2, '2026-03-12');

INSERT INTO aluno_has_disciplina (fk_aluno, fk_disciplina, semestre) VALUES
(1, 1, 1),
(1, 2, 1),
(2, 1, 2),
(2, 5, 2),
(3, 3, 3),
(4, 4, 4),
(5, 2, 1),
(6, 5, 2);

-- excs

-- 01: nome aluno, nome curso

SELECT
	a.nomeAluno AS 'Nome Aluno:',
    c.nomeCurso AS 'Nome Curso:'
FROM aluno AS a 
	JOIN curso AS c
		ON a.fk_curso = c.id_curso;
        
-- 02: nome aluno, nome projeto, dt_entrada projeto

SELECT
	a.nomeAluno AS 'Nome Aluno:',
    p.nomeProjeto AS 'Nome Projeto:',
    a_has_p.dt_entrada AS 'Data de Entrada:'
FROM aluno_has_projeto AS a_has_p
	JOIN aluno AS a
		ON a_has_p.fk_aluno = a.id_aluno
	JOIN projeto AS p
		ON a_has_p.fk_projeto = p.id_projeto;
        
-- 03: nome aluno, nome disciplina, semestre cursado

SELECT 
	a.nomeAluno AS 'Nome Aluno:',
    d.nomeDisciplina AS 'Nome Disciplina:',
    a_has_d.semestre AS 'Semestre Cursado:'
FROM aluno_has_disciplina AS a_has_d
	JOIN aluno AS a
		ON a_has_d.fk_aluno = a.id_aluno
	JOIN disciplina AS d
		ON a_has_d.fk_disciplina = d.id_disciplina;
        
-- 04: alunos WHERE curso = 'ADS'

SELECT 
	a.*, c.nomeCurso AS 'Nome Curso:'
FROM aluno AS a
	JOIN curso AS c
		ON a.fk_curso = c.id_curso
WHERE nomeCurso = 'Análise e Desenvolvimento de Sistemas';

-- 05: exibir projeto que tenham alunos

SELECT p.nomeProjeto AS 'Projeto:', COUNT(a_has_p.fk_aluno) AS qtd_alunos
	FROM aluno_has_projeto AS a_has_p
		JOIN projeto AS p
			ON a_has_p.fk_projeto = p.id_projeto
GROUP BY p.nomeProjeto
	HAVING qtd_alunos > 0;

-- 06: alunos que participam de x projeto

SELECT 
	p.nomeProjeto AS 'Projeto:',
    a.nomeAluno AS 'Aluno'
FROM aluno_has_projeto AS a_has_p
		JOIN projeto AS p
			ON a_has_p.fk_projeto = p.id_projeto
		JOIN aluno AS a
			ON a_has_p.fk_aluno = a.id_aluno
WHERE p.nomeProjeto = 'Sistema Acadêmico';

-- 07: nome_professor e nome_disciplina

SELECT 
	p.nomeProfessor AS 'Professor:',
    d.nomeDisciplina AS 'Disciplina:'
FROM professor AS p
	JOIN disciplina AS d
		ON d.fk_professor = p.id_professor;
        
-- 08: alunos que não estão em um projeto

SELECT 
	a.nomeAluno AS 'Aluno:',
	IFNULL(p.nomeProjeto, 'Sem Projeto!') AS 'Projeto:'
FROM aluno AS a
	LEFT JOIN aluno_has_projeto AS a_has_p
		ON a_has_p.fk_aluno = a.id_aluno
	LEFT JOIN projeto AS p
		ON a_has_p.fk_projeto = p.id_projeto
WHERE p.nomeProjeto IS NULL;

-- 09: projetos sem alunos cadastrados

SELECT 
	p.nomeProjeto AS 'Projeto:',
	IFNULL(a.nomeAluno, 'Sem alunos cadastrados') AS 'Alunos:'
FROM projeto AS p
	LEFT JOIN aluno_has_projeto AS a_has_p
		ON a_has_p.fk_projeto = p.id_projeto
	LEFT JOIN aluno AS a
		ON a_has_p.fk_aluno = a.id_aluno
WHERE a.nomeAluno IS NULL;

-- 10: crie uma view vwAluno Curso

CREATE VIEW vwAlunoCurso AS
	SELECT 
		a.nomeAluno AS 'Aluno:',
		c.nomeCurso AS 'Curso'
	FROM aluno AS a
		JOIN curso AS c
			ON a.fk_curso = c.id_curso;


-- 11: use a view

SELECT * FROM vwAlunoCurso;
    