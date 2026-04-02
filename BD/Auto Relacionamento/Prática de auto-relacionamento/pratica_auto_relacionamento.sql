CREATE DATABASE modelagem_auto;
USE modelagem_auto;

/*
Exercício 1:

Regra de negócio:
 - 1 funcionário tem no mínimo um supervisor, que também é funcionário e no máximo 1 supervisor;
 - 1 supervisor supervisiona no mínimo 1 funcionário e no máximo muitos;
 - 1 funcionário trabalha em somente uma área da empresa, exemplo: marketing, financeiro, TI;
 - 1 área tem muitos funcionários;
*/

-- Criar a modelagem(feito);


-- Criar as tabelas;

CREATE TABLE area_empresa(
	id_area INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45)
);

CREATE TABLE funcionario(
	id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cpf CHAR(11) UNIQUE NOT NULL,
    fk_area INT,
    fk_supervisor INT,
    CONSTRAINT cFk_empresa FOREIGN KEY (fk_area) REFERENCES area_empresa(id_area),
    CONSTRAINT cFk_supervisor FOREIGN KEY (fk_supervisor) REFERENCES funcionario(id_funcionario) 
);

-- Inserir dados;

INSERT INTO area_empresa (nome) VALUES
	('Marketing'),
	('Financeiro'),
	('TI');
    
INSERT INTO funcionario (nome, cpf, fk_area) VALUES
	('Carlos Silva', '11111111111', 1),
	('Ana Souza', '22222222222', 2),
	('Bruno Lima', '33333333333', 3);
    
INSERT INTO funcionario (nome, cpf, fk_area, fk_supervisor) VALUES
	('João Pedro', '44444444444', 1, 1),
	('Mariana Alves', '55555555555', 1, 1),
	('Lucas Rocha', '66666666666', 2, 2),
	('Fernanda Costa', '77777777777', 3, 3),
	('Rafael Mendes', '88888888888', 3, 3);
    
-- SELECT com JOIN

SELECT 
    area_e.id_area AS 'Identificador Área',
    area_e.nome AS 'Área',
    func.nome AS 'Funcionário',
    IFNULL(f_supervisor.nome, 'Sem supervisor') AS 'Supervisor'
FROM area_empresa AS area_e
	JOIN funcionario AS func
		ON area_e.id_area = func.fk_area
	LEFT JOIN funcionario AS f_supervisor
		ON func.fk_supervisor = f_supervisor.id_funcionario;
        
-- SELECT com JOIN e WHERE

SELECT 
    area_e.id_area AS 'Identificador Área',
    area_e.nome AS 'Área',
    func.nome AS 'Funcionário',
    IFNULL(f_supervisor.nome, 'Sem supervisor') AS 'Supervisor'
FROM area_empresa AS area_e
	JOIN funcionario AS func
		ON area_e.id_area = func.fk_area
	LEFT JOIN funcionario AS f_supervisor
		ON func.fk_supervisor = f_supervisor.id_funcionario
WHERE func.nome = 'Carlos SIlva';

-- SELECT com JOIN e CASE

SELECT 
    area_e.id_area AS 'Identificador Área',
    CASE 
		WHEN area_e.nome = 'Marketing' THEN 'Desempregado'
        ELSE area_e.nome
	END AS 'Área',
    func.nome AS 'Funcionário',
    IFNULL(f_supervisor.nome, 'Sem supervisor') AS 'Supervisor'
FROM area_empresa AS area_e
	JOIN funcionario AS func
		ON area_e.id_area = func.fk_area
	LEFT JOIN funcionario AS f_supervisor
		ON func.fk_supervisor = f_supervisor.id_funcionario
WHERE func.nome = 'Carlos SIlva';

/*
Exercício 2:

Regra de negócio:
1 usuário gerencia no mínimo 0 usuários e no máximo muitos usuários;
1 usuário é gerenciado por somente 1 usuário gerente;
1 usuário tem no mínimo 1 email e no máximo n emails;
1 email é somente de um usuário;
*/

-- Criar a modelagem(feito);


-- Criar tabelas

CREATE TABLE usuario (
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cpf CHAR(11) NOT NULL UNIQUE,
    fk_gerente INT,
    CONSTRAINT cFk_gerente 
        FOREIGN KEY (fk_gerente) 
        REFERENCES usuario(id_usuario)
);

CREATE TABLE email (
	id_email INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(45),
    fk_usuario INT,
    CONSTRAINT cFk_usuario 
        FOREIGN KEY (fk_usuario) 
        REFERENCES usuario(id_usuario)
);

INSERT INTO usuario (nome, cpf) VALUES
	('Carlos Silva', '11111111111'),
	('Ana Souza', '22222222222'),
	('Bruno Lima', '33333333333');
    
INSERT INTO usuario (nome, cpf, fk_gerente) VALUES
	('João Pedro', '44444444444', 1),
	('Mariana Alves', '55555555555', 1),
	('Lucas Rocha', '66666666666', 2),
	('Fernanda Costa', '77777777777', 3),
	('Rafael Mendes', '88888888888', 3);
    
INSERT INTO email (email, fk_usuario) VALUES
	('carlos@email.com', 1),
	('carlos2@email.com', 1),
	('ana@email.com', 2),
	('bruno@email.com', 3),
	('joao@email.com', 4),
	('mariana@email.com', 5);
    
-- SELECT COM JOIN

SELECT 
    em.id_email AS 'Identificador Email',
    em.email AS 'Email',
    us.nome AS 'Usuário',
    us.cpf AS 'CPF',
    IFNULL(f_gerente.nome, 'Sem Gerente') AS 'Gerente'
FROM email AS em
	JOIN usuario AS us
		ON em.fk_usuario = us.id_usuario
	LEFT JOIN usuario AS f_gerente
		ON us.fk_gerente = f_gerente.id_usuario;
        
-- SELECT COM JOIN E WHERE

SELECT 
    em.id_email AS 'Identificador Email',
    em.email AS 'Email',
    us.nome AS 'Usuário',
    us.cpf AS 'CPF',
    IFNULL(f_gerente.nome, 'Sem Gerente') AS 'Gerente'
FROM email AS em
	JOIN usuario AS us
		ON em.fk_usuario = us.id_usuario
	LEFT JOIN usuario AS f_gerente
		ON us.fk_gerente = f_gerente.id_usuario
WHERE em.fk_usuario = 1;

-- SELECT COM CASE E JOIN

SELECT 
    em.id_email AS 'ID Email',
    em.email AS 'Email',
    us.nome AS 'Usuário',
    us.cpf AS 'CPF',
    IFNULL(f_gerente.nome, 'Sem gerente') AS 'Gerente',
    CASE 
        WHEN us.fk_gerente IS NULL THEN 'Gerente'
        ELSE 'Subordinado'
    END AS 'Tipo de Usuário'
FROM email AS em
	JOIN usuario AS us
		ON em.fk_usuario = us.id_usuario
	LEFT JOIN usuario AS f_gerente
		ON us.fk_gerente = f_gerente.id_usuario;
        
