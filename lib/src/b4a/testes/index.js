const Parse = require("parse/node");
Parse.initialize(
   "0Gi3NSxdGbl32WhRCVTErJCjnXYYeTwH40AJjIXc",
   "2fs5i4XjsYqwYKui28YijUlFwjHf5GXs8LGBgbMk",
   "8dA8MVPa1QXvMNcX6O9x23BpGnYJuHSqeXkn39Tm"
);
Parse.serverURL = "https://parseapi.back4app.com/";

async function run() {
   //ATUALIZA TRAFEGO
   try {
      const Fct = Parse.Object.extend("Fct");
      const fct = await new Parse.Query(Fct).get("tQBIUlgrGV");



      const Trafego = Parse.Object.extend("Trafego")
      const trafego = new Trafego();
      const relation = fct.relation("trafegos");

      console.log(relation);


      trafego.set("hodometro", 777777);
      trafego.set("horaChegada", new Date());
      trafego.set("pontoParada", "Taubate");
      trafego.set("fct", fct);


      const resposta = await trafego.save(null, {
         useMasterKey: true,
      });
      console.log(resposta);

      relation.add(resposta);
      await fct.save(null, { useMasterKey: true });

      return {
         menssagem: "Trafego atualizado com sucesso",
         data: resposta,
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


}





run();


/*
async function run() {

   try {
      const Fct = Parse.Object.extend("Fct");
      const fct = new Fct();

      const Condutor = Parse.Object.extend("Condutor")
      const condutor = await new Parse.Query(Condutor).get(
         "a0GyF8r4dt"
      );

      const Veiculo = Parse.Object.extend("Veiculo")
      const veiculo = await new Parse.Query(Veiculo).get(
         "KfEd4TrcBw"
      );

      const Trafego = Parse.Object.extend("Trafego")
      const trafego = await new Parse.Query(Trafego).get("CXzaiJ1uS2");
      console.log(trafego);

      const data = new Date("10/24/2020 10:10:10");

      fct.set("trafegos", trafego.relation);
      fct.set("condutor", condutor);
      fct.set("veiculo", veiculo);
      fct.set("documento", "FAKE0001");
      fct.set("dataInicio", data);
      fct.set("hodometroInicial", "999999");

      const resposta = await fct.save(null, {
         useMasterKey: true,
      });
      console.log(resposta);

      return {
         menssagem: "Nova Fct criada com sucesso",
         data: {
            id: resposta.id,
         },
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


}
*/