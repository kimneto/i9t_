/* ############ TRAFEGO ############ */

Parse.Cloud.define("pega-trafegos", async (req) => {
   const queryTrafego = new Parse.Query("Trafego");

   queryTrafego.include("fct");
   queryTrafego.include("veiculo");

   try {
      const resultTrafegos = await queryTrafego.find({ useMasterKey: true });

      return {
         mensagem: "Lista de trafegos carregada com sucesso",
         data: resultTrafegos,
         sucesso: true,
         erro: null,
      };
   } catch (e) {
      return {
         mensagem: "Erro ao listar trafegos",
         data: {},
         sucesso: false,
         erro: e.message,
      };
   }
});

Parse.Cloud.define("cria-trafego", async (req) => {
   const Trafego = Parse.Object.extend("Trafego");
   const trafego = new Trafego();

   const fct = await new Parse.Query("Fct").get(req.params.fctId);
   const relation = fct.relation("trafegos");

   try {
      trafego.set("hodometro", req.params.hodometro);

      trafego.set("horaChegada", new Date(Date.parse(req.params.horaChegada)));

      trafego.set("pontoParada", req.params.pontoParada);

      trafego.set("fct", fct);

      const resposta = await trafego.save(null, { useMasterKey: true });
      relation.add(resposta);
      await fct.save(null, { useMasterKey: true });

      return {
         mensagem: "Novo trafego criado com sucesso",
         data: {
            id: resposta.id,
         },
         sucesso: true,
         erro: null,
      };
   } catch (e) {
      return {
         mensagem: "Erro ao criar Trafego",
         data: {},
         sucesso: false,
         erro: e.message,
      };
   }
});

Parse.Cloud.define("deleta-trafego", async (req) => {
   const trafego = await new Parse.Query("Trafego").get(req.params.trafegoId);
   try {
      const resposta = await trafego.destroy(null, { useMasterKey: true });
      return {
         mensagem: "Trafego deletado com sucesso",
         data: {
            id: alfa.id,
         },
         sucesso: true,
         erro: null,
      };
   } catch (e) {
      return {
         mensagem: "Erro ao deletar Trafego",
         data: {},
         sucesso: false,
         erro: e.message,
      };
   }
});

Parse.Cloud.define("conclui-trafego", async (req) => {
   const Trafego = Parse.Object.extend("Trafego");
   const trafego = new Trafego();
   /*
   const fct = await new Parse.Query("Fct").get(req.params.fctId);

   try {
      trafego.set("hodometro", req.params.hodometro);

      trafego.set("horaChegada", new Date(Date.parse(req.params.horaChegada)));

      trafego.set("pontoParada", req.params.pontoParada);

      trafego.set("fct", fct);

      const resposta = await trafego.save(null, { useMasterKey: true });

      return {
         mensagem: "Novo trafego criado com sucesso",
         data: {
            id: resposta.id,
         },
         sucesso: true,
         erro: null,
      };
   } catch (e) {
      return {
         mensagem: "Erro ao criar Trafego",
         data: {},
         sucesso: false,
         erro: e.message,
      };
   }*/
});

Parse.Cloud.define("atualiza-trafego-partida", async (req) => {
   const Fct = Parse.Object.extend("Fct");
   const fct = await new Parse.Query(Fct).get(req.params.fctId);

   const Trafego = Parse.Object.extend("Trafego");
   const trafego = await new Parse.Query(Trafego).get(req.params.trafegoId);

   try {
      trafego.set("concluido", true);
      trafego.set("horaPartida", new Date(req.params.horaPartida));
      trafego.set("fct", fct);

      const resposta = await trafego.save(null, {
         useMasterKey: true,
      });
      console.log(resposta);

      return {
         menssagem: "Trafego atualizado com sucesso",
         data: resposta.id,
         sucesso: true,
         erro: null,
      };
   } catch (e) {
      console.log(e);
      return {
         menssagem: "Erro ao criar fct",
         data: {},
         sucesso: false,
         erro: e.message,
      };
   }
});
