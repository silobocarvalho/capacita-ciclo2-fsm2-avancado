import './App.css'
import axios from 'axios'
import { getProdutos, criarProduto, atualizarProduto, deletarProduto } from './api'
import { useEffect, useState } from 'react'
import ProdutoForm from './ProdutoForm';

function App() {
  
  /*
  const API_URL = "http://localhost:3000"
  //EXEMPLO DE USO DO FETCH
  async function getDataFetch(){
      const requisicaoFetch = await fetch(`${API_URL}/produtos`)
      const dadosRetornado = await requisicaoFetch.json()
      console.log(dadosRetornado)
  }
  //getDataFetch();

  //EXEMPLO DE USO DO AXIOS
  async function getDataAxios(){
    const requisicaoAxios = await axios.get(`${API_URL}/produtos`);
    const dadosRetornado = requisicaoAxios.data;
    console.log(dadosRetornado);
  }
  //getDataAxios();
  */

   const [produtos, setProdutos] = useState([]);
   const [produtoToEdit, setProdutoToEdit] = useState(null);

  useEffect(() => {
    carregarProdutos();
  }, []);


    const carregarProdutos = async () => {
    try {
      const data = await getProdutos();
      setProdutos(data);
    } catch (error) {
      console.error('Erro ao buscar produtos:', error);
    }
  };

    const handleSave = async (produto) => {
    try {
      if (produtoToEdit) {
        //await atualizarAluno(alunoToEdit.id, aluno);
        //setAlunoToEdit(null);
      } else {
        await criarProduto(produto);
      }
      carregarProdutos();
    } catch (error) {
      console.error('Erro ao salvar produto:', error);
    }
  };
  
  return(
    <div>
    <h1>Gerenciamento de Produtos</h1>
     
     <ProdutoForm onSave={handleSave} produtoToEdit={produtoToEdit} />

     <h2>Listagem de Produtos</h2>
     {
        produtos.map( (produto) => {
          return <p>{produto.nome} - {produto.preco} - Estoque: {produto.estoque} - Categoria: {produto.categoriaId}</p> 
        } )
     }
    </div>
  )
}

export default App
