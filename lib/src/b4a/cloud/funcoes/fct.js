/* ############## FCT ############## */

const Condutor = Parse.Object.extend("Condutor");
const Fct = Parse.Object.extend("Fct");

Parse.Cloud.define("pega-numero-fcts-por-ano", async (req) => {
    const queryFct = new Parse.Query(Fct);
    try {
        const date = new Date(req.params.dataInicio);
        ;
        queryFct.equalTo("dataInicio", date);
        const alfa = queryFct.find({ useMasterKey: true })
        console.log(alfa)

    } catch (e) {
        return e.message;
    }
});



Parse.Cloud.define("pega-fcts-nao-concluidas-por-condutor", async (req) => {
    const queryFct = new Parse.Query(Fct);
    const condutor = new Condutor();
    condutor.id = req.params.condutorId;
    await queryFct.equalTo("concluido", false);
    await queryFct.equalTo("condutor", condutor);
    queryFct.include("veiculo");
    queryFct.include("trafego");

    const alfa = await queryFct.find({ useMasterKey: true })

    return alfa.map(function (p) {
        p = p.toJSON();
        console.log(p);
        return {
            veiculoPlaca: p.veiculo.placa,
            veiculoGrupo: p.veiculo.grupo,
            veiculoTipo: p.veiculo.tipo,
            veiculoPatrimonio: p.veiculo.patrimonio,
            trafego: { pontoParada: p.trafego.pontoParada },
        }

    });
});



Parse.Cloud.define("pega-fcts-concluidas-por-condutor", async (req) => {

});



Parse.Cloud.define("cria-fct-aberto", async (req) => {

});





Parse.Cloud.define("pega-fct-com-trafego-incluso", async (req) => {
    const queryFct = new Parse.Query(Fct);
    try {
        const resultFct = await queryFct.find({ useMasterKey: true });
        const retorno = resultFct.map(function (p) {
            p = p.toJSON();
            return {
                id: p.objectId,
                nome: p.nome,
                placa: p.placa,
                statusVeiculo: p.statusVeiculo,
                grupo: p.grupo,
                tipo: p.tipo,
                patrimonio: p.patrimonio
            };
        });
        return { menssagem: "Lista de veículos carregada com sucesso", data: retorno, sucesso: true, erro: null };
    } catch (e) {
        return { menssagem: "Erro ao listar veículos", data: [], sucesso: false, erro: e.message };
    }
});