CREATE DATABASE pratica_sprint02;
USE pratica_sprint02;

/*exercicio 01*/

/*1.1*/

/*TABLEs*/

CREATE TABLE Dono (
    id_dono INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cpf CHAR(11)
);

CREATE TABLE Pet (
    id_pet INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    raca VARCHAR(45),
    fk_pet_mae INT,
    fk_dono INT,
    CONSTRAINT cFk_pet_mae FOREIGN KEY (fk_pet_mae) REFERENCES Pet(id_pet),
    CONSTRAINT cFk_dono FOREIGN KEY (fk_dono) REFERENCES Dono(id_dono)
);

/*INSERTs*/

INSERT INTO Dono (nome, cpf) VALUES 
('Carlos Silva', '12345678901'),
('Ana Souza', '98765432100');

INSERT INTO Pet (nome, raca, fk_pet_mae, fk_dono) VALUES
('Rex', 'Labrador', NULL, 1),
('Luna', 'Poodle', NULL, 2);

INSERT INTO Pet (nome, raca, fk_pet_mae, fk_dono) VALUES
('Filhote Rex', 'Labrador', 1, 1);

/*SELECTs + JOIN*/

-- Pets e seus donos
SELECT 
    p.nome AS pet,
    p.raca,
    d.nome AS dono
FROM Pet p
	JOIN Dono d ON p.fk_dono = d.id_dono;
    
-- Pets + nome da mãe 
SELECT 
    p.nome AS pet,
    mae.nome AS mae
FROM Pet p
	LEFT JOIN Pet mae ON p.fk_pet_mae = mae.id_pet;
    
-- Pets, donos e mães
SELECT 
    p.nome AS pet,
    p.raca,
    d.nome AS dono,
    mae.nome AS mae
FROM Pet p
	JOIN Dono d ON p.fk_dono = d.id_dono
	LEFT JOIN Pet mae ON p.fk_pet_mae = mae.id_pet;

/*1.2*/

/*TABLEs*/

CREATE TABLE empresa (
    id_empresa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cnpj CHAR(14)
);

CREATE TABLE Funcionario (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cpf CHAR(11),
    fk_supervisor INT,
    fk_empresa INT,
    CONSTRAINT cFk_supervisor FOREIGN KEY (fk_supervisor) REFERENCES Funcionario(id_funcionario),
    CONSTRAINT cFk_empresa FOREIGN KEY (fk_empresa) REFERENCES empresa(id_empresa)
);

/*INSERTs*/

INSERT INTO empresa (nome, cnpj) VALUES
('Tech LTDA', '12345678000199'),
('Inova Corp', '98765432000188');

INSERT INTO Funcionario (nome, cpf, fk_supervisor, fk_empresa) VALUES
('João Mendes', '11111111111', NULL, 1);

INSERT INTO Funcionario (nome, cpf, fk_supervisor, fk_empresa) VALUES
('Maria Oliveira', '22222222222', 1, 1),
('Pedro Santos', '33333333333', 1, 2);

/*SELECTs + JOIN*/

-- Func e Empresa
SELECT 
    f.nome AS funcionario,
    e.nome AS empresa
FROM Funcionario f
	JOIN empresa e ON f.fk_empresa = e.id_empresa;
    
-- Func e Supervisor
SELECT 
    f.nome AS funcionario,
    sup.nome AS supervisor
FROM Funcionario f
	LEFT JOIN Funcionario sup ON f.fk_supervisor = sup.id_funcionario;
    
-- Func, Supervisor e Empresa
SELECT 
    f.nome AS funcionario,
    e.nome AS empresa,
    sup.nome AS supervisor
FROM Funcionario f
	JOIN empresa e ON f.fk_empresa = e.id_empresa
	LEFT JOIN Funcionario sup ON f.fk_supervisor = sup.id_funcionario;

/*1.3*/

/*TABLEs*/

CREATE TABLE pessoa (
    id_pessoa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cpf CHAR(11),
    fk_sombra INT,
    CONSTRAINT cFk_somba FOREIGN KEY (fk_sombra) REFERENCES pessoa(id_pessoa)
);

CREATE TABLE telefone (
    id_telefone INT PRIMARY KEY AUTO_INCREMENT,
    numero VARCHAR(45),
    operadora VARCHAR(45),
    fk_pessoa INT,
    CONSTRAINT cFk_pessoa FOREIGN KEY (fk_pessoa) REFERENCES pessoa(id_pessoa)
);

/*INSERTs*/

INSERT INTO pessoa (nome, cpf, fk_sombra) VALUES
('Lucas Lima', '44444444444', NULL);

INSERT INTO pessoa (nome, cpf, fk_sombra) VALUES
('Clone Lucas', '55555555555', 1);

INSERT INTO telefone (numero, operadora, fk_pessoa) VALUES
('11999999999', 'Vivo', 1),
('11888888888', 'Tim', 1),
('11777777777', 'Claro', 2);

/*SELECTs + JOIN*/

-- pessoa e telefone
SELECT 
    p.nome AS pessoa,
    t.numero,
    t.operadora
FROM telefone t
	JOIN pessoa p ON t.fk_pessoa = p.id_pessoa;
    
-- pessoa e sombra
SELECT 
    p.nome AS pessoa,
    sombra.nome AS sombra
FROM pessoa p
	LEFT JOIN pessoa sombra ON p.fk_sombra = sombra.id_pessoa;
    
-- pessoa, sombra e telefone
SELECT 
    p.nome AS pessoa,
    t.numero,
    t.operadora,
    sombra.nome AS sombra
FROM pessoa p
	LEFT JOIN telefone t ON t.fk_pessoa = p.id_pessoa
	LEFT JOIN pessoa sombra ON p.fk_sombra = sombra.id_pessoa;

/*DESAFIO*/

-- N/A (Não consegui fazer, tirar dúvida com a professora)

/*
exercicio 02
*/

/*TABLEs*/

CREATE TABLE cliente (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45)
);

CREATE TABLE titulo (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(45),
    valor DECIMAL(10,2),
    fk_cliente INT,
    CONSTRAINT cFk_cliente FOREIGN KEY (fk_cliente) REFERENCES cliente(codigo)
);

/*INSERTs*/

INSERT INTO cliente (nome) VALUES
('João Silva'),
('Maria Souza'),
('Carlos Lima');

INSERT INTO titulo (descricao, valor, fk_cliente) VALUES
('Conta de luz', 150.75, 1),
('Conta de água', 80.50, 1),
('Internet', 120.00, 2),
('Aluguel', 900.00, 3);

/*SELECTs + JOIN*/

-- titulo e cliente
SELECT 
    t.descricao,
    t.valor,
    c.nome AS cliente
FROM titulo t
	JOIN cliente c ON t.fk_cliente = c.codigo;

-- total do cliente
SELECT 
    c.nome AS cliente,
    t.descricao,
    t.valor
FROM cliente c
	JOIN titulo t ON t.fk_cliente = c.codigo;

-- cliente sem titulos
SELECT 
    c.nome,
    t.descricao,
    t.valor
FROM cliente c
	LEFT JOIN titulo t ON t.fk_cliente = c.codigo;
    
/*exercicio 03*/

/*TABLEs*/
CREATE TABLE motorista (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    fone VARCHAR(45)
);

CREATE TABLE cliente_2 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    fone VARCHAR(45),
    endereco VARCHAR(45)
);

CREATE TABLE veiculo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    placa VARCHAR(45),
    modelo VARCHAR(45),
    cor VARCHAR(45),
    ano INT,
    motorista_id INT,
    CONSTRAINT cFk_motorista FOREIGN KEY (motorista_id) REFERENCES motorista(id)
);

CREATE TABLE viagem (
    id INT PRIMARY KEY AUTO_INCREMENT,
    data DATE,
    time TIME,
    valor FLOAT,
    origem VARCHAR(45),
    destino VARCHAR(45),
    cliente_id INT,
    motorista_id INT,
    CONSTRAINT cFk_cliente_2 FOREIGN KEY (cliente_id) REFERENCES cliente_2(id),
    CONSTRAINT cFk_motorista_viagem FOREIGN KEY (motorista_id) REFERENCES motorista(id)
);

/*INSERTs*/
INSERT INTO motorista (nome, fone) VALUES
('Carlos Motorista', '11999999999'),
('João Condutor', '11888888888');

INSERT INTO cliente_2 (nome, fone, endereco) VALUES
('Ana Cliente', '11777777777', 'Rua A'),
('Pedro Cliente', '11666666666', 'Rua B');

INSERT INTO veiculo (placa, modelo, cor, ano, motorista_id) VALUES
('ABC-1234', 'Gol', 'Preto', 2018, 1),
('XYZ-5678', 'Onix', 'Branco', 2020, 2);

INSERT INTO viagem (data, time, valor, origem, destino, cliente_id, motorista_id) VALUES
('2025-01-10', '10:30:00', 25.50, 'Centro', 'Shopping', 1, 1),
('2025-01-11', '14:00:00', 40.00, 'Casa', 'Aeroporto', 2, 2);

/*SELECT + JOIN*/

SELECT 
    v.id,
    c.nome AS cliente,
    m.nome AS motorista,
    v.origem,
    v.destino,
    v.valor
FROM viagem v
	JOIN cliente_2 c ON v.cliente_id = c.id
	JOIN motorista m ON v.motorista_id = m.id;
    
SELECT 
    ve.placa,
    ve.modelo,
    m.nome AS motorista
FROM veiculo ve
	JOIN motorista m ON ve.motorista_id = m.id;
    
SELECT 
    c.nome AS cliente,
    m.nome AS motorista,
    ve.placa,
    v.origem,
    v.destino,
    v.valor
FROM viagem v
	JOIN cliente_2 c ON v.cliente_id = c.id
	JOIN motorista m ON v.motorista_id = m.id
	JOIN veiculo ve ON ve.motorista_id = m.id;




