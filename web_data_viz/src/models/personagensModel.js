var database = require("../database/config")

function exibir_personagens() {
    // console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", email, senha)
    var instrucaoSql = `
select personagens.nome as personagem, personagens.descricao, personagens.url_imagem, racas.nome as raca from personagens
inner join racas on personagens.fk_racas = racas.id_racas;
 `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    exibir_personagens
};
