import 'package:app_math/app/shared/models/parametros.dart';
import 'package:flutter/material.dart';

class ResultadoPage extends StatefulWidget {
  @override
  _ResultadoPageState createState() => _ResultadoPageState();
}

class _ResultadoPageState extends State<ResultadoPage> {
  @override
  Widget build(BuildContext context) {
    final Parametros args = ModalRoute.of(context).settings.arguments;
    int resultado = args.resultado;
    print(args);

    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xffED213A), Color(0xff93291E)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Parabéns!",
                style: TextStyle(color: Colors.white, fontSize: 50),
              ),
              Text(
                "Você Acertou $resultado",
                style: TextStyle(color: Colors.white, fontSize: 50),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
