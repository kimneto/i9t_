// CONDUTOR
const Condutor = Parse.Object.extend("Condutor");

//Criar
Parse.Cloud.define(
    "cria-condutor", async (request) => {
        try {
            const condutor = new Condutor();
            condutor.set("nome", request.params.nome);
            condutor.set("cpf", request.params.cpf);
            condutor.set("nivel", request.params.nivel);
            condutor.set("email", request.params.email);
            condutor.set("codUnidade", request.params.codUnidade);
            const condutorSalvo = await condutor.save(null, { useMasterKey: true });
            return { "message": "Condutor cadastrado com sucesso.", "data": condutorSalvo, "sucess": true, "error": null };
        }
        catch (e) {
            return { "message": "Algo deu errado!", "data": [], "sucess": false, "error": e };
        }
    }
)

//Ler
//Atualizar
//Deletar



//FCT
const Fct = Parse.Object.extend("Fct");
//TRAFEGO
const Trafego = Parse.Object.extend("Trafego");


//VEICULO
const Veiculo = Parse.Object.extend("Veiculo");

/*


Parse.Cloud.define(get-veiculos, ($)=>{

});
*/


Parse.Cloud.define("pega-veiculos", async (req) => {
    try {
        const queryVeiculos = new Parse.Query("Veiculo");
        const resultVeiculos = await queryVeiculos.find({ useMasterKey: true });
        const mapeado = resultVeiculos.map(function (p) {
            p = p.toJSON();
            return {
                id: p.objectId,
                nome: p.nome,
                placa: p.placa,
                statusVeiculo: p.statusVeiculo,
                grupo: p.grupo,
                tipo: p.tipo,
                patrimonio: p.patrimonio
            }
        });
        return {
            "message": "Lista de veículos carregada com sucesso.", "data": mapeado, "sucess": true, "error": null
        };
    } catch (e) {
        console.log(e);
        return {

            "message": "Algo deu errado!", "data": [], "sucess": false, "error": e
        };
    }
});



Parse.Cloud.define("pega-veiculos-por-status", async (req) => {

    const queryVeiculos = new Parse.Query("Veiculo");
    const resultVeiculos = await queryVeiculos.whereNotEqualTo('statusVeiculo', req.params.statusVeiculo).find({ useMasterKey: true });
    return resultVeiculos.map(function (p) {
        p = p.toJSON();
        return {
            id: p.objectId,
            nome: p.nome,
            placa: p.placa,
            statusVeiculo: p.statusVeiculo,
            grupo: p.grupo,
            tipo: p.tipo,
            patrimonio: p.patrimonio
        }
    });

});