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
    select month(data_cadastro) as mais_cadastro from usuario group by month(data_cadastro) order by count(month(data_cadastro)) desc limit 1;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function resultado_comum() {
    var instrucaoSql = `
    select fk_resultado, count(fk_resultado) as qtd_resultado from usuario group by fk_resultado order by qtd_resultado desc;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function cadastro_meses() {
    var instrucaoSql = `
    select count(*) as qtd_cadastros, month(data_cadastro) as mes from usuario group by month(data_cadastro) order by mes;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function qtd_resultado() {
    var instrucaoSql = `
select fk_resultado, count(fk_resultado) as qtd_resultado from usuario group by fk_resultado order by fk_resultado; `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
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