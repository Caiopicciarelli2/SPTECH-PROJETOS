
-- Funcoes relacionadas a data

/* 1. Função DATE_FORMAT() - > Permite configurar a formatação da data
 conforme a parametriação 
 */
 
 SELECT DATE_FORMAT('2026-02-26 10:23:00', '%d/%m/%Y, %a, %H:%i') AS 'data: PT-BR';
/* Primeiro '', é a data crua no BD,
e o segundo '' depois da virgula é a formatação. 
% sugere um campo, d = Day; m = month e Y ( Maisculo 4 dígitos ) = year;
y minusculo = ano com 2 dígitos
%a = dia em inglês com 3 digitos
%H = hora e %i = minutos
*/

-- Função para trazer somente o ano

SELECT YEAR('2025-10-11');
SELECT YEAR(NOW());

-- Função para trazer somente em horário

SELECT TIME('2026-02-26 10:28:58') AS 'Guilherme Barbosa Albuquerque';

CREATE DATABASE aulacco4;
USE aulacco4;

CREATE TABLE pedido (
	id INT PRIMARY KEY AUTO_INCREMENT,
    dt_hora_pedido DATETIME DEFAULT NOW(),
    nome_cliente VARCHAR(45)
);

INSERT INTO pedido (nome_cliente) VALUE
	('Caio Picciarelli Silva'),
    ('Guilherme Albuquerque'),
    ('Luiz Carlos Duarte Silva');
    
SELECT * FROM pedido;

INSERT INTO pedido (dt_hora_pedido, nome_cliente) VALUES
	('', 'ababababa'),
    ('ababbudud'),
    ('dmajien');
    
-- só dia

SELECT nome_cliente, MONTH(dt_hora_pedido) FROM pedido;

SELECT CONCAT( 
	'Cliente ', nome_cliente, ' realizou o pedido neste mẽs, na data ', DATE_FORMAT(dt_hora_pedido, '%d/%m') )
	AS 'Detalhamento' FROM pedido WHERE MONTH(dt_hora_pedido) > 1 AND YEAR(dt_hora_pedido) > 2025;
    
-- desafio

CREATE DATABASE Biblioteca;
USE Biblioteca;

CREATE TABLE livro (
	codigo INT PRIMARY KEY,
    titulo VARCHAR(40),
    autor VARCHAR(40) DEFAULT 'Sem autor',
    dt_publicacao DATE
);

INSERT INTO livro (codigo, titulo, autor, dt_publicacao ) VALUES
	('1', 'Damn', 'DamnSilva', '2026-02-26'),
    ('2', 'JSHJ', 'DamJoa', '2026-02-25');

ALTER TABLE usuario ADD CONSTRAINT cTipo CHECK ( tipo IN('a', 'b', 'c'));