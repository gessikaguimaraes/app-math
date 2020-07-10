import 'package:app_math/app/shared/const/color_const.dart';
import 'package:app_math/app/shared/models/parametros.dart';
import 'package:flutter/material.dart';

class ButtonFloating extends StatefulWidget {
  ButtonFloating({Key key, this.route, this.parametros, this.cor})
      : super(key: key);
  final String route;
  final Parametros parametros;
  final Color cor;

  @override
  _ButtonFloatingState createState() => _ButtonFloatingState();
}

class _ButtonFloatingState extends State<ButtonFloating> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => {
        if (widget.route == "/operacao" && widget.parametros.opcoes.length == 0)
          {
            Scaffold.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  elevation: 10,
                  content: Text("Informe a opção"),
                  //behavior: SnackBarBehavior.floating,
                  backgroundColor: ColorConst.roxoClaro,
                ),
              ),
          }
        else
          {
            Navigator.pushNamed(
              context,
              widget.route,
              arguments: Parametros(
                opcoes: widget.parametros.opcoes,
                resultado: widget.parametros.resultado,
                quantidade: widget.parametros.quantidade,
              ),
            ),
          }
      },
      label: Text('Próximo'),
      icon: Icon(Icons.forward),
      backgroundColor: widget.cor,
      foregroundColor: Colors.white,
      elevation: 6,
    );
  }
}
