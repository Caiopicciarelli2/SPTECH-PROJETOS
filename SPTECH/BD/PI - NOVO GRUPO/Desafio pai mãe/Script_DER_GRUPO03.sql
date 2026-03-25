CREATE DATABASE DER_GRUPO03;
USE DER_GRUPO03;

/*
GRUPO 03:
Caio Picciarelli Silva
Karina Cupola Alves
Emanuelly Cristini Alves de Melo
Victor De Souza Oliveira
Vitor Da Luz Santos
Isaac Azevedo Pinheiro
*/

/*
Criamos duas tabelas, familias e familiares. 
A tabela familias vai guardar as familias criadas, com nome, id e o "pilar" da família, que será um membro que iniciará a árvore da família.
A tabela familiares terá os familiares de cada familia, diferenciados pela a FK_familia, e pelo sobrenome_familia, além de ter as FKs fk_mae e fk_pai, que vai organizar os parentescos desse membro da família.
*/

CREATE TABLE familias (
	id_familia INT PRIMARY KEY AUTO_INCREMENT,
    nome_familia VARCHAR(45),
    fk_pilar_familia INT UNIQUE
    -- CONSTRAINT cFk_pilar FOREIGN KEY (fk_pilar_familia) REFERENCES familiares(id_familiar)
);

ALTER TABLE familias ADD CONSTRAINT cFk_pilar FOREIGN KEY (fk_pilar_familia) REFERENCES familiares(id_familiar);

CREATE TABLE familiares (
	id_familiar INT PRIMARY KEY AUTO_INCREMENT,
    nome_familiar VARCHAR(45),
    sobrenome_familiar VARCHAR(45),
    fk_mae INT,
    fk_pai INT,
    fk_familia INT
    -- CONSTRAINT cFk_familia FOREIGN KEY (fk_familia) REFERENCES familias(id_familia)
    -- CONSTRAINT cFk_mae FOREIGN KEY (fk_mae) REFERENCES familias(id_familia)
    -- CONSTRAINT cFk_pai FOREIGN KEY (fk_pai) REFERENCES familias(id_familia)
);

ALTER TABLE familiares ADD CONSTRAINT cFk_familia FOREIGN KEY (fk_familia) REFERENCES familias(id_familia);
ALTER TABLE familiares ADD CONSTRAINT cFk_mae FOREIGN KEY (fk_mae) REFERENCES familiares(id_familiar);
ALTER TABLE familiares ADD CONSTRAINT cFk_pai FOREIGN KEY (fk_pai) REFERENCES familiares(id_familiar);

INSERT INTO familias (nome_familia) VALUES
	('Rodrigues'),
    ('Carvalho'),
    ('Silva');
    
INSERT INTO familiares (nome_familiar, sobrenome_familiar, fk_familia) VALUES
	('Caio Rodrigues', 'Rodrigues', '1'),
    ('Bruno Carvalho', 'Carvalho', '2'),
    ('Luiz Silva', 'Silva', '3');

UPDATE familias SET fk_pilar_familia = '1' WHERE id_familia = 1;
UPDATE familias SET fk_pilar_familia = '2' WHERE id_familia = 2;
UPDATE familias SET fk_pilar_familia = '3' WHERE id_familia = 3;

SELECT
	id_familiar AS 'Identificador Pessoal:',
	nome_familiar AS 'Nome:',
    sobrenome_familiar AS 'Sobrenome da Família:',
    fk_mae AS 'Nome da Mãe:',
    fk_pai AS 'Nome do Pai:',
    id_familia AS 'Identificador Familiar:',
	nome_familia AS 'Nome da Família:',
    fk_pilar_familia AS 'Integrante Pilar da Família:'
FROM familiares 
	JOIN familias 
		ON familias.id_familia = familiares.fk_familia;