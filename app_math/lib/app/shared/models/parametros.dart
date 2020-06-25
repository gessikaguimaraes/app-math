class Parametros {
  String nome;
  List<String> opcoes;
  int resultado;
  int quantidade;

  Parametros({this.nome, this.opcoes, this.resultado, this.quantidade});

  @override
  String toString() {
    return 'Parametros{nome: $nome, quantidade: $quantidade, resultado: $resultado}';
  }

  Parametros.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    opcoes = json['opcoes'].cast<String>();
    resultado = json['resultado'];
    quantidade = json['quantidade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['opcoes'] = this.opcoes;
    data['resultado'] = this.resultado;
    data['quantidade'] = this.quantidade;
    return data;
  }
}
