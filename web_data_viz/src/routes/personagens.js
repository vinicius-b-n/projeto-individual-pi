var express = require("express");
var router = express.Router();

var personagensController = require("../controllers/personagensController");

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.get("/exibir_personagens", function (req, res) {
    personagensController.exibir_personagens(req, res);
})


module.exports = router;

//.post - entrada/confirmaçao (botao_input)
//.get - puxar dados do banco de dados sem informar algo
//exibir informacoes que voce quer
//router.get com a url da pagina
