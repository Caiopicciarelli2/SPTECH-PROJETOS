

-- exc 01:

CREATE TABLE usuarios (
    id INT PRIMARY KEY, -- PRIMARI estava errado
    nome VARCHAR(100),
    email VARCHAR(100), -- VCHAR estava errado
    data_nascimento DATE
);

CREATE TABLE pedidos (
    id INT PRIMARY KEY,
    id_usuario INT,
    data_pedido DATETIME,
    valor DECIMAL(10,2),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id) -- nome da FK estava errado
);

INSERT INTO usuarios (id, nome, email, data_nascimento)
VALUES 
(1, 'João Silva', 'joao@email.com', '1988-05-12'),
(2, 'Maria Souza', 'maria@email.com', '1992-08-23'); -- email corrigido

INSERT INTO pedidos (id, id_usuario, data_pedido, valor)
VALUES 
(1, 1, '2023-03-10 14:30:00', 259.90), -- datetime incompleto
(2, 2, '2023-04-02 10:45:00', 399.50); -- valor não deve ser string

UPDATE usuarios
SET email = 'joao.silva@email.com'
WHERE nome = 'João Silva'; -- string sem aspas // WHERE id_usuario = 1;

DELETE FROM pedidos -- faltava FROM
WHERE valor < 300;

SELECT u.nome, p.data_pedido, p.valor
FROM usuarios u
JOIN pedidos p ON u.id = p.id_usuario; -- join errado

SELECT u.nome, p.data_pedido
FROM usuarios u
LEFT JOIN pedidos p ON u.id = p.id_usuario;

SELECT u.nome, p.data_pedido
FROM usuarios u
RIGHT JOIN pedidos p ON u.id = p.id_usuario; -- coluna errada

ALTER TABLE usuarios
MODIFY email VARCHAR(150),
ADD COLUMN telefone VARCHAR(20); -- faltava vírgula

-- exc 02:

CREATE TABLE clientes (
    id INT PRIMARY KEY,
    nome VARCHAR(100), -- VARCH errado
    telefone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE vendas (
    id INT PRIMARY KEY,
    id_cliente INT,
    data_venda DATE,
    valor_total DECIMAL(10,2), -- DECIML errado
    FOREIGN KEY (id_cliente) REFERENCES clientes(id) -- sintaxe errada
);

INSERT INTO clientes VALUES
(1, 'Carlos Lima', '1199999999', 'carlos@email.com'),
(2, 'Fernanda Dias', NULL, 'fernanda@email.com');

INSERT INTO vendas VALUES
(1, 1, '2023-02-15', 150.00),
(2, 2, '2023-03-01', NULL);

SELECT nome, valor_total
FROM vendas v 
JOIN clientes c ON v.id_cliente = c.id
WHERE valor_total >= 100
ORDER BY valor_total DESC; -- ORDER errado

SELECT nome, IFNULL(telefone, 'Sem telefone')
FROM clientes;

SELECT CONCAT(nome, ' - ', email) AS contato -- concat com + estava errado
FROM clientes;

SELECT nome, valor_total,
    CASE 
        WHEN valor_total > 200 THEN 'Alto' -- faltava WHEN
        WHEN valor_total BETWEEN 100 AND 200 THEN 'Médio'
        ELSE 'Baixo'
    END AS categoria
FROM vendas v
JOIN clientes c ON c.id = v.id_cliente;


-- exc 03:

CREATE TABLE livros (
    id INT PRIMARY KEY, -- PRIMARY incompleto
    titulo VARCHAR(150),
    autor VARCHAR(100),
    ano_publicacao INT,
    disponivel BOOLEAN
);

CREATE TABLE emprestimos (
    id INT PRIMARY KEY,
    livro_id INT,
    nome_leitor VARCHAR(100),
    data_emprestimo DATE,
    data_devolucao DATE,
    FOREIGN KEY (livro_id) REFERENCES livros(id) -- FOREIGN KEYS errado
);

INSERT INTO livros VALUES
(1, '1984', 'George Orwell', 1949, TRUE),
(2, 'Dom Casmurro', 'Machado de Assis', 1899, FALSE);

INSERT INTO emprestimos VALUES
(1, 2, 'Ana Paula', '2023-01-10', NULL),
(2, 1, 'Carlos Alberto', '2023-02-05', '2023-02-20'); -- livro inexistente corrigido

SELECT titulo, ano_publicacao
FROM livros
WHERE disponivel = TRUE -- não usa aspas
ORDER BY ano_publicacao DESC;

SELECT nome_leitor, IFNULL(data_devolucao, 'Não devolvido')
FROM emprestimos;

SELECT CONCAT(nome_leitor, ' - ', titulo) AS leitura -- concat corrigido
FROM emprestimos e
JOIN livros l ON e.livro_id = l.id;

SELECT titulo, disponivel,
    CASE 
        WHEN disponivel = TRUE THEN 'Disponível'
        WHEN disponivel = FALSE THEN 'Emprestado'
        ELSE 'Desconhecido'
    END AS status
FROM livros;

-- exc 04:

CREATE TABLE alunos (
    id INT PRIMARY KEY, -- PRIMERY errado
    nome VARCHAR(100),
    data_nascimento DATE,
    peso FLOAT,
    altura FLOAT,
    telefone VARCHAR(15)
);

CREATE TABLE treinos (
    id INT PRIMARY KEY,
    aluno_id INT,
    tipo VARCHAR(50),
    duracao INT,
    data DATE,
    FOREIGN KEY (aluno_id) REFERENCES alunos(id) -- sintaxe errada
);

INSERT INTO alunos VALUES
(1, 'Lucas Nogueira', '1995-09-12', 78.5, 1.75, '11988776655'),
(2, 'Patrícia Alves', '1988-03-22', 65.3, NULL, '11999887766');

INSERT INTO treinos VALUES
(1, 1, 'Cardio', 45, '2023-05-10'),
(2, 2, 'Musculação', 60, '2023-05-12'); -- número não deve ser string

SELECT nome, peso, altura
FROM alunos
WHERE peso > 70 AND altura IS NOT NULL
ORDER BY altura DESC;

SELECT nome, IFNULL(altura, 0) AS altura
FROM alunos;

SELECT CONCAT('Aluno: ', nome, ' - Telefone: ', telefone)
FROM alunos;

SELECT nome, tipo, duracao,
    CASE
        WHEN duracao < 30 THEN 'Curto'
        WHEN duracao BETWEEN 30 AND 60 THEN 'Moderado'
        ELSE 'Longo'
    END AS intensidade
FROM treinos;


-- exc 05:

CREATE TABLE jogadores (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    nickname VARCHAR(50),
    pais_origem VARCHAR(50)
);

CREATE TABLE torneios (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    premiacao DECIMAL(8,2),
    data_torneio DATE
);

CREATE TABLE inscricoes (
    jogador_id INT,
    torneio_id INT,
    data_inscricao DATE,
    status VARCHAR(20),
    PRIMARY KEY (jogador_id, torneio_id), -- PRIMARY errado
    FOREIGN KEY (jogador_id) REFERENCES jogadores(id), -- REFERENCE errado
    FOREIGN KEY (torneio_id) REFERENCES torneios(id)
);

INSERT INTO jogadores VALUES
(1, 'Lucas Pereira', 'Lukao', 'Brasil'),
(2, 'Emily Chan', 'ShadowQueen', 'China');

INSERT INTO torneios VALUES
(1, 'Summer Cup', 5000, '2023-07-10'),
(2, 'Winter Clash', 7500.00, '2023-12-15');

INSERT INTO inscricoes VALUES
(1, 1, '2023-06-01', 'confirmado'),
(2, 2, '2023-11-20', NULL);

UPDATE inscricoes
SET status = 'confirmado' -- string sem aspas
WHERE jogador_id = 2 AND torneio_id = 2;

DELETE FROM inscricoes -- faltava FROM
WHERE status IS NULL;

SELECT j.nome, t.nome, i.status
FROM jogadores j
JOIN inscricoes i ON i.jogador_id = j.id
JOIN torneios t ON t.id = i.torneio_id;

SELECT j.nome, t.nome
FROM jogadores j
LEFT JOIN inscricoes i ON j.id = i.jogador_id
LEFT JOIN torneios t ON i.torneio_id = t.id;

SELECT j.nome, t.nome
FROM jogadores j
RIGHT JOIN inscricoes i ON j.id = i.jogador_id
RIGHT JOIN torneios t ON i.torneio_id = t.id;

SELECT nickname, pais_origem
FROM jogadores
WHERE pais_origem = 'Brasil'
ORDER BY pais_origem; -- faltava BY

SELECT CONCAT(nome, ' (', nickname, ')') AS jogador,
       IFNULL(pais_origem, 'Não informado') AS pais
FROM jogadores;

SELECT j.nome, i.status,
    CASE
        WHEN i.status = 'confirmado' THEN 'Participante'
        WHEN i.status IS NULL THEN 'Aguardando'
        ELSE 'Outro'
    END AS situacao
FROM jogadores j
JOIN inscricoes i ON j.id = i.jogador_id;

ALTER TABLE jogadores
ADD nacionalidade VARCHAR(50),
MODIFY nickname VARCHAR(100);