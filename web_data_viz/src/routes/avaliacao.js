var express = require("express");
var router = express.Router();

var avaliacaoController = require("../controllers/avaliacaoController");

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.post("/cadastrar_nota", function (req, res) {
    avaliacaoController.cadastrar_nota(req, res);
})


module.exports = router;