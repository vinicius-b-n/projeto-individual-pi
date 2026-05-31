var database = require("../database/config");

function nota_media() {
  var instrucaoSql = `
    select round(AVG(nota), 1) as nota from avaliacao;
    `;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function qtd_cadastro() {
    var instrucaoSql = `
    select count(id_usuario) as qtd_usuarios from usuario;
    `;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function qtd_avaliacao() {
var instrucaoSql = `
    select count(id_avaliacao) as qtd_avaliacoes from avaliacao;
    `;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function mais_cadastro() {
var instrucaoSql = `
    select month(data_cadastro) from usuario group by month(data_cadastro) order by count(month(data_cadastro)) desc limit 1;
    `;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}
