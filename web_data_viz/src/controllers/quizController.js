var quizModel = require("../models/quizModel");


function buscar_resultado(req, res) {
    quizModel.buscar_resultado()
    .then((resultado) => {
        res.json(resultado)
    }).catch((erro) => {
        console.error
        ('erro ao buscar quiz resultado', erro)
        res.status(500).json({erro: erro.sqlMessage})})
}

function buscar_perguntas_respostas(req, res) {
    quizModel.buscar_perguntas_respostas()
    .then((resultado) => {
        res.json(resultado)
    }).catch((erro) => {
        console.error
        ('erro ao buscar quiz perguntas ou respostas', erro)
        res.status(500).json({erro: erro.sqlMessage})})
}

function atualizar_resultado(req, res) { //
    var id_user = req.params.id_user
    var fk_personagem = req.params.fk_personagem
    quizModel.atualizar_resultado(id_user, fk_personagem)
    .then((resultado) => {
        res.json(resultado)
    }).catch((erro) => {
        console.error
        ('erro ao salvar personagens', erro)
        res.status(500).json({erro: erro.sqlMessage})}) //
}

module.exports = {
    buscar_resultado,
    buscar_perguntas_respostas,
    atualizar_resultado
}