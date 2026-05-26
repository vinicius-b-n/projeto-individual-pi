var personagensModel = require("../models/personagensModel");


function exibir_personagens(req, res) {
    personagensModel.exibir_personagens()
    .then((resultado) => {
        res.json(resultado)
    }).catch((erro) => {
        console.error
        ('erro ao exibir personagens', erro)
        res.status(500).json({erro: erro.sqlMessage})})
}

module.exports = {
    exibir_personagens
}