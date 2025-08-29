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
    const retornoReq = {
        "mensagem": "Requisicao realizada com sucesso!",
        "clienteFilial": "Distribuidora de bebeidas"
    };
    response.json(retornoReq);
    //response.send("Requisicao realizada com sucesso!");
})

app.get('/produtos', (request, response) => {
    const produtos = [
        {id: 1, nome: "Macbook Air M1", preco: 5400},
        {id: 2, nome: "PC Gamer i9 24GB", preco: 25000},
        {id: 3, nome: "Mouse Gamer Red Dragon ", preco: 150}
    ];
    response.json(produtos);

})

// FIM - Gerenciamento de rotas

// INICIO - Inicializacao do servidor
app.listen(PORT, () => {
    console.log(`Servidor executando na porta ${PORT}`);
});
// FIM - Inicializacao do servidor
