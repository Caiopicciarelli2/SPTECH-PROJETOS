CREATE TABLE empresa_parceira(
	id_empresa INT PRIMARY KEY AUTO_INCREMENT, 
	nome VARCHAR(45) NOT NULL,
    cnpj CHAR(14),
	endereco VARCHAR(45) NOT NULL
    
);

CREATE TABLE usuario(
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
	email VARCHAR(45) NOT NULL,
	senha VARCHAR(45) NOT NULL,
	nivel_acesso VARCHAR(45) NOT NULL,
	fk_empresa_parceira INT NOT NULL,
	CONSTRAINT ctFkUsuarioEmpresa FOREIGN KEY(fk_empresa_parceira) REFERENCES empresa_parceira(id_empresa),
	CONSTRAINT ctNivelAcesso CHECK (nivel_acesso IN ('ADMIN','OPERADOR'))
);

CREATE TABLE ponto_monitoramento (
	id_ponto_monitoramento INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(45) NOT NULL,
	CC INT NOT NULL,
	CONSTRAINT ctFKponto_empresa FOREIGN KEY(V) REFERENCES empresa_parceira(id_empresa)
);

CREATE TABLE sensor(
	id_sensor INT PRIMARY KEY AUTO_INCREMENT,
	fk_ponto INT NOT NULL,
	status VARCHAR(45),
	CONSTRAINT ctFkSensorPonto FOREIGN KEY (fk_ponto) REFERENCES ponto_monitoramento(id_ponto_monitoramento),
	CONSTRAINT ctStatus CHECK (status IN ('ATIVO','DESATIVADO'))
);

CREATE TABLE dado_captado(
	id_dado_captado INT PRIMARY KEY AUTO_INCREMENT,
	fk_sensor INT NOT NULL,
	data_hora DATETIME,
	quantidade_pessoas INT,
	CONSTRAINT ctFkDadoSensor FOREIGN KEY(fk_sensor) REFERENCES sensor(id_sensor)
);



