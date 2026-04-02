-- Atributo Atomico: menor forma de um atributo
-- Atributo Composto: Vários elementos 

CREATE DATABASE revisao_Sprint2;
USE revisao_Sprint2;

CREATE TABLE pessoa (
	id_pessoa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cpf CHAR(11) UNIQUE NOT NULL
);

-- Atributo Multivalorado ( Possui mais de um valor )
-- É diferente de um atributo composto -> Este possui os valores
-- dentro do mesmo campo

-- relação forte e fraca -  Ligação depende da CERTEZA de que x tabela DEPEDENTE de y tabela

CREATE TABLE telefone(
	id_telefone INT PRIMARY KEY AUTO_INCREMENT,
    numero CHAR(11),
    fk_pessoa INT,
    CONSTRAINT cFk_pessoa FOREIGN KEY (fk_pessoa) REFERENCES pessoa(id_pessoa)
);

CREATE TABLE dependente(
	id_dependente INT AUTO_INCREMENT,
    nome VARCHAR(60),
    cpf CHAR(11) UNIQUE NOT NULL,
    fk_pessoa INT,
    PRIMARY KEY (id_dependente, fk_pessoa),
    CONSTRAINT cFk_pessoa_dependente FOREIGN KEY (fk_pessoa) REFERENCES pessoa(id_pessoa)
);

-- semantica da chave composta, crie o id e fk INT, coloque uma PK com os dois campos
-- e adicione a constraint da FK

-- Insert na table pessoa primeiro, porque a fk_pessoa existe nas outras

INSERT INTO pessoa (nome, cpf) VALUES
	('Clara Faria', '11111111111'),
    ('Fernando Brandão', '22222222222'),
    ('Júlia Araripe', '33333333333');
    
INSERT INTO telefone (numero, fk_pessoa) VALUES
	('1198888888', 1),
    ('1198888887', 1),
    ('98888888', 2);
    
INSERT INTO dependente(nome, cpf, fk_pessoa) VALUES
	('Pedro Silva', '77777777777', 1);
    
/*
	JOINS
		A júlia não apareceu por não ter um telefone, se eu quiser inclui-la preciso fazer LEFT ou RIGHT JOIN
			Esquema: TABLE PESSOA (todas as pessoas que tem telefone) TABLE TELEFONE, 
		mas se eu quiser trazer todas as pessoas, 
			LEFT JOIN (traz todas as pessoas e as pessoas que tem telefone)
		Se eu quiser trazer as pessoas,
			que tem telefon e os telefones que não tem uma pessoa, RIGHT JOIN
		
        A ordem de ser LEFT ou JOIN, é baseado na ordem dos join e froms do meu SELECT
*/

SELECT * FROM pessoa JOIN telefone ON id_pessoa = fk_pessoa;

-- Exemplo com apelidos para a tabela (otimização de código, e referenciar campos com nomes iguais em tabelas diferentes)
SELECT * 
	FROM pessoa AS p
    JOIN telefone AS t 
	ON p.id_pessoa = t.fk_pessoa;
 
-- Exemplo dos campos com nomes iguais
/*
SELECT * 
	FROM pessoa 
	JOIN telefone 
    ON fk_pessoa = id_pessoa AQUI
    JOIN dependente
    ON id_pessoa = fk_pessoa; AQUI
*/ 

-- correto
SELECT * 
	FROM pessoa AS p
		JOIN telefone AS t
			ON p.id_pessoa = t.fk_pessoa
		JOIN dependente AS d
			ON p.id_pessoa = d.fk_pessoa;
            
-- Exemplo de um campo FK que referência a propria tabela

-- preparando tabela pessoa
ALTER TABLE pessoa ADD COLUMN fk_chefe INT;
ALTER TABLE pessoa ADD CONSTRAINT cFk_chefe FOREIGN KEY (fk_chefe) REFERENCES pessoa(id_pessoa);

-- Adicionando alguém como Fk_chefe
UPDATE pessoa SET fk_chefe = 2 WHERE id_pessoa = 3;

SELECT * 
	FROM pessoa AS ps
	JOIN pessoa as cf
		ON ps.fk_chefe = cf.id_pessoa;
        
-- Outro exemplo

SELECT 
	   IFNULL(cf.nome, 'Sem chefe') AS 'Nome Chefe:',
	   ps.nome AS 'Nome funcionário:'
			FROM pessoa AS ps
			LEFT JOIN pessoa as cf
		ON ps.fk_chefe = cf.id_pessoa;
-- LEFT JOIN, para selecionar todas as pessoas, até mesmo as pessoas sem CHEFE
-- caso alguma pessoa não tem chefe, = Sem chefe:

-- atributo identificador ( determinante ) = PK

CREATE TABLE funcionario (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100), area_id INT,
    supervisor_id INT,
    CONSTRAINT cFk_area FOREIGN KEY (area_id) REFERENCES area(id_area),
    CONSTRAINT cFk_supervisor FOREIGN KEY (supervisor_id) REFERENCES funcionario(id)
);

-- atividade
CREATE TABLE area(id INT PRIMARY KEY AUTO_INCREMENT,nome VARCHAR(100));
CREATE TABLE funcionario (id INT PRIMARY KEY AUTO_INCREMENT,nome VARCHAR(100),area_id INT,supervisor_id INT, FOREIGN KEY (area_id) REFERENCES area(id_area), FOREIGN KEY (supervisor_id) REFERENCES funcionario(id));
INSERT INTO area (nome) VALUES ('Marketing'),('Financeiro'),('TI');
INSERT INTO funcionario (nome, area_id, supervisor_id) VALUES ('Carla', 1, 1),('Diego', 3, 1),('Lia', 3, 1),('Ana', 1, 1),('Bruno', 1, 4),('Paulo', 2, 1),('Rita', 2, 6);
SELECT * FROM funcionario AS funcionario JOIN funcionario AS supervisor ON funcionario.id = supervisor.supervisor_id JOIN area AS a ON area.id = funcionario.id_area;
SELECT * FROM funcionario AS funcionario JOIN funcionario AS supervisor ON funcionario.id = supervisor.supervisor_id WHERE supervisor.supervisor_id = 4;
-- SELECT funcionario.nome, area.nome, CASE WHEN funcionario FROM funcionario AS funcionario JOIN funcionario AS supervisor