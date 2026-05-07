CREATE DATABASE sub_query;

USE sub_query;

CREATE TABLE departamento(
	id_departamento INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45)
);

CREATE TABLE funcionario(
	id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(80),
    salario DECIMAL(10,2),
    fk_departamento INT,
    CONSTRAINT cFk_Funcionario_fk_departamento FOREIGN KEY (fk_departamento) REFERENCES departamento(id_departamento)
);

INSERT INTO departamento (nome) VALUES
	('TI'),
    ('RH'),
    ('DP'),
    ('Vendas');

INSERT INTO funcionario (nome, salario, fk_departamento) VALUES
	('Clara', 5000, 1),
    ('Vivian', 5500, 1),
    ('Pedro', 6200, 2),
    ('Walter', 9999, 4);
    
-- subquery - Consulta dentro de uma consulta
-- Separado por ();
-- subquery no FROM PRECISA de AS 

-- trazendo nome e salário de todos da TI (WHERE)

SELECT nome, salario FROM funcionario WHERE fk_departamento 
	IN(
		SELECT id_departamento FROM departamento WHERE nome = 'TI'
    );
    
-- trazendo o nome dos funcionarios onde salario é maior que média (WHERE)

SELECT nome, salario FROM funcionario WHERE 
	salario > (
		SELECT AVG(salario) FROM funcionario
    ); 
    
-- subquery (FROM)

SELECT * 
	FROM (
		SELECT 	
			fk_departamento,
			AVG(salario) AS media_salario
        FROM funcionario GROUP BY fk_departamento
    )AS Media
WHERE media_salario > 4000;

-- pegue todos os dados da tabela media

CREATE VIEW sub_query_view AS
	SELECT 	
		fk_departamento,
		AVG(salario) AS media_salario
	FROM funcionario
	GROUP BY fk_departamento;
    
-- select sub_query exatamente igual ao exemplo de cima porém mais otimizado
 
SELECT * FROM sub_query_view WHERE media_salario > 4000;

