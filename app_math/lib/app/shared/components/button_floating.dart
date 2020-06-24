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
        print(widget.parametros.nome),
        Navigator.pushNamed(context, widget.route),
        /*  Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OperacaoPage()),
        ) */
      },
      label: Text('Próximo'),
      icon: Icon(Icons.forward),
      backgroundColor: Colors.blue,
    );
  }
}
