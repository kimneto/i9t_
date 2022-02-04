/* ############ TRAFEGO ############ */

const Trafego = Parse.Object.extend("Trafego");

<<<<<<< HEAD
Parse.Cloud.define("cria-trafego", async (req) => {
   const trafego = new Trafego();
   const fct = await new Parse.Query("Fct").get(req.params.fctId);

   trafego.set("hodometro", req.params.hodometro);
   trafego.set("horaChegada", req.params.horaChegada);
   trafego.set("pontoParada", req.params.pontoParada);
   trafego.set("fct", fct);

   try {
      const alfa = await trafego.save(null, { useMasterKey: true });
      return {
         menssagem: "Novo trafego criado com sucesso",
         data: {
            id: alfa.id,
         },
         sucesso: true,
         erro: null,
      };
   } catch (e) {
      return {
         menssagem: "Erro ao criar Trafego",
         data: [],
         sucesso: false,
         erro: e.message,
      };
   }
});

Parse.Cloud.define("deleta-trafego", async (req) => {
   const trafego = await new Parse.Query("Trafego").get(req.params.trafegoId);
   try {
      const alfa = await trafego.destroy(null, { useMasterKey: true });
      return {
         menssagem: "Trafego deletado com sucesso",
         data: {
            id: alfa.id,
         },
         sucesso: true,
         erro: null,
      };
   } catch (e) {
      return {
         menssagem: "Erro ao deletar Trafego",
         data: [],
         sucesso: false,
         erro: e.message,
      };
   }
=======


Parse.Cloud.define("cria-trafego", async (req) => {

});


Parse.Cloud.define("deleta-trafego", async (req) => {

>>>>>>> 4d212b3dcde35f6ea825790cc37d6aa477c1fe4f
});
