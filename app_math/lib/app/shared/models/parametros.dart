class Parametros {
  final String nome;
  final List<String> opcoes;
  final int resultado;
  final int quantidade;

  Parametros(this.nome, this.opcoes, this.resultado, this.quantidade);

  @override
  String toString() {
    return 'Parametros{nome: $nome, quantidade: $quantidade, resultado: $resultado}';
  }
}
