CREATE DATABASE Fk_PK;
USE Fk_PK;

-- Supervisor será Null Fk_supervisor
-- Funcionario terá algo na Fk_supervisor


-- table FORTE ( não depende de nenhuma table )
CREATE TABLE funcionario (
	id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cpf CHAR(11) NOT NULL UNIQUE,
    salario DECIMAL(7,2),
    fk_supervisor INT,
    CONSTRAINT ctFk_Supervisor FOREIGN KEY (fk_supervisor) REFERENCES funcionario(id_funcionario)
);

CREATE TABLE dependente(
	id_dependente INT,
    nome VARCHAR(45),
    cpf CHAR(11) NOT NULL UNIQUE,
    fk_funcionario INT,
    -- chave composta que guarda o funcionario que sustenta o dependente, e o dependente
    CONSTRAINT chave_composta PRIMARY KEY (id_dependente, fk_funcionario),
    CONSTRAINT ctFk_funcionario FOREIGN KEY (fk_funcionario) REFERENCES funcionario(id_funcionario)
);

INSERT INTO funcionario (nome, cpf, salario, fk_supervisor) VALUES
	('Clara Faria', '11111111111', 15000, null),
    ('Vivian Silva', '11111111112', 15000, null),
    ('Marcos Paulo', '2222222222', 6000, 1),
    ('Raphael Canuto', '3333333333', 6000, 2);
    
SELECT * FROM funcionario AS func JOIN funcionario AS supervisor
	ON func.id_funcionario = supervisor.fk_supervisor;
    
SELECT * FROM funcionario AS func JOIN funcionario AS supervisor
	ON func.id_funcionario = supervisor.fk_supervisor;
    
SELECT id_funcionario AS 'Identificador Funcionario:',
	   nome AS 'Nome Funcionario:',
       cpf AS 'CPF:',
       fk_supervisor, 
	CASE WHEN fk_supervisor IS NULL 
		THEN 'Funcionario!' 
		ELSE 'Supervisor' 
    END AS 'Cargo:'
FROM funcionario ;