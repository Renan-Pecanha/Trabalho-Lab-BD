const express = require('express');
const sql = require('sql');
const app = express();

// Configuração do banco de dados
const config = {
    user: 'usuario',
    password: 'senha',
    server: 'localhost',
    database: 'BIBLIOTECA'
};

// inclusão  clientes
app.post('/clientes', async(req, res) => {
    try {
        const pool = await sql.connect(config);
        const result = await pool.request()
            .input('NOME ', sql.VarChar(100), req.body.nome)
            .input('EMAIL', sql.VarChar(100), req.body.email)
            .input('TELEFONE', sql.Int, req.body.telefeone)
            .input('ENDERECO', sql.Int, req.body.endereco)
            .input('ID_LIVRO', sql.Int, req.body.id_livro)
            .input('DATA_CADASDTRO', sql.Int, req.body.data_cadastro)
            .execute('sp_inserir_clientes');
        res.send(result);
    } catch (err) {
        console.log(err);
        res.status(500).send(err);
    }
});

// alteração clientes
app.put('/livros/:id', async(req, res) => {
    try {
        const pool = await sql.connect(config);
        const result = await pool.request()
            .input('NOME ', sql.VarChar(100), req.body.nome)
            .input('EMAIL', sql.VarChar(100), req.body.email)
            .input('TELEFONE', sql.Int, req.body.telefeone)
            .input('ENDERECO', sql.VarChar(200), req.body.endereco)
            .input('ID_LIVRO', sql.Int, req.body.id_livro)
            .input('DATA_CADASDTRO', sql.Int, req.body.data_cadastro)
            .execute('sp_alterar_clientes');
        res.send(result);
    } catch (err) {
        console.log(err);
        res.status(500).send(err);
    }
});

// deletar cadastro de cliente 
app.delete('/livros/:id', async(req, res) => {
    try {
        const pool = await sql.connect(config);
        const result = await pool.request()
            .input('id', sql.Int, req.params.id)
            .execute('sp_deletar_clientes');
        res.send(result);
    } catch (err) {
        console.log(err);
        res.status(500).send(err);
    }
});