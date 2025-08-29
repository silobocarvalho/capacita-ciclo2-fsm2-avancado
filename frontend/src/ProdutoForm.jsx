import React, { useState, useEffect } from 'react';

const ProdutoForm = ({ onSave, produtoToEdit }) => {
  const [nome, setNome] = useState('');
  const [preco, setPreco] = useState('');
  const [estoque, setEstoque] = useState('');
  const [categoriaId, setCategoriaId] = useState('');
  

  useEffect(() => {
    if (produtoToEdit) {
      //setNome(produtoToEdit.nome);
      //setMatricula(produtoToEdit.matricula);
      //setTurma(produtoToEdit.turma);
    }
  }, [produtoToEdit]);

  const handleSubmit = (e) => {
    e.preventDefault();
    onSave({ nome, preco, estoque, categoriaId });
    setNome('');
    setPreco('');
    setEstoque('');
    setCategoriaId('')
  };

  return (
    <form onSubmit={handleSubmit}>
      <input
        type="text"
        placeholder="Nome"
        value={nome}
        onChange={(e) => setNome(e.target.value)}
        required
      />
    <input
        type="text"
        placeholder="Preco"
        value={preco}
        onChange={(e) => setPreco(e.target.value)}
        required
      />
      <input
        type="number"
        placeholder="Estoque"
        value={estoque}
        onChange={(e) => setEstoque(e.target.value)}
        required
      />
        <input
        type="text"
        placeholder="CategoriId"
        value={categoriaId}
        onChange={(e) => setCategoriaId(e.target.value)}
        required
      />

      <button type="submit">{produtoToEdit ? 'Atualizar' : 'Adicionar'}</button>
    </form>
  );
};

export default ProdutoForm;