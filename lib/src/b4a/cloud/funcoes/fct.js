/* ############## FCT ############## */

Parse.Cloud.define("pega-numero-documento-por-ano", async (req) => {
   try {
      const queryFct = new Parse.Query("Fct");
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
         data: {},
         sucesso: false,
         erro: e.message,
      };
   }
});

Parse.Cloud.define("pega-fcts-por-condutor-zero", async (req) => {
   /* const queryFct = new Parse.Query("Fct");
   const condutor = new Parse.Query("Condutor");
   condutor.id = req.params.condutorId;
   await queryFct.equalTo("concluido", req.params.estaConcluido);
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
*/
});

Parse.Cloud.define("pega-fcts-por-condutor", async (req) => {
   const queryFct = new Parse.Query("Fct");
   const condutorQuery = new Parse.Query("Condutor");
   const condutor = await condutorQuery.get(req.params.condutorId);
   let listaFcts = [];
   try {
      queryFct.equalTo("concluido", req.params.estaConcluido);
      queryFct.equalTo("condutor", condutor);
      queryFct.include("veiculo");
      queryFct.include("condutor");

      await queryFct
         .findAll({ useMasterKey: true })
         .then(async function (fcts) {
            for (let i = 0; i < fcts.length; i++) {
               let fct = fcts[i].toJSON();
               return await fcts[i]
                  .relation("trafegos")
                  .query()
                  .find({ useMasterKey: true })
                  .then(async function (trafegos) {
                     return {
                        id: fct.objectId,
                        condutor: {
                           id: fct.condutor.objectId,
                           nome: fct.condutor.nome,
                           nivel: fct.condutor.nivel,
                           cpf: fct.condutor.cpf,
                           email: fct.condutor.email,
                           codUnidade: fct.condutor.codUnidade,
                        },
                        concluido: fct.concluido,
                        documento: fct.documento,
                        veiculo: {
                           id: fct.veiculo.id,
                           placa: fct.veiculo.placa,
                           patrimonio: fct.veiculo.patrimonio,
                           grupo: fct.veiculo.grupo,
                           tipo: fct.veiculo.tipo,
                           statusVeiculo: fct.veiculo.statusVeiculo,
                           ultimoHodometro: fct.veiculo.ultimoHodometro,
                        },
                        novidadesVerificadas: fct.novidadesVerificadas,
                        defeitosVerificados: fct.defeitosVerificados,
                        trafegos: trafegos.map((trafego) => {
                           trafego = trafego.toJSON();
                           return {
                              id: trafego.objectId,
                              horaChegada: trafego.horaChegada,
                              horaPartida: trafego.horaPartida,
                              hodometro: trafego.hodometro,
                              pontoParada: trafego.pontoParada,
                           };
                        }),
                     };
                  });
            }
         })
         .then(function (res) {
            listaFcts.push(res);
         });

      return {
         menssagem: "Fcts carregadas com sucesso",
         data: listaFcts ?? {},
         sucesso: true,
         erro: null,
      };
   } catch (e) {
      return {
         menssagem: "Erro ao carregar fcts.",
         data: {},
         sucesso: false,
         erro: e.message,
      };
   }
});

Parse.Cloud.define("cria-fct-aberto", async (req) => {
   const fct = new Parse.Query("Fct");
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
      const resposta = await fct.save(null, {
         useMasterKey: true,
      });

      return {
         menssagem: "Nova Fct criada com sucesso",
         data: {
            id: resposta.id,
         },
         sucesso: true,
         erro: null,
      };
   } catch (e) {
      return {
         menssagem: "Erro ao criar fct",
         data: {},
         sucesso: false,
         erro: e.message,
      };
   }
});
