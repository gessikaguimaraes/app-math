class Parametros {
  List<String> opcoes;
  int resultado;
  int quantidade;

  Parametros({this.opcoes, this.resultado, this.quantidade});

  @override
  String toString() {
    return 'Parametros{quantidade: $quantidade, resultado: $resultado}';
  }

  Parametros.fromJson(Map<String, dynamic> json) {
    opcoes = json['opcoes'].cast<String>();
    resultado = json['resultado'];
    quantidade = json['quantidade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['opcoes'] = this.opcoes;
    data['resultado'] = this.resultado;
    data['quantidade'] = this.quantidade;
    return data;
  }
}
