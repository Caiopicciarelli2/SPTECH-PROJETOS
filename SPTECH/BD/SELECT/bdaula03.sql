CREATE DATABASE aula3BD;

USE aula3BD;

CREATE TABLE professor (
	id INT,
    nome VARCHAR(45),
    cpf CHAR(11),
    salario DECIMAL (6,2),
    tipo VARCHAR(20),
    dtCadastro DATETIME,
    CONSTRAINT PKid PRIMARY KEY (id),
    CONSTRAINT cTIPO CHECK (tipo IN('Assistente', 'Titular', 'Monitor'))
);

ALTER TABLE professor MODIFY COLUMN id INT AUTO_INCREMENT;

/* restrições 

	CONSTRAINT ( comando de restrição ), PKid ( nome da restrição, que vc cria ),
	PRIMARY KEY ( função da restrição ), (id), sempre em parenteses que referencia a coluna da tabela
	
    CONSTRAINT ( comando de restrição ), cTIPO ( nome da restrição, que vc cria ),
	CHECK ( função da restrição ), (tipo IN(...), sempre em parenteses que referencia a coluna da tabela, e IN para checar se
    o tipo foi preenchido corretamente com certas palavras válidas
*/

INSERT INTO professor (nome, cpf, salario, tipo, dtCadastro) VALUES
	('Clara', '11111111111', 1.99, 'Assistente', CURRENT_TIMESTAMP()),
	('Pedro', '22222222222', 1000, 'Monitor', NOW()),
	('Raphael', '33333333333', '5000.99', 'Titular', NOW()),
	('Nicole', '44444444444', '6000.75', 'Titular', CURRENT_TIMESTAMP());

-- insert da datatime de agora, data e hora: CURRENT_ TIMESTAMP() ou NOW(), se for so data: CURDATE().

SELECT * FROM professor;
DESC professor;

-- alterar CONSTRAINT

-- ALTER TABLE professor MODIFY CONSTRAINT cTipo CHECK (tipo IN (...) ); ou
-- ALTER TABLE professor DROP CONSTRAINT cTipo; e 
-- ALTER TABLE professor ADD CONSTRAINT cTipo CHECK (tipo IN(..))

-- NOVAS RESTRIÇÔES

CREATE TABLE aluno (
	id INT PRIMARY KEY AUTO_INCREMENT,
    ra CHAR(8) UNIQUE,
    nome VARCHAR(45),
    dtCadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- nova restrição
-- UNIQUE ( não pode se repetir ( primary key tem UNIQUE por padrão ) ); Usado em RA's, CPF's etc.
-- DEFAULT ( por padrão terá um valor --- CURRENT_TIMESTAMP, ou seja, data de agora SEMPRE )alter
-- DEFAULT, se você não inserir nada no INSERT neste campo, ele coloca a data de agora, automaticamente

INSERT INTO aluno (ra) VALUES
('04261077'),
('04261106'),
('04261177'),
('04256132');

SELECT * FROM aluno;

UPDATE aluno SET nome = 'Caio' WHERE id = 1;
UPDATE aluno SET nome = 'Guilherme' WHERE id = 2;
UPDATE aluno SET nome = 'Pedro' WHERE id = 3;
UPDATE aluno SET nome = 'Daniel' WHERE id = 4;

SELECT * FROM aluno;

-- NOVOS CONCEITOS SELECT
-- AS = Mude como vai exibir, ele téoricamente vai "mudar" a tabela, mas só para exibição, ele não altera as colunas da tabela em si.
-- AS é opicional, mas é mais intuitivo. EXEMPLO: SELECT nome 'Nome Primario'.

SELECT nome AS 'Primeiro Nome', ra AS 'Registro' FROM aluno;

-- OUTRO CONCEITO, parecido com IF e Else, condicional
-- CASE (caso) WHEN ( = ) nome = 'x' = kkk THEN tipo = 'Monitora' 
-- ELSE(Senão) tipo = 'Outro' END
-- somente para exibição, não altera TABLES

SELECT nome, CASE
	WHEN tipo = 'Monitor' THEN 3000.00
    WHEN tipo = 'Assistente' THEN 5000.00
    WHEN tipo = 'Titular' THEN 9000.00
    ELSE 0.00
    END AS 'salario_teste'
FROM professor;

-- condições em WHEN, SE, SE,SE e SENÃO, depois END, e nomiei a coluna para exibição de salario_teste
/*
condição SELECT estrutura:

SELECT ( CAMPOS ) FROM ( TABELA ) CASE ( condições )
*/

CREATE TABLE atleta (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    modalidade VARCHAR(40),
    cpf CHAR(11) UNIQUE NOT NULL,
    dtCadastro DATETIME DEFAULT NOW(),
    qtdMedalhas INT,
    CONSTRAINT cModalidade CHECK(modalidade IN('Atletismo', 'Natação', 'Futebol de Botão'))
);

-- NOT NULL = não pode ser nulo os dados 

INSERT INTO atleta ( nome, modalidade, cpf, qtdMedalhas ) VALUES
	('Phels', 'Natação', '11111111111', 28),
	('Guilherme', 'Natação', '22222222222', '20'),
	('Raphael', 'Futebol de Botão', '33333333333', 10),
	('Rafael', 'Futebol de Botão', '4444444444', 9);
    
-- COMANDOS NOVOS SELECT
-- IFNULL() - Tratamento quando nulo
-- CONCAT() - Concatenação ( Juntar palavras ) | CONCAT ('Hello_','Word')

-- junta nome e modalidade com um espaço entre eles.

SELECT CONCAT(nome, ' ', modalidade) FROM atleta;

-- INSERT básico.

INSERT INTO atleta (cpf) VALUES
	('12345678910');

SELECT IFNULL(nome, 'Sem nome') FROM atleta;

/*se não tiver algo que incrementa se null, ou alguma restrição do campo ficar nulo
 ele trata o campo para não ficar 'null' e sim 'algo'*/
 
/*Usando CONCAT com IFNULL e AS
 AS nomeia uma coluna que tem esses dados para melhor visualização
 IFNULL, se não tem informação = NULL, mostra-se 'x' coisa
 CONCAT junta duas informações em um mesmo campo ou coluna*/

SELECT id, CONCAT( IFNULL(nome, 'Sem Nome'), ' | ', IFNULL(modalidade, 'Sem modalidade')) AS nome_mod FROM atleta;

/*
 SELECT COM CASE, IFNULL, CONCAT, AS
*/

SELECT 
	CASE 
		WHEN qtdMedalhas > 2 THEN 'Muito bom!'
		WHEN qtdMedalhas < 1 THEN 'Vixe! Sem medalha!'
		ELSE 'Tá no caminho, continue!'
		END AS 'Performance',
	CASE 
		WHEN modalidade = 'Futebol de Botão' THEN 'Diferenciado'
        ELSE 'Padrão'
        END AS 'Descrisão Modalidade',
        IFNULL(nome, 'Sem nome'),
        CONCAT('CPF:', ' ', cpf,'/ Cadastrato na data: ', dtCadastro) AS 'Info Registro' 
FROM atleta WHERE nome LIKE 'R%' AND nome LIKE '%1' OR nome NOT LIKE 'P%';

-- AND, da para adicionar outras coisas depois do WHERE por exemplo.
-- OR , OU
-- outro exemplo

SELECT nome, qtdMedalhas FROM atleta WHERE qtdMedalhas BETWEEN 20 AND 40 AND nome LIKE 'P%' ORDER BY nome DESC;

-- BETWEEN ( Entre ), ou seja, qtdMedalhas entre 20 e 40 medalhas e nome tenha P no começo,
-- ordenando-os pelo nome em ordem decrescente.alter










