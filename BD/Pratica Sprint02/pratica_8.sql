/*
	Exercicio: 1
    
Fazer a modelagem lógica de um sistema para cadastrar os clientes, suas vendas e
seus respectivos produtos.
- Cada cliente realiza mais de uma venda.
- Cada venda é de apenas um cliente e tem mais de um produto.
- Cada produto pode ser vendido em mais de uma venda.
- Sobre cada cliente, o sistema guarda um identificador, que identifica de forma única
cada cliente. Além desse identificador, o sistema guarda o nome, o email e o
endereço.
- Sobre cada venda, o sistema guarda um identificador, que identifica de forma única
cada venda. O sistema também guarda o total da venda e a data.
- Sobre cada produto, o sistema guarda um identificador, que identifica de forma
única cada produto. Além desse identificador, o sistema guarda o nome, a descrição
e o preço do produto.
- Um cliente indica outro cliente, necessário que o sistema guarde qual cliente indicou
o outro cliente. Cada cliente pode indicar muitos clientes e cada cliente é indicado por
apenas um cliente.
- O sistema ainda precisa saber quantidade do produto vendido numa determinada
venda e o valor do desconto.
Abra no MySQL Workbench uma nova aba para fazer os comandos SQL.
Escrever os comandos do MySQL para:
*/

/*
a) Criar um banco de dados chamado Venda.
b) Selecionar esse banco de dados.
*/

CREATE DATABASE Venda;
USE Venda;

/*
c) Criar as tabelas correspondentes à sua modelagem
*/

-- cliente 1:N Vendas
-- produto N:N Vendas 

CREATE TABLE cliente(
	id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    email VARCHAR(80),
    cidade VARCHAR(50),
    bairro VARCHAR(80),
    rua VARCHAR(80),
    rua_numero VARCHAR(50),
    fk_indicador INT,
    CONSTRAINT cFk_indicador_Cliente FOREIGN KEY (fk_indicador) REFERENCES cliente(id_cliente)
);

CREATE TABLE venda(
	id_venda INT PRIMARY KEY AUTO_INCREMENT,
    total_venda DECIMAL(10,2),
    dt_venda DATETIME,
    fk_cliente INT,
    CONSTRAINT cFk_cliente_Venda FOREIGN KEY (fk_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE produto(
	id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(80),
    descricao VARCHAR(150),
    preco_produto DECIMAL(10,2)
);

CREATE TABLE aux_venda_produto(
    qtd_produto INT,
    valor_desconto DECIMAL(10,2),
    fk_venda INT,
    fk_produto INT,
    PRIMARY KEY (fk_venda, fk_produto),
    CONSTRAINT cFk_venda_Aux_Venda_Produto FOREIGN KEY (fk_venda) REFERENCES venda(id_venda),
    CONSTRAINT cFk_produto_Aux_Venda_Produto FOREIGN KEY (fk_produto) REFERENCES produto(id_produto)
);

/*
d) Inserir dados nas tabelas, de forma que exista mais de uma venda para cada
cliente, e mais de um cliente sendo indicado por outro cliente.
*/

INSERT INTO cliente (nome, email, cidade, bairro, rua, rua_numero, fk_indicador) VALUES
('Erick "aspas" Santos', 'aspas@valorant.com', 'São Paulo', 'Centro', 'Rua A', '100', NULL),
('Gustavo "Sacy" Rossi', 'sacy@valorant.com', 'Curitiba', 'Batel', 'Rua B', '200', 1),
('Matias "Saadhak" Delipetro', 'saadhak@valorant.com', 'São Paulo', 'Zona Sul', 'Rua C', '300', 1),
('Khalil "pancada" Schmidt', 'pancada@valorant.com', 'Rio de Janeiro', 'Copacabana', 'Rua D', '400', 2),
('Bryan "pANcada2" Luna', 'pan2@valorant.com', 'Belo Horizonte', 'Savassi', 'Rua E', '500', 2);

INSERT INTO produto (nome, descricao, preco_produto) VALUES
('Vandal Prime', 'Skin lendária da Vandal', 120.00),
('Phantom Oni', 'Skin Oni da Phantom', 100.00),
('Operator Reaver', 'Skin Reaver da Operator', 150.00),
('Knife Karambit', 'Faca estilo karambit', 200.00);

INSERT INTO venda (total_venda, dt_venda, fk_cliente) VALUES
(220.00, '2026-05-01 14:00:00', 1),
(150.00, '2026-05-01 15:00:00', 1),
(100.00, '2026-05-02 10:00:00', 2),
(250.00, '2026-05-02 11:00:00', 2),
(200.00, '2026-05-03 09:00:00', 3);

INSERT INTO aux_venda_produto (fk_venda, fk_produto, qtd_produto, valor_desconto) VALUES
(1, 1, 1, 0.00),
(1, 2, 1, 0.00),
(2, 3, 1, 10.00),
(3, 2, 1, 0.00),
(3, 4, 1, 20.00),
(4, 1, 2, 15.00),
(5, 4, 1, 0.00);

/*
e) Exibir todos os dados de cada tabela criada, separadamente.
*/

SELECT *
	FROM cliente AS c
		LEFT JOIN cliente AS indicador 
			ON c.fk_indicador = indicador.id_cliente
		JOIN venda AS v
			ON v.fk_cliente = c.id_cliente
		JOIN aux_venda_produto AS aux 
			ON aux.fk_venda = v.id_venda
		JOIN produto AS p
			ON p.id_produto = aux.fk_produto;
            
/*
f) Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação
das tabelas.
FEITO
*/

/*
g) Exibir os dados dos clientes e os dados de suas respectivas vendas.
*/

SELECT 
    c.id_cliente AS 'Identificador Cliente:',
    c.nome AS 'Nome Cliente:',
    c.email AS 'Email Cliente:',
    v.id_venda AS 'Identificador Venda:',
    v.total_venda 'Valor Venda:',
    v.dt_venda 'Data Venda:'
FROM cliente AS c
	JOIN venda AS v
		ON v.fk_cliente = c.id_cliente;
    
/*
h) Exibir os dados de um determinado cliente (informar o nome do cliente na consulta)
e os dados de suas respectivas vendas
*/

SELECT 
    c.id_cliente AS 'Identificador Cliente:',
    c.nome AS 'Nome Cliente:',
    c.email AS 'Email Cliente:',
    v.id_venda AS 'Identificador Venda:',
    v.total_venda 'Valor Venda:',
    v.dt_venda 'Data Venda:'
FROM cliente AS c
	JOIN venda AS v
		ON v.fk_cliente = c.id_cliente
WHERE c.nome = 'Erick "aspas" Santos';

/*
i) Exibir os dados dos clientes e de suas respectivas indicações de clientes.
*/

SELECT 
	c.id_cliente AS 'Identificador Cliente:',
    c.nome AS 'Nome Cliente:',
    indicador.id_cliente AS 'Identificador Indicador:',
    indicador.nome AS 'Indicador Cliente:'
FROM cliente AS c
	LEFT JOIN cliente AS indicador
		ON c.fk_indicador = indicador.id_cliente;
        
/*
j) Exibir os dados dos clientes indicados e os dados dos respectivos clientes
indicadores, porém somente de um determinado cliente indicador (informar o nome
do cliente que indicou na consulta).
*/

SELECT 
    indicador.id_cliente AS 'Identificador Indicador:',
    indicador.nome AS 'Identificador Cliente:',
    c.id_cliente AS 'Identificador Indicado:',
    c.nome AS 'Nome Indicado:'
FROM cliente AS c
	JOIN cliente AS indicador
		ON c.fk_indicador = indicador.id_cliente
WHERE indicador.nome = 'Erick "aspas" Santos';

/*
L) Exibir os dados dos clientes, os dados dos respectivos clientes que indicaram,
os dados das respectivas vendas e dos produtos.
*/
SELECT 
    c.id_cliente AS 'Identificador Cliente:',
    c.nome AS 'Nome Cliente:',
    indicador.nome AS 'Nome Indicador:',
    v.id_venda AS 'Identificador Venda:',
    v.dt_venda AS 'Data Venda:',
    p.nome AS 'Nome Produto:',
    aux.qtd_produto AS 'Quantidade Produto:',
    aux.valor_desconto AS 'Desconto Venda:'
FROM cliente AS c
	LEFT JOIN cliente AS indicador
		ON c.fk_indicador = indicador.id_cliente
	JOIN venda AS v
		ON v.fk_cliente = c.id_cliente
	JOIN aux_venda_produto AS aux
		ON aux.fk_venda = v.id_venda
	JOIN produto AS p
		ON p.id_produto = aux.fk_produto;


/*
m) Exibir apenas a data da venda, o nome do produto e a quantidade do produto
numa determinada venda.
*/
SELECT 
    v.dt_venda AS 'Data Venda:',
    p.nome AS 'Nome Produto:',
    aux.qtd_produto AS 'Quantidade Produto:'
FROM venda AS v
	JOIN aux_venda_produto AS aux
		ON aux.fk_venda = v.id_venda
	JOIN produto AS p
		ON p.id_produto = aux.fk_produto
WHERE v.id_venda = 1;

/*
n) Exibir apenas o nome do produto, o valor do produto e a soma da quantidade de
produtos vendidos agrupados pelo nome do produto.
*/
SELECT 
    p.nome AS 'Nome Produto:',
    p.preco_produto AS 'Preço Produto:',
    SUM(aux.qtd_produto) AS 'Total Vendido:'
FROM produto AS p
	JOIN aux_venda_produto AS aux
		ON aux.fk_produto = p.id_produto
GROUP BY p.id_produto, p.nome, p.preco_produto;


/*
o) Inserir dados de um novo cliente. Exibir os dados dos clientes, das respectivas
vendas, e os clientes que não realizaram nenhuma venda.
*/
INSERT INTO cliente (nome, email, cidade, bairro, rua, rua_numero, fk_indicador)
VALUES ('Novo Cliente', 'novo@email.com', 'São Paulo', 'Centro', 'Rua Nova', '123', NULL);

SELECT 
    c.id_cliente AS 'Identificador Cliente:',
    c.nome AS 'Nome Cliente:',
    v.id_venda AS 'Identificador Venda:',
    v.total_venda AS 'Total Venda:'
FROM cliente AS c
	LEFT JOIN venda AS v
		ON v.fk_cliente = c.id_cliente;


/*
p) Exibir o valor mínimo e o valor máximo dos preços dos produtos.
*/
SELECT 
    MIN(preco_produto) AS 'Menor Preço Produto:',
    MAX(preco_produto) AS 'Maior Preço Produto:'
FROM produto;


/*
q) Exibir a soma e a média dos preços dos produtos.
*/
SELECT 
    SUM(preco_produto) AS 'Soma Preços dos Prudutos:',
    AVG(preco_produto) AS 'Média Preços dos Produtos:'
FROM produto;


/*
r) Exibir a quantidade de preços acima da média entre todos os produtos.
*/

-- SELECT 
--    COUNT(*) AS 'Quantidade Acima da Média:'
-- FROM produto
-- WHERE preco_produto > '10.00'
-- );
-- Não consegui


/*
s) Exibir a soma dos preços distintos dos produtos.
*/
SELECT 
    SUM(DISTINCT preco_produto) AS 'Soma Distinta:'
FROM produto;


/*
t) Exibir a soma dos preços dos produtos agrupado por uma determinada venda.
*/

SELECT 
    v.id_venda AS 'Identificador Venda:',
    SUM(p.preco_produto * aux.qtd_produto) AS 'Total Calculado:'
FROM venda AS v
	JOIN aux_venda_produto AS aux
		ON aux.fk_venda = v.id_venda
	JOIN produto AS p
		ON p.id_produto = aux.fk_produto
GROUP BY v.id_venda;


/*
	EXERCICIO: 2
    Modelagem:
    
    USUARIO ||--o{ CREDENCIAL : "possui"
    USUARIO ||--o{ SESSAO : "tem_sessao"
    USUARIO }|--|{ USUARIO_PAPEL : "possui"
    PAPEL }|--|{ USUARIO_PAPEL : "definido_em"

    USUARIO {
        INT id_usuario PK
        VARCHAR nome
        VARCHAR email_principal
        DATETIME data_cadastro

    }

    CREDENCIAL {
        INT id_credencial PK
        INT id_usuario FK
        VARCHAR username
        VARCHAR senha_hash
        DATETIME ultimo_login

    }

    SESSAO {
        VARCHAR id_sessao PK
        INT id_usuario FK
        DATETIME inicio_sessao
        DATETIME expira_em
        VARCHAR ip_acesso
    }

    PAPEL {
        INT id_papel PK
        VARCHAR nome_papel "Ex: Admin, Comum, Editor"
        TEXT descricao
    }
    USUARIO_PAPEL {
        INT id_usuario FK
        INT id_papel FK
        DATETIME atribuido_em PK
        PRIMARY KEY (id_usuario, id_papel)
    }
*/