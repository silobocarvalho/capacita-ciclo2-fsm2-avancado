-- EXEMPLO 1
CREATE TABLE produtos(
    id_produto SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL,
    categoria VARCHAR(50),
    imagem_url VARCHAR(255)
) CREATE TABLE estoque(
    id_estoque SERIAL PRIMARY KEY,
    id_produto INT,
    quantidade INT NOT NULL,
    localizacao VARCHAR(100),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto) ON DELETE CASCADE
)
INSERT INTO
    produtos (nome, descricao, preco, categoria, imagem_url)
VALUES
    (
        'Produto 1',
        'Descrição do Produto 1',
        100.00,
        'Categoria A',
        'url1.jpg'
    ),
    (
        'Produto 2',
        'Descrição do Produto 2',
        200.00,
        'Categoria B',
        'url2.jpg'
    ),
    (
        'Produto 3',
        'Descrição do Produto 3',
        150.50,
        'Categoria A',
        'url3.jpg'
    ),
    (
        'Produto 4',
        'Descrição do Produto 4',
        300.99,
        'Categoria C',
        'url4.jpg'
    ),
    (
        'Produto 5',
        'Descrição do Produto 5',
        50.00,
        'Categoria B',
        'url5.jpg'
    ),
    (
        'Produto 6',
        'Descrição do Produto 6',
        75.00,
        'Categoria A',
        'url6.jpg'
    ),
    (
        'Produto 7',
        'Descrição do Produto 7',
        120.00,
        'Categoria C',
        'url7.jpg'
    ),
    (
        'Produto 8',
        'Descrição do Produto 8',
        180.75,
        'Categoria B',
        'url8.jpg'
    ),
    (
        'Produto 9',
        'Descrição do Produto 9',
        250.00,
        'Categoria A',
        'url9.jpg'
    ),
    (
        'Produto 10',
        'Descrição do Produto 10',
        90.00,
        'Categoria C',
        'url10.jpg'
    );

INSERT INTO
    estoque (id_produto, quantidade, localizacao)
VALUES
    (1, 50, 'Armazém A'),
    (2, 30, 'Armazém B'),
    (3, 20, 'Armazém A'),
    (4, 15, 'Armazém C'),
    (5, 60, 'Armazém B'),
    (6, 40, 'Armazém A'),
    (7, 25, 'Armazém C'),
    (8, 35, 'Armazém B'),
    (9, 45, 'Armazém A'),
    (10, 55, 'Armazém C');

-- EXEMPLO 2
CREATE DATABASE pokedex;

USE pokedex;

CREATE TABLE pokemons (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL,
    imagem_url VARCHAR(255)
);

CREATE TABLE estoque (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pokemon_id INT,
    quantidade INT NOT NULL,
    localizacao VARCHAR(100),
    FOREIGN KEY (pokemon_id) REFERENCES pokemons(id) ON DELETE CASCADE
);

INSERT INTO
    pokemons (nome, tipo, descricao, preco, imagem_url)
VALUES
    (
        'Pikachu',
        'Elétrico',
        'Um Pokémon elétrico muito popular.',
        500.00,
        'pikachu.jpg'
    ),
    (
        'Charmander',
        'Fogo',
        'Um Pokémon de fogo que evolui para Charizard.',
        600.00,
        'charmander.jpg'
    ),
    (
        'Squirtle',
        'Água',
        'Um Pokémon aquático com uma carapaça resistente.',
        550.00,
        'squirtle.jpg'
    ),
    (
        'Bulbasaur',
        'Planta/Veneno',
        'Um Pokémon inicial muito equilibrado.',
        580.00,
        'bulbasaur.jpg'
    ),
    (
        'Eevee',
        'Normal',
        'Um Pokémon que pode evoluir para diversas formas.',
        620.00,
        'eevee.jpg'
    ),
    (
        'Jigglypuff',
        'Normal/Fada',
        'Um Pokémon que adormece seus oponentes com sua canção.',
        450.00,
        'jigglypuff.jpg'
    ),
    (
        'Gengar',
        'Fantasma/Veneno',
        'Um Pokémon assustador que adora pregar peças.',
        700.00,
        'gengar.jpg'
    ),
    (
        'Snorlax',
        'Normal',
        'Um Pokémon preguiçoso e muito forte.',
        750.00,
        'snorlax.jpg'
    ),
    (
        'Lucario',
        'Lutador/Aço',
        'Um Pokémon muito ágil e habilidoso em combate.',
        800.00,
        'lucario.jpg'
    ),
    (
        'Dragonite',
        'Dragão/Voador',
        'Um Pokémon raro e extremamente poderoso.',
        1000.00,
        'dragonite.jpg'
    );

INSERT INTO
    estoque (pokemon_id, quantidade, localizacao)
VALUES
    (1, 20, 'Centro Pokémon A'),
    (2, 15, 'Centro Pokémon B'),
    (3, 25, 'Centro Pokémon A'),
    (4, 10, 'Centro Pokémon C'),
    (5, 30, 'Centro Pokémon B'),
    (6, 18, 'Centro Pokémon A'),
    (7, 12, 'Centro Pokémon C'),
    (8, 14, 'Centro Pokémon B'),
    (9, 22, 'Centro Pokémon A'),
    (10, 8, 'Centro Pokémon C');


-- EXEMPLOS SQL
SELECT * FROM produtos;

SELECT nome, preco FROM produtos;

SELECT * FROM produtos WHERE preco > 3000;

UPDATE produtos SET preco = 3999.99, estoque = 8 WHERE nome = 'Notebook Gamer';

DELETE FROM produtos WHERE id = 2;

SELECT * FROM produtos ORDER BY preco DESC;

SELECT * FROM produtos LIMIT 5;

SELECT COUNT(*) FROM produtos;

SELECT categoria, COUNT(*) FROM produtos GROUP BY categoria;

CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    id_produto INT REFERENCES produtos(id_produto),
    quantidade INT NOT NULL,
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO pedidos (id_produto, quantidade) VALUES (1, 3)

SELECT produtos.nome, pedidos.quantidade, pedidos.data_pedido
FROM pedidos
JOIN produtos ON pedidos.id_produto = produtos.id_produto;


SELECT * FROM produtos
WHERE preco > (SELECT AVG(preco) FROM produtos);