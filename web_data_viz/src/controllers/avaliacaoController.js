var avaliacaoModel = require("../models/avaliacaoModel");



function cadastrar_nota(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var nota = req.body.notaServer;
    var fk_usuario = req.body.fk_usuarioServer

    // Faça as validações dos valores
    if (nota_final == undefined) {
        res.status(400).send("Sua nota está undefined!");

    } else {

        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        avaliacaoModel.cadastrar_nota(nota, fk_usuario)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro da sua nota! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

module.exports = {
    cadastrar_nota
}