/* ############## FCT ############## */

const Condutor = Parse.Object.extend("Condutor");
const Veiculo = Parse.Object.extend("Veiculo");
const Fct = Parse.Object.extend("Fct");

Parse.Cloud.define("pega-numero-fcts-por-ano", async (req) => {
   try {
      const queryFct = new Parse.Query(Fct);
      const primeiroDiaDoAno = new Date(
         req.params.anoVigente + "-01-01T00:00:00.000Z"
      );
      const ultimoDiaDoAno = new Date(
         req.params.anoVigente + "-12-31T23:59:00.000Z"
      );
      await queryFct.lessThanOrEqualTo("dataInicio", ultimoDiaDoAno);
      await queryFct.greaterThanOrEqualTo("dataInicio", primeiroDiaDoAno);
      const alfa = await queryFct.find({ useMasterKey: true });
      var numeroDoc = 0;
      await alfa.map(function (p) {
         p = p.toJSON();
         numeroDoc = numeroDoc + 1;
         return {};
      });
      return {
         menssagem: "Número do próximo documento gerado",
         data: numeroDoc + 1,
         sucesso: true,
         erro: null,
      };
   } catch (e) {
      return {
         menssagem: "Erro ao gerar número documento.",
         data: [],
         sucesso: false,
         erro: e.message,
      };
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

   const alfa = await queryFct.find({ useMasterKey: true });

   return alfa.map(function (p) {
      p = p.toJSON();
      console.log(p);
      return {
         veiculoPlaca: p.veiculo.placa,
         veiculoGrupo: p.veiculo.grupo,
         veiculoTipo: p.veiculo.tipo,
         veiculoPatrimonio: p.veiculo.patrimonio,
      };
   });
});

Parse.Cloud.define("pega-fcts-concluidas-por-condutor", async (req) => {
   const queryFct = new Parse.Query(Fct);
   const condutor = new Condutor();

   try {
      condutor.id = req.params.condutorId;
      await queryFct.equalTo("concluido", true);
      await queryFct.equalTo("condutor", condutor);
      queryFct.include("veiculo");
      queryFct.include("trafego");

      const alfa = await queryFct.find({ useMasterKey: true });

      const retorno = alfa.map(function (p) {
         p = p.toJSON();
         return {
            id: p.objectId,
            documento: p.documento,
            dataInicio: p.dataInicio,
            veiculo: p.veiculo.placa,
         };
      });
      return {
         menssagem: "Fcts carregadas com sucesso",
         data: retorno,
         sucesso: true,
         erro: null,
      };
   } catch (e) {
      return {
         menssagem: "Erro ao carregar fcts.",
         data: [],
         sucesso: false,
         erro: e.message,
      };
   }
});

Parse.Cloud.define("cria-fct-aberto", async (req) => {
   const fct = new Fct();
   const condutor = await new Parse.Query("Condutor").get(
      req.params.condutorId
   );
   const veiculo = await new Parse.Query("Veiculo").get(req.params.veiculoId);

   const data = new Date(req.params.dataInicio);
   fct.set("condutor", condutor);
   fct.set("veiculo", veiculo);
   fct.set("documento", req.params.documento);
   fct.set("dataInicio", data);
   fct.set("hodometroInicial", req.params.hodometroInicial);

   try {
      const alfa = await fct.save(null, {
         useMasterKey: true,
      });

      return {
         menssagem: "Nova Fct criada com sucesso",
         data: {
            id: alfa.id,
         },
         sucesso: true,
         erro: null,
      };
   } catch (e) {
      return {
         menssagem: "Erro ao criar fct",
         data: [],
         sucesso: false,
         erro: e.message,
      };
   }
});

Parse.Cloud.define("pega-fct-com-trafego-incluso", async (req) => {
   const queryFct = new Parse.Query(Fct);
   const trafego = await new Parse.Query("Trafego").get(req.params.veiculoId);
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
            patrimonio: p.patrimonio,
         };
      });
      return {
         menssagem: "Lista de veículos carregada com sucesso",
         data: retorno,
         sucesso: true,
         erro: null,
      };
   } catch (e) {
      return {
         menssagem: "Erro ao listar veículos",
         data: [],
         sucesso: false,
         erro: e.message,
      };
   }
});
