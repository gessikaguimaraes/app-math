import 'package:app_math/app/shared/models/parametros.dart';
import 'package:flutter/material.dart';

class QuadradoDesafio extends StatefulWidget {
  final Parametros parametros;
  final num numero;
  final Color cor;
  final num resultadoOperacao;

  const QuadradoDesafio(
      {Key key, this.parametros, this.numero, this.cor, this.resultadoOperacao})
      : super(key: key);

  @override
  _QuadradoDesafioState createState() => _QuadradoDesafioState();
}

class _QuadradoDesafioState extends State<QuadradoDesafio> {
  @override
  Widget build(BuildContext context) {
    final Parametros args = ModalRoute.of(context).settings.arguments;

    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height / 5,
        child: GestureDetector(
          onTap: () {
            var resultado = args.resultado;
            if (widget.resultadoOperacao.toString() == "${widget.numero}") {
              resultado++;
            }
            if (args.quantidade != 9) {
              Navigator.pushNamed(
                context,
                "/operacao",
                arguments: Parametros(
                  opcoes: args.opcoes,
                  resultado: resultado,
                  quantidade: args.quantidade + 1,
                ),
              );
            } else {
              Navigator.pushNamed(
                context,
                "/resultado",
                arguments: Parametros(
                  opcoes: args.opcoes,
                  resultado: resultado,
                  quantidade: args.quantidade,
                ),
              );
            }
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: widget.cor,
              borderRadius: const BorderRadius.all(
                const Radius.circular(8),
              ),
            ),
            margin: const EdgeInsets.all(6),
            child: Text(
              "${widget.numero}",
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
          ),
        ),
      ),
    );
  }
}
