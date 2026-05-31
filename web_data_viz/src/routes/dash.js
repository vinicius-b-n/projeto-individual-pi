var express = require("express");
var router = express.Router();

var dashController = require("../controllers/dashController");

router.get("/buscar_resultado", function (req, res) {
    quizController.buscar_resultado(req, res);
})