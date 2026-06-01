var express = require("express");
var router = express.Router();

var dashController = require("../controllers/dashController");

router.get("/nota_media", function (req, res) {
    dashController.nota_media(req, res);
})

router.get("/qtd_cadastro", function (req, res) {
    dashController.qtd_cadastro(req, res);
})

router.get("/qtd_avaliacao", function (req, res) {
    dashController.qtd_avaliacao(req, res);
})

router.get("/mais_cadastro", function (req, res) {
    dashController.mais_cadastro(req, res);
})

router.get("/resultado_comum", function (req, res) {
    dashController.resultado_comum(req, res);
})

router.get("/cadastro_meses", function (req, res) {
    dashController.cadastro_meses(req, res);
})

router.get("/qtd_resultado", function (req, res) {
    dashController.qtd_resultado(req, res);
})

module.exports = router;


