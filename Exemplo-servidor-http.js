const PORT = 3000;
const HOSTNAME = 'localhost';

const http = require("http");

const server = http.createServer( (request, response) => {
    // Codigos: 200, 404, 500, 201...
    console.log("Requisicao recebida com sucesso!");
    response.statusCode = 200;
    response.end("Requisicao concluida com sucesso!");
});

server.listen(PORT, HOSTNAME, () => {
    console.log(`Servidor iniciado com sucesso, executando na porta ${PORT}`);
})
