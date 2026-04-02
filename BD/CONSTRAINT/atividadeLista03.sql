/*
1 – Loja de Jogos
No MySQL Workbench, crie o banco de dados "game_store"
*/

CREATE DATABASE game_store;
USE game_store;

/*
A loja de jogos “Game Store” estava passando dificuldades de organização pois o
dono Mário, um simpático senhor italiano aposentado que trabalhou com
encanamento durante sua juventude, não tinha controle do seu estoque de jogos.
*/

/*
Para ajudar Mário a organizar sua loja de jogos,
um estudante da SPTech propôs criar uma tabela chamada “jogo”
que continha o id como número e chave primária que se
autoincrementa, o nome do jogo com tamanho máximo de
30 caracteres, o nome do diretor do jogo com tamanho máximo
de 30 caracteres, o gênero com tamanho de 30 caracteres,
a data de lançamento, a nota do jogo (entre 0-10) e um
campo para guardar a quantidade de unidades disponíveis.
*/

CREATE TABLE jogo (
	idJogo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30),
    diretor VARCHAR(30),
    genero VARCHAR(30),
    dtLancamento DATE,
    nota DECIMAL (4,2),
    quantidade INT,
    CONSTRAINT cNota CHECK (nota BETWEEN 0 AND 10)
);

-- 1. Insira pelo menos 5 registros para a tabela.

INSERT INTO jogo ( nome, diretor, genero, dtLancamento, nota, quantidade ) VALUES
	('Zelda', 'Caio Picciarelli', 'Aventura', '1983-03-27', 10, 83),
    ('Minecraft', 'Guilherme Barbosa', 'Aventura', '2011-11-21', 9.5, 210),
    ('GTAV', 'Pedro Carvalho', 'Ação', '2016-02-17', 9.2, 327),
    ('The Last Of Us', 'Nori Dog', 'Apocalipse', '2019-04-28', 10, 92),
    ('Donkey Kong', 'Bill Gates', 'Plataforma', '1993-12-01', 8.5, 15),
    ('Free Fire', 'Garena Studio', 'Battle Royale', '2018-02-19', 7.3, 68);
	
/*
  2. Altere a tabela para inserir uma coluna que represente o tipo de
mídia que deve armazenar o tipo de jogo apenas com os valores
“física” ou “digital”.
*/

ALTER TABLE jogo ADD COLUMN tipoMidia VARCHAR(30);
ALTER TABLE jogo ADD CONSTRAINT cTipoMidia CHECK ( tipoMidia IN ( 'Física', 'Digital'));

-- 3. Atualize os registros dos jogos inseridos anteriormente

UPDATE jogo SET tipoMidia = 'Digital' WHERE idJogo = 1;
UPDATE jogo SET tipoMidia = 'Física' WHERE idJogo = 2;
UPDATE jogo SET tipoMidia = 'Digital' WHERE idJogo = 3;
UPDATE jogo SET tipoMidia = 'Digital' WHERE idJogo = 4;
UPDATE jogo SET tipoMidia = 'Física' WHERE idJogo = 5;
UPDATE jogo SET tipoMidia = 'Física' WHERE idJogo = 6;

SELECT * FROM jogo;

-- 4. Exiba apenas os jogos com data de lançamento a partir de 2015.

SELECT * FROM jogo WHERE dtLancamento >= '2015-01-01';

-- 5. Exiba os jogos que tenham a letra “a” em seu nome e são de mídia física.

SELECT * FROM jogo WHERE nome LIKE '%a%' AND tipoMidia = 'Física';

-- 6. Exiba os jogos onde o nome do diretor não contenha a letra “e”.

SELECT * FROM jogo WHERE diretor NOT LIKE '%e%';

-- 7. Altere a tabela para criar uma checagem na inserção da nota, onde o valor 
-- não pode ser menor que 0 e nem maior que 10.não pode ser menor que 0 e nem maior que 10.

-- Já fiz! Na criação da TABLE jogo;

-- 8. Exiba os jogos de um determinado gênero e que ainda esteja em estoque.

SELECT * FROM jogo WHERE genero = 'Aventura' AND quantidade > 0;

--  9. Exclua os jogos que não têm mais unidades disponíveis em estoque.

DELETE FROM jogo WHERE quantidade = 0;
-- Não consigo deletar por causa do modo seguro, porém o comando está certo

/*
10. Renomeie a coluna “diretor” para “criador” e exiba como ficou a estrutura da
tabela. 
*/

ALTER TABLE jogo RENAME COLUMN diretor TO criador;
DESC jogo;

/*
2 – Esportes Olímpicos
No MySQL Workbench, crie o banco de dados "olimpiadas".
*/

CREATE DATABASE olimpiadas;
USE olimpiadas;

/*
Casimiro, um fã apaixonado por esportes, decidiu que queria acompanhar de
perto as Olimpíadas. Ele pediu ajuda a um amigo para criar uma tabela que
armazenasse informações sobre os esportes praticados nas Olimpíadas. 
*/

/*
Eles criaram uma tabela chamada "esporte" que continha id como número e chave
primária que se autoincrementa, nome que armazena o nome do esporte com
limite de 40 caracteres, a categoria do esporte com limite de 20 caracteres que
aceita apenas ("Individual" ou "Coletivo"), o número de jogadores que podem
participar por equipe, estreia que armazena a data de quando o esporte estreou
nas Olimpíadas e o nome do país de origem do esporte com até 30 caracteres.
*/

CREATE TABLE esporte (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    categoria VARCHAR(20),
    numJogadores INT,
    estreia DATE,
    paisOrigem VARCHAR(30),
    CONSTRAINT Ccategoria CHECK (categoria IN('Individual', 'Coletivo'))
);

-- 1. Insira pelo menos 5 registros na tabela.

INSERT INTO esporte (nome, categoria, numJogadores, estreia, paisOrigem) VALUES
	('Futebol Masc.', 'Coletivo', '11', '2020-03-11', 'Brasil'),
    ('Vôlei Masc.', 'Coletivo', '6', '2020-02-29', 'U.S.A'),
    ('Tênis', 'Individual', '1', '2020-04-05', 'Dinamarca'),
    ('Basquete', 'Coletivo', '5', '2020-03-02', 'Senegal'),
    ('Skate', 'Individual', '1', '2020-03-19', 'Brasil'),
    ('Tênis de Mesa em Dupla', 'Coletivo', '2', '2020-03-01', 'Brasil');

/*
2. Altere a tabela para adicionar uma coluna popularidade que armazene a
popularidade do esporte como um valor decimal entre 0 e 10 e exiba como
ficou a estrutura da tabela.
*/

ALTER TABLE esporte ADD COLUMN popularidade DECIMAL (4,2);
ALTER TABLE esporte ADD CONSTRAINT cPopularidade CHECK (popularidade BETWEEN 0 AND 10); 

/*
3. Atualize os registros para definir a popularidade dos esportes inseridos
anteriormente.
*/

UPDATE esporte SET popularidade = '8.5' WHERE id = 1;
UPDATE esporte SET popularidade = '9.9' WHERE id = 2;
UPDATE esporte SET popularidade = '10.0' WHERE id = 3;
UPDATE esporte SET popularidade = '7.2' WHERE id = 4;
UPDATE esporte SET popularidade = '6.1' WHERE id = 5;
UPDATE esporte SET popularidade = '9.85' WHERE id = 6;

-- 4. Exiba os esportes ordenados por popularidade em ordem crescente.

SELECT * FROM esporte ORDER BY popularidade ASC;

/*
5. Exiba apenas os esportes que estrearam nas Olimpíadas a partir do ano
2000
*/

UPDATE esporte SET estreia = '1999-12-31' WHERE id = 1;
SELECT * FROM esporte WHERE estreia >= '2000-01-01';

/*
6. Crie uma checagem para que não possa ser inserido valores dentro de
estreia que seja menor que 06 de abril de 1896 e depois da data atual.
*/

UPDATE esporte SET estreia = '2020-12-31' WHERE id = 1;
ALTER TABLE esporte ADD CONSTRAINT Cestreia CHECK (estreia BETWEEN '1986-04-06' AND '2026-02-20');

/*
7. Altere a tabela para excluir a regra de inserção de categoria, assim
podendo colocar valores além de "Individual" ou "Coletivo"
*/

ALTER TABLE esporte DROP CONSTRAINT Cestreia;

/*
8. Exiba apenas os esportes cujo nome do país de origem tenha "a" na
segunda letra.
*/

SELECT * FROM esporte WHERE paisOrigem LIKE '_a%';

/*
9. Exiba os dados onde o número de jogadores por
equipe esteja entre 4 e 11.
*/

SELECT * FROM esporte WHERE numJogadores BETWEEN 4 AND 11;

/*
10. Remova os registros onde id seja 1, 3 e 5.
*/

DELETE FROM esporte WHERE id IN(1,3,5);
SELECT * FROM esporte;

/*
3 – Desenhos Animados
No MySQL Workbench, crie o banco de dados "desenho".
*/

CREATE DATABASE desenho;
USE desenho;

/*
Você foi contratado para criar um banco de dados que armazene informações
detalhadas sobre desenhos animados exibidos na emissora. O objetivo é manter
um catálogo com as seguintes informações.
*/

/*
Para atender a essa necessidade, você propôs a criação de uma tabela com os
seguintes campos: id, um número inteiro chave primária da tabela, este valor
deverá ser autoincrementado a partir do 10. Título, um campo de texto com
tamanho de 50 caracteres que armazenará o título do desenho animado. A data de
lançamento um campo que armazenará a data de lançamento do desenho. O
nome da emissora original, um campo de texto com tamanho de 50 caracteres.
Classificação, um campo que armazenará a classificação indicativa do desenho.
Status, um campo de texto com tamanho de 15 caracteres, que armazenará o
status do desenho. Nota, um campo que armazenará a avaliação do desenho,
permitindo valores de 1 a 5.
*/

CREATE TABLE desenho (
	id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(50),
    dtLancamento DATE,
    emissora VARCHAR(50),
    classificacao INT,
    statusD VARCHAR(15),
    nota TINYINT,
    CONSTRAINT cNota CHECK (nota BETWEEN 1 AND 5)
)AUTO_INCREMENT = 10;

/*
1. Exibir todos os dados da tabela ( como não pediu para
inserir e quer os dados, vou inserir alguns desenhos. 
*/

INSERT INTO desenho (titulo, dtLancamento, emissora, classificacao, statusD, nota) VALUES
	('Incrível Mundo de Gumball', '2017-02-25', 'Cartoon Network', 14, 'Bom', 4.5),
    ('Hora de Aventura', '2014-01-03', 'Cartoon Network', 16, 'Muito Bom', 5), 
    ('Phineas e Ferb', '2009-04-11', 'Disney XD', 10, 'Médio', 3.8),
    ('Bob Esponja', '2013-09-14', 'Nickelodeon', 12, 'Incrível', 4.8),
    ('Peixonalta', '2004-10-11', 'Nickelodeon', 6, 'Muito Bom', 5);
    
SELECT * FROM desenho;

/*
2. Exibir todos os desenhos com a classificação menor
ou igual a 14 anos
*/

SELECT * FROM desenho WHERE classificacao <= 14;

/*
3. Exibir todos os desenhos de uma mesma emissora
original
*/

SELECT * FROM desenho WHERE emissora = 'Cartoon Network';

/*
4. Modificar o campo status, para que aceite apenas o status 'exibindo',
'finalizado', 'cancelado', tente inserir algum outro valor para ver se a regra
foi aplicada
*/

UPDATE desenho SET statusD = 'exibindo' WHERE id = 10;
UPDATE desenho SET statusD = 'finalizado' WHERE id = 11;
UPDATE desenho SET statusD = 'finalizado' WHERE id = 12;
UPDATE desenho SET statusD = 'cancelado' WHERE id = 13;
UPDATE desenho SET statusD = 'exibindo' WHERE id = 14;

ALTER TABLE desenho ADD CONSTRAINT cStatusD CHECK (statusD IN('exibindo', 'finalizado', 'cancelado'));

/*
5. Modificar o status 'exibindo' para 'finalizado'
de 2 desenhos pelo ID
*/

UPDATE desenho SET statusD = 'finalizado' WHERE id IN(10,14);

/*
6. Deletar a linha do desenho de ID 12
*/

DELETE FROM desenho WHERE id = 12;

/*
7. Exibir apenas os desenhos que comecem com uma
determinada letra, caso A
*/

SELECT * FROM desenho WHERE titulo LIKE 'a%';

/*
8. Renomear a coluna classificacao para classificacaoIndicativa
*/

ALTER TABLE desenho RENAME COLUMN classificacao TO classificacaoIndicativa;

/*
9. Atualizar a nota e data de lançamento do desenho de ID 11
*/

UPDATE desenho SET nota = '3' WHERE id = 11;
UPDATE desenho SET dtLancamento = '1999-10-12' WHERE id = 11;

/*
10. Limpe todos os dados da tabela
*/

TRUNCATE TABLE desenho;

/*
11. Remover a regra do status do desenho
*/

ALTER TABLE desenho DROP CONSTRAINT cStatusD;

/*
4 – Despensa do Scooby-Doo
No MySQL Workbench, crie o banco de dados "estoque".
*/

CREATE DATABASE estoque;
USE estoque;

/*
A turma do Scooby Doo percebeu que os alimentos guardados no armário estavam
sumindo de forma muito rápida. Para ter um melhor controle, Fred propôs criar
um banco de dados que registrasse os dados de entrada e saída dos alimentos do
armário.
*/

/*
Ele criou uma tabela chamada "MisteriosSA", que possui os campos id um número
inteiro chave primária, nome um campo de texto para armazenar o nome do
produto, data da compra para armazenar a data na qual o produto foi comprado,
preço valor numérico com casas decimais, peso um valor numérico que armazena
o peso em gramas e data de retirada para armazenar a data em que o produto foi
consumido.
*/

CREATE TABLE MisteriosSA (
	id INT PRIMARY KEY,
    nome VARCHAR(40),
    dtCompra DATE,
    preco DECIMAL (6,2),
    peso DECIMAL (6,2),
    dtRetirada DATE
);

/*
1. Insira na tabela, no mínimo 5 compras de alimentos com datas diferentes.
Por agora, não preencha a coluna referente a "data de retirada".
*/

INSERT INTO MisteriosSA ( id, nome, dtCompra, preco, peso ) VALUES
	(1, 'Hamburguer', '2026-02-20', 29.99, 800),
    (2, 'Tomate Verm.', '2026-02-22', 6.74, 150),
    (3, 'Salsicha', '2026-02-18', 9.89, 500),
    (4, 'Bife Patinho', '2026-02-24', 20.63, 400),
    (5, 'Salada Crespa', '2026-02-23', 5.73, 200),
    (6, 'Quijo Mussarela', '2026-02-19', 15.66, 500);
    
/*
2. Verifique se os valores foram inseridos corretamente.
*/

SELECT * FROM MisteriosSA;

/*
3. Exiba os nomes, dtCompras e retirada e id dos alimentos
em ordem a partir das compras mais antigas
*/

SELECT id, nome, dtCompra, dtRetirada FROM MisteriosSA ORDER BY dtCompra ASC;

/*
4. Atualize a data dos biscoitos retirados, que foram comprados a mais tempo
*/

UPDATE MisteriosSA SET dtRetirada = '2026-02-24' WHERE id = 1;

/*
5. Altere o nome da coluna "id" para "idComida"
*/

ALTER TABLE MisteriosSA RENAME COLUMN id TO idComida;

/*
6. A dicione uma CHECK para os alimentos poderem ser somente "Biscoitos Scooby ou Cachorro-Quente"
*/
UPDATE MisteriosSA SET nome = 'Biscoitos Scooby' WHERE idComida IN(1,3,5);
UPDATE MisteriosSA SET nome = 'Cachorro-Quente' WHERE idComida IN(2,4,6);

ALTER TABLE MisteriosSA ADD CONSTRAINT cNome CHECK (nome IN('Biscoitos Scooby', 'Cachorro-Quente'));

/*
7. Exiba "Biscoitos Scooby, para dtCompra - data da compra e dtRetirada - data de retirada
*/

SELECT idComida, nome, 
	   dtCompra AS 'data da compra',
       dtRetirada AS 'data da retirada'
       FROM MisteriosSA WHERE nome = 'Biscoitos Scooby';
       
/*
8.  Exiba os alimentos que foram comprados antes do dia 25 de Julho de 2024
*/

UPDATE MisteriosSA SET dtCompra = '2024-06-24' WHERE idComida = 1;
SELECT * FROM MisteriosSA WHERE dtCompra < '2024-06-25';

/*
9. Exiba alimentos com preco maior ou igual a 30.50
*/

UPDATE MisteriosSA SET preco = '30.68' WHERE idComida IN(1,2);
SELECT * FROM MIsteriosSA WHERE preco >= 30.50;

/*
10. Limpe a tabela
*/

TRUNCATE TABLE MisteriosSA;
SELECT * FROM MisteriosSA;

/*
5 - Heróis 

No MySQL Workbench, crie o banco de dados "Vingadores".
*/

CREATE DATABASE Vingadores;
USE Vingadores;

/*
Crie uma tabela chamada “heroi”, onde terá um campo de nome contendo até 45
caracteres. O seu herói poderá ter uma versao, onde será armazenado o filme de
sua escolha, esse campo aceitará até 45 caracteres. Todo herói, tem uma
habilidade que se destaca entre os outros super-heróis. Todo herói tem uma
altura, esse campo aceitará valores inteiros representando centímetros. O id
deverá se autoincrementar.
*/

CREATE TABLE heroi (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(45),
    versao VARCHAR(45),
    habilidade VARCHAR(20),
    alturaCm INT
);

/*
Insira 5 heróis para derrotar o vilão Doutor Destino.
*/

INSERT INTO heroi (nome, versao, habilidade, alturaCM) VALUES
	('Homem de Ferro', 'Vingadores Ultimato', 'Armas tecnlogicas', 178),
	('Capitão América', 'Vingadores: Era de Ultron', 'Escudo de Titânio', 190),
	('Homem Aranha', 'Homem Aranha: Sem Volta Pra Casa', 'Solta Teias', 182),
	('Doutor Estranho', 'Homem Aranha: Sem Volta Pra Casa', 'Magia', 185),
	('Pantera Negra', 'O Pantera Negra', 'Armadura Tecnologica', 188),
	('Hulk', 'Thor: Amor e Trovão', 'Super Força', 235);
    
/*
1. Exiba os dados inseridos na tabela
*/

SELECT * FROM heroi;

/*
2. Adicione um campo de regeneração, onde ele aceitará apenas os valores
booleanos de TRUE ou FALSE.
*/

ALTER TABLE heroi ADD COLUMN regeneracao TINYINT(1);
DESC heroi;

/*
3. Modifique o campo versão para aceitar até 100 caracteres
*/

ALTER TABLE heroi MODIFY COLUMN versao VARCHAR(100);
 
/*
4. Remova o herói de id 3 pois ele se morreu em batalha.
*/

DELETE FROM heroi WHERE id = 3;

/*
5. Chegou reforços, insira um novo herói para a equipe.
*/

INSERT INTO heroi(nome, versao, habilidade, alturaCM) VALUES
	('Miles Morales', 'Homem Aranha: No AranhaVerso', 'Solta Teias', 178);
    
/*
6. Exiba todos os dados inseridos na tabela onde o nome do herói começa
com “C” ou “H”.
*/

SELECT * FROM heroi WHERE nome LIKE 'H%' OR nome LIKE 'C%';

/*
7. Exiba todos os dados inseridos na tabela onde o nome do herói não contém
a letra “A” no campo nome.
*/

SELECT * FROM heroi WHERE nome NOT LIKE '%A%';

/*
8. Exiba apenas o nome do herói onde a altura for maior que 190
*/

SELECT nome FROM heroi WHERE alturaCm > 190;

/*
9. Exiba todos os dados da tabela de forma decrescente pelo nome onde a
altura do herói for maior que 180.
*/

SELECT * FROM heroi WHERE alturaCm > 180 ORDER BY nome DESC;

/*
10. Limpe os dados da tabela.;
*/

TRUNCATE TABLE heroi;