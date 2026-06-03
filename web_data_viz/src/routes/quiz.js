var express = require("express");
var router = express.Router();

var quizController = require("../controllers/quizController");

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.get("/buscar_resultado/:fk_personagem", function (req, res) {
    quizController.buscar_resultado(req, res);
})

router.get("/buscar_perguntas_respostas", function (req, res) {
    quizController.buscar_perguntas_respostas(req, res);
})

router.post("/atualizar_resultado/:id_user/:fk_personagem", function (req, res) { //
    quizController.atualizar_resultado(req, res); //
})

module.exports = router;

//.post - entrada/confirmaçao (botao_input)
//.get - puxar dados do banco de dados sem informar algo
//exibir informacoes que voce quer
//router.get com a url da pagina
