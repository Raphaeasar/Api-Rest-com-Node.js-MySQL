const express = require('express');
const router = express.Router();
const mysql = require('../mysql').pool;
const login = require('../middleware/login');

//Retorna todos os usuarios
router.get('/', (req, res, next) => {
    mysql.getConnection((error, conn) => {
        if (error) { return res.status(500).send({ error: error }) }
        conn.query(
            'SELECT * FROM usuario;',
            (error, result, fields) => {
                if (error) { return res.status(500).send({ error: error }) }
                const response = {
                    quantidade: result.legth,
                    usuarios: result.map(usuario => {
                        return {
                            id: usuario.id,
                            email: usuario.email,
                            senha: usuario.senha,
                            descricao: usuario.descricao,
                            prazo: usuario.prazo,
                            request: {
                                tipo: 'GET',
                                comentario: 'Retorna todos os usuarios',
                                url: 'http://localhost:3000/usuarios/' + usuario.id
                            }
                        }
                    })
                }
                return res.status(200).send({ response: result })
            }
        )
    })
});

//Insere um usuario
router.post('/', login, (req, res, next) => {
    console.log(req.usuario)
    mysql.getConnection((error, conn) => {
        if (error) { return res.status(500).send({ error: error }) }
        conn.query(
            'INSERT INTO usuario (id, email, senha, descricao, prazo) VALUES (?,?,?,?,?)',
            [
                req.body.id,
                req.body.email,
                req.body.senha,
                req.body.descricao,
                req.body.prazo,
            ],
            (error, result, field) => {
                if (error) { return res.status(500).send({ error: error }) }
                const response = {
                    mensagem: 'Usuario cadastrado com sucesso',
                    usuarioCriado: {
                        id: result.id,
                        email: req.body.email,
                        senha: req.body.senha,
                        descricao: req.body.descricao,
                        prazo: req.body.prazo,
                        request: {
                            tipo: 'POST',
                            comentario: 'Insere um usuario',
                            url: 'http://localhost:3000/usuarios/'
                        }
                    }
                }
                res.status(201).send(response);
            }
        )
    })

});

// Retorna dados de um usuario
router.get('/:id', (req, res, next) => {
    mysql.getConnection((error, conn) => {
        if (error) { return res.status(500).send({ error: error }) }
        conn.query(
            'SELECT * FROM usuario WHERE id = ?;',
            [req.params.id],
            (error, result, fields) => {
                if (error) { return res.status(500).send({ error: error }) }

                if (result.legth == 0) {
                    return res.status(404).send({
                        mensagem: 'Não foi encontrado com este ID'
                    })
                }
                const response = {
                    usuario: {
                        id: result[0].id,
                        email: result[0].email,
                        senha: result[0].senha,
                        descricao: result[0].descricao,
                        prazo: result[0].prazo,
                        request: {
                            tipo: 'POST',
                            comentario: 'Insere um usuario',
                            url: 'http://localhost:3000/usuarios/'
                        }
                    }
                }
                return res.status(200).send({ response: result })
            }
        )
    })

});

// Alterar usuario
router.patch('/', (req, res, next) => {
    mysql.getConnection((error, conn) => {
        if (error) { return res.status(500).send({ error: error }) }
        conn.query(
            `UPDATE usuario
                SET email = ?,
                    senha = ?,
                    descricao = ?,
                    prazo = ?
                WHERE id = ?`,
            [
                req.body.email,
                req.body.senha,
                req.body.descricao,
                req.body.prazo,
                req.body.id
            ],
            (error, result, field) => {
                conn.release();
                if (error) { return res.status(500).send({ error: error }) }
                res.status(201).send({
                    mensagem: 'Usuario alterado com sucesso',
                    id: result.insertId
                });
            }
        )
    })
});

// Excluir usuario
router.delete('/', (req, res, next) => {
    mysql.getConnection((error, conn) => {
        if (error) { return res.status(500).send({ error: error }) }
        conn.query(
            'DELETE FROM usuario WHERE id = ?', [req.body.id],
            (error, result, field) => {
                conn.release();
                if (error) { return res.status(500).send({ error: error }) }
                res.status(201).send({
                    mensagem: 'Usuario excluído com sucesso',
                    id: result.insertId
                });
            }
        )
    })
});

module.exports = router;