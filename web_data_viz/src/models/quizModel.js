var database = require("../database/config")

function buscar_resultado() {
    // console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", email, senha)
    var instrucaoSql = `
    select id_resultado, titulo, descricao, fk_personagens, url_imagem from resultado;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscar_perguntas_respostas() {
var instrucaoSql = `
    select p.id_pergunta as id_pergunta, p.pergunta as pergunta, a.id_alternativas as id_alternativa, a.alternativa as alternativa from perguntas p
    join alternativas a on fk_perguntas = id_pergunta;
`;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function atualizar_resultado(id_user,fk_personagem) { //
    var instrucaoSql =`
    update usuario set fk_resultado = ? where id_usuario = ?;
`;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql, [fk_personagem, id_user]); //
    }

module.exports = {
    buscar_resultado,
    buscar_perguntas_respostas,
    atualizar_resultado
};
