const express = require('express');
const sql = require('mssql');
const app = express();

// Configuração do banco de dados
const config = {
    user: 'usuario',
    password: 'senha',
    server: 'localhost',
    database: 'BIBLIOTECA'
};

// inclusão  livros
app.post('/livros', async(req, res) => {
    try {
        const pool = await sql.connect(config);
        const result = await pool.request()
            .input('NOME ', sql.VarChar(100), req.body.nome)
            .input('AUTOR', sql.VarChar(100), req.body.autor)
            .input('ANO_PUBLICACAO', sql.Int, req.body.ano_puplicacao)
            .execute('sp_inserir_livros');
        res.send(result);
    } catch (err) {
        console.log(err);
        res.status(500).send(err);
    }
});

// alteração nos livros
app.put('/livros/:id', async(req, res) => {
    try {
        const pool = await sql.connect(config);
        const result = await pool.request()
            .input('id', sql.Int, req.params.id)
            .input('NOME', sql.VarChar(100), req.body.nome)
            .input('AUTOR', sql.VarChar(100), req.body.autor)
            .input('ANO_PUBLICACAO', sql.Int, req.body.ano_puplicacao)
            .execute('sp_alterar_livros');
        res.send(result);
    } catch (err) {
        console.log(err);
        res.status(500).send(err);
    }
});

// deletar livro
app.delete('/livros/:id', async(req, res) => {
    try {
        const pool = await sql.connect(config);
        const result = await pool.request()
            .input('id', sql.Int, req.params.id)
            .execute('sp_deletar_livros');
        res.send(result);
    } catch (err) {
        console.log(err);
        res.status(500).send(err);
    }
});