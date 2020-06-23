import 'package:app_math/app/modules/opcoes/opcoes_page.dart';
import 'package:app_math/app/modules/operacoes/operacao_page.dart';
import 'package:flutter/material.dart';

class ButtonFloating extends StatefulWidget {
  ButtonFloating({Key key, this.route}) : super(key: key);
  final String route;

  @override
  _ButtonFloatingState createState() => _ButtonFloatingState();
}

class _ButtonFloatingState extends State<ButtonFloating> {
  String route;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => {
        Navigator.pushNamed(context, '/opcoes'),
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
