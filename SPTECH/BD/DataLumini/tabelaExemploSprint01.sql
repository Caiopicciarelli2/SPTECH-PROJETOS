CREATE DATABASE sprint01;
USE sprint01;

-- tabela de cadastro da empresa

CREATE TABLE cadastroEmpresa (
	id_empresa INT PRIMARY KEY AUTO_INCREMENT,
    nome_empresa VARCHAR (45),
    sigla_empresa VARCHAR(10),
    cnpj_empresa CHAR(18) NOT NULL,
    nome_ceo VARCHAR(50),
    email_empresa VARCHAR(50),
    cidade_empresa VARCHAR(50),
    endereco_empresa VARCHAR(50), 
    dt_cadastro_empresa DATE,
    nat_jurifica VARCHAR(45), -- tipo juridico de serviço da empresa
    token_unico_cad_funcionario CHAR(12) UNIQUE, -- token de cadastro do funcionario na empresa, para o funcionario ser conectar ao sistema da empresa ( somente usado na primeira vez de cadastro de cada funcionario )
    token_unico_login_empresa CHAR(12) UNIQUE, -- token de login em outro dispositivo junto a senha 
	senha_login_empresa VARCHAR(36) -- login da empresa em outros computadores solicitando senha ADM empresa + TOKEN cad empresa
);

-- token é único, com 12 digitos que se auto complementa randomicamente após a inserção de alguma linha na tabela! E ele também não pode se repetir pra dois usúarios diferentes

DROP TABLE cadastroEmpresa;
SELECT * FROM cadastroEmpresa;

INSERT INTO cadastroEmpresa ( nome_empresa, sigla_empresa, cnpj_empresa, nome_ceo, email_empresa, cidade_empresa, endereco_empresa, nat_jurifica ) VALUES
	('TechNova Soluções Tecnológicas Ltda', 'TNOVA', '12.345.678/0001-90', 'Mariana Alves Costa', 'contato@technova.com.br', 'São Paulo', 'Av. Paulista, 1500 – Bela Vista', 'Sociedade Empresária Limitada'),
    ('VerdeCampo Biotecnologia S/A', 'VCBIO', '98.765.432/0001-10', 'Ricardo Menezes Lima', 'atendimento@verdecampo.com.br', 'Campinas', 'Rua das Inovações, 250 - Parque Tecnológico', 'Sociedade Anônima');

-- tabela de cadastro e login de um funcionario na empresa

CREATE TABLE cadastroFuncionarios (
	id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome_funcionario VARCHAR (45),
    cpf_funcionario CHAR(18) NOT NULL,
    cargo_funcionario VARCHAR(30),
    email_funcionario VARCHAR(50),
    senha_funcionario VARCHAR(18),
    telefone_funcionario CHAR(11),
    dt_cadastro_funcionario DATE
);

ALTER TABLE cadastroFuncionarios ADD CONSTRAINT cCargo_funcionario CHECK (cargo_funcionario IN('Estagiario', 'Junior', 'Pleno', 'Senior', 'Administrador')); 
-- perms, baseado no cargo ( ideia mais pra frente, interresante ter para citar na apresentação )

DROP TABLE cadastroFuncionarios;
SELECT * FROM cadastroFuncionarios;
DESC cadastroFuncionarios;

INSERT INTO cadastroFuncionarios (nome_funcionario, cpf_funcionario, cargo_funcionario, email_funcionario, senha_funcionario) VALUES
	('Lucas Andrade Souza', '123.456.789-00', 'Junior', 'lucas.andrade@empresa.com', 'lucas123'),
	('Camila Ferreira Lima', '987.654.321-00', 'Pleno', 'camila.lima@empresa.com', 'camila456'),
	('Rafael Martins Costa', '456.789.123-00', 'Administrador', 'rafael.costa@empresa.com', 'rafael789');
    
-- tabela empresa site operacional

CREATE TABLE gerirEmpresa (
	id_empresa INT PRIMARY KEY AUTO_INCREMENT,
    nome_empresa VARCHAR (45),
    cnpj_empresa CHAR(18) NOT NULL,
    num_funcionarios INT,
    cargos_empresa VARCHAR(35),
    num_estufas INT
);
    
-- tabela arduinos nas estufas

CREATE TABLE arduinosInstalados (
	id_arduino INT PRIMARY KEY AUTO_INCREMENT,
    nome_arduino VARCHAR (45),
    especifacao_arduino CHAR(18) NOT NULL, -- Uma sequência de indentificação de tipos de arduino para organização
    tipo_modelo_arduino VARCHAR(40), -- EXMP : XKL-32
    num_estufa_arduino VARCHAR(30),
    num_grupo_arduino VARCHAR(50),
    dt_instalacao_arduino DATETIME
);

-- tabela padrão baseada em cada arduino

CREATE TABLE unidadeArduino (
	id_arduino INT PRIMARY KEY AUTO_INCREMENT,
    nome_especificado_ardunino VARCHAR(45), -- nome x do ardunio x separado pela tabela acima
    tipo_modelo_arduino VARCHAR(40),
    num_estufa_arduino VARCHAR(30),
    num_grupo_arduino VARCHAR(50),
	dt_recebimento_dados DATETIME DEFAULT CURRENT_TIMESTAMP(), -- recebimento de dados a cada momento
    iluminacao_status TINYINT NOT NULL, -- se está ligada ou desligada
    iluminacao_nivel_forca VARCHAR(35), -- supondo que o arduino não consiga calcular tudo perfeitamente, a gente pode colocar níveis de força da luz, onde ela manda x de mol/rad por segundo nas plantas, o que da espaço para calcular a incidência de luz.
    CONSTRAINT cIluminacao_nivel_forca CHECK (iluminacao_nivel_forca IN('Muito Baixo', 'Baixo', 'Médio', 'Alto', 'Muito Alto'))
);