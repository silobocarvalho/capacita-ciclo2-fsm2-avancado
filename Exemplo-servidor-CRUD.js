// INICIO - Configuracao Inicial
const express = require('express');
const cors = require('cors');

const app = express();

const PORT = 3000;

app.use(express.json());
app.use(cors());
// FIM - Configuracao Inicial

// INICIO - Gerenciamento de rotas
app.get('/', (request, response) => {
    response.send("Servidor está executando!");
})

app.get('/produtos', (request, response) => {
    const produtos = [
        {id: 1, nome: "Macbook Air M1", preco: 5400},
        {id: 2, nome: "PC Gamer i9 24GB", preco: 25000},
        {id: 3, nome: "Mouse Gamer Red Dragon ", preco: 150}
    ];
    response.json(produtos);
})

app.post('/produtos', (request, response) => {
    const{nome, quantidade, preco} = request.body;
    console.log(`Nome: ${nome}; Quantidade: ${quantidade}; Preco: ${preco}`);

    const novoProduto = {
        nome: nome,
        quantidade: quantidade,
        preco : preco
    }
    //Aqui temos metodos para adicionar no banco de dados ...
    response.status(201).json(novoProduto);
})

app.put('/produtos/:id', (request, response) => {
    const{id} = request.params;
    console.log("Produto a ser alterado possui o ID: " + id);

    const{nome, quantidade, preco} = request.body;
    console.log(`Nome: ${nome}; Quantidade: ${quantidade}; Preco: ${preco}`);

    const produtoEditado = {
        nome: nome,
        quantidade: quantidade,
        preco : preco
    }

    //Metodos para alterar o produto no banco de dados...

    response.status(200).json(produtoEditado);
});

app.delete('/produtos/:id', (request, response) => {
    const{id} = request.params;
    console.log("Produto a ser alterado possui o ID: " + id);

    // buscar produto no banco de dados pelo ID...
    // deletar o produto do banco...

    response.status(200).send("Produto removido com sucesso!");
})

// FIM - Gerenciamento de rotas

// INICIO - Inicializacao do servidor
app.listen(PORT, () => {
    console.log(`Servidor executando na porta ${PORT}`);
});
// FIM - Inicializacao do servidor
