String pegaPrimeiroNomeEDeixaAPrimeiraLetraMaiuscula(String nomeCompleto) {
  List<String> nomes = nomeCompleto.split(' ');
  return nomes[0].substring(0, 1).toUpperCase() +
      nomes[0].substring(1).toLowerCase();
}
