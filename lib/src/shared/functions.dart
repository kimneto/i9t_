String pegaPrimeiroNomeEDeixaAPrimeiraLetraMaiuscula(String nomeCompleto) {
  List<String> nomes = nomeCompleto.split(' ');
  return nomes[0].substring(0, 1).toUpperCase() +
      nomes[0].substring(1).toLowerCase();
}

String formataCpf(String cpf) {
  return cpf.substring(0, 3) +
      '.' +
      cpf.substring(3, 6) +
      '.' +
      cpf.substring(6, 9) +
      '-' +
      cpf.substring(9);
}
