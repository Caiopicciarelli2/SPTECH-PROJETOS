CREATE DATABASE ccoaSp02;
USE ccoaSp02;

CREATE TABLE cliente(
	id INT PRIMARY KEY auto_increment,
    nome VARCHAR(45),
    cpf CHAR(11)
);

CREATE TABLE pedido(
	id INT PRIMARY KEY AUTO_INCREMENT,
    dt_pedido DATETIME,
    valor DECIMAL(7,2),
    fk_cliente INT,
    CONSTRAINT cFk_Cliente foreign key (fk_cliente) REFERENCES cliente(id)
);

INSERT INTO cliente (nome, cpf) VALUES
	('Clara', '11111111111'),
    ('Matheus', '11111111112'),
    ('Marina', '11111111113');
    
INSERT INTO pedido (dt_pedido, valor, fk_cliente) VALUES
	(NOW(), 2500.00, 1),
    ('2026-04-22 10:00:26', 3100.00, 1),
    (NOW(), 9800.00, 1),
    (NOW(), 1200.00, 3);
    
-- funções
/*
	SUM() : Soma todos os elementos
*/

SELECT SUM(valor) AS 'Receita Mensal' FROM pedido;

/*
	AVG() : Realizar a média dos elementos
*/
SELECT AVG(valor) AS 'Ticket Médio' FROM pedido;

/*
	ROUND() : Arredondar saída - ,2 casas decimais | 0,6 pra cima 0,4 | pra baixo
*/

SELECT ROUND(AVG(valor), 2) AS 'Ticket Médio' FROM pedido;

/*
	TRUNCATE elimina as casas decimais, pós o valor especifícado
    TRUNCATE 1 casa decimal
    100.999 - 100.99
*/

SELECT TRUNCATE(SUM(valor), 1) AS 'Receita Total Formatada' FROM pedido;

-- MAX() - maior valor e MIN() menor valor

SELECT MAX(valor) FROM pedido;
SELECT MIN(valor) FROM pedido;

-- COUNT() -  Quantos elementos 

SELECT COUNT(id) FROM pedido;

-- desafio

SELECT 
	c.nome, SUM(p.valor) 
		FROM cliente AS c 
			JOIN pedido AS p
				ON p.fk_cliente = c.id
		GROUP BY c.nome;
-- soma todos os valores de cada cliente, agrupando as informações pelo NOME

-- desafio 2

SELECT 
	c.nome AS 'Maiores Compradores', SUM(p.valor) 
		FROM cliente AS c 
			JOIN pedido AS p
				ON p.fk_cliente = c.id
	WHERE p.valor > 3000
		GROUP BY c.nome;
        
/* 
	limita as colunas que possuem compras maiores que 3000, ou seja
	soma as compras dos clientes que foram maior que 3000.
*/

SELECT 
	c.nome AS 'Maiores Compradores', SUM(p.valor) 
		FROM cliente AS c 
			JOIN pedido AS p
				ON p.fk_cliente = c.id
		GROUP BY c.nome
				HAVING SUM(p.valor) > 3000;
                
-- traz o cliente que tem a soma dos pedidos maior que 3000

/*
	ORDEM:
    
	SELECT...
    FROM...
    JOIN...
    WHERE...
    GROUP BY...
    HAVING...
    ORDER BY...
*/

-- desafio 3

SELECT 
	c.nome AS 'Maiores Compradores', c.cpf, SUM(p.valor) 
		FROM cliente AS c 
			JOIN pedido AS p
				ON p.fk_cliente = c.id
		GROUP BY c.nome
				HAVING SUM(p.valor) > 3000;
                
-- erro porque ele não especificou o que vai fazer com o cpf

SELECT 
	c.nome AS 'Maiores Compradores',
    c.cpf AS 'CPF do Cliente',
    SUM(p.valor) AS 'Valor total de compras'
		FROM cliente AS c 
			JOIN pedido AS p
				ON p.fk_cliente = c.id
		GROUP BY c.nome, c.cpf
				HAVING SUM(p.valor) > 3000;
                
-- especificou o uso do cpf

-- desafio 4

SELECT 	c.nome AS 'Nome Cliente:',
		MAX(p.valor) 'Valor Máximo:' 
	FROM cliente AS c
				JOIN pedido AS p
					ON p.fk_cliente = c.id
	GROUP BY c.nome;
    
/* 
	agrupar pelo nome significa olhas todas as linhas de um cliente,
    para verficar a operação, por isso que todas essas funções
	agregadas precisam de GROUP BY
*/

SELECT 	c.nome 
		FROM cliente c 
			JOIN pedido p 
				ON p.fk_cliente = c.id 
		GROUP BY c.nome;
        
/*	
	retorna o nome do cliente de cada compra feita,
	se não tivesse o GROUP BY ele retornaria várias vezes
    os nomes, com o GROUP BY, mesmo que a "clara" tenha
    feito + de uma compra, ainda vai aparecer só uma vez.
*/



