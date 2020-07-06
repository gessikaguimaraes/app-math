import 'package:app_math/app/shared/models/parametros.dart';
import 'package:flutter/material.dart';

class ButtonFloating extends StatefulWidget {
  ButtonFloating({Key key, this.route, this.parametros}) : super(key: key);
  final String route;
  final Parametros parametros;

  @override
  _ButtonFloatingState createState() => _ButtonFloatingState();
}

class _ButtonFloatingState extends State<ButtonFloating> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => {
        /* if (widget.parametros.nome.isEmpty)
          {
            Scaffold.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text("Informe a seu nome"),
                ),
              ),
          }
        else  */
        if (widget.route == "/operacao" && widget.parametros.opcoes.length == 0)
          {
            Scaffold.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text("Informe a opção"),
                ),
              ),
          }
        else
          {
            print(widget.parametros.nome),
            Navigator.pushNamed(
              context,
              widget.route,
              arguments: Parametros(
                nome: widget.parametros.nome,
                opcoes: widget.parametros.opcoes,
                resultado: widget.parametros.resultado,
                quantidade: widget.parametros.quantidade,
              ),
            ),
          }
      },
      label: Text('Próximo'),
      icon: Icon(Icons.forward),
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      elevation: 6,
    );
  }
}
