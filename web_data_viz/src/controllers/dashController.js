var dashModel = require("../models/dashModel");

function nota_media(req, res) {
    dashModel.nota_media()
    .then((resultado) => {
        res.json(resultado)
    }).catch((erro) => {
        console.error
        ('erro ao buscar nota media', erro)
        res.status(500).json({erro: erro.sqlMessage})})
}

function qtd_cadastro(req, res) {
    dashModel.qtd_cadastro()
    .then((resultado) => {
        res.json(resultado)
    }).catch((erro) => {
        console.error
        ('erro ao buscar quantidade de cadastro', erro)
        res.status(500).json({erro: erro.sqlMessage})})
}

function qtd_avaliacao(req, res) {
    dashModel.qtd_avaliacao()
    .then((resultado) => {
        res.json(resultado)
    }).catch((erro) => {
        console.error
        ('erro ao buscar quantidade de avaliacoes', erro)
        res.status(500).json({erro: erro.sqlMessage})})
}

function mais_cadastro(req, res) {
    dashModel.mais_cadastro()
    .then((resultado) => {
        res.json(resultado)
    }).catch((erro) => {
        console.error
        ('erro ao buscar periodo com mais cadastros', erro)
        res.status(500).json({erro: erro.sqlMessage})})
}

function resultado_comum(req, res) {
    dashModel.resultado_comum()
    .then((resultado) => {
        res.json(resultado)
    }).catch((erro) => {
        console.error
        ('erro ao buscar resultados comuns', erro)
        res.status(500).json({erro: erro.sqlMessage})})
}

function cadastro_meses(req, res) {
    dashModel.cadastro_meses()
    .then((resultado) => {
        res.json(resultado)
    }).catch((erro) => {
        console.error
        ('erro ao buscar cadastro durante meses', erro)
        res.status(500).json({erro: erro.sqlMessage})})
}

function qtd_resultado(req, res) {
    dashModel.qtd_resultado()
    .then((resultado) => {
        res.json(resultado)
    }).catch((erro) => {
        console.error
        ('erro ao buscar quantidade de cadastros', erro)
        res.status(500).json({erro: erro.sqlMessage})})
}

module.exports = {
    nota_media,
    qtd_cadastro,
    qtd_avaliacao,
    mais_cadastro,
    resultado_comum,
    cadastro_meses,
    qtd_resultado
}