import 'dart:math';

import 'package:app_math/app/shared/const/color_const.dart';
import 'package:app_math/app/shared/models/parametros.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class ResultadoPage extends StatefulWidget {
  @override
  _ResultadoPageState createState() => _ResultadoPageState();
}

class _ResultadoPageState extends State<ResultadoPage> {
  ConfettiController confettiController =
      ConfettiController(duration: Duration(seconds: 10));

  @override
  Widget build(BuildContext context) {
    confettiController.play();
    final Parametros args = ModalRoute.of(context).settings.arguments;
    int resultado = args.resultado;
    String nome = args.nome;

    var size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacementNamed(context, "/home");
      },
      child: Scaffold(
        backgroundColor: ColorConst.vermelho,
        body: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                ColorConst.rosaEscuro,
                ColorConst.vermelho,
              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: ConfettiWidget(
                    confettiController: confettiController,
                    blastDirectionality: BlastDirectionality.explosive,
                    shouldLoop: true,
                    colors: const [
                      Colors.green,
                      Colors.blue,
                      Colors.pink,
                      Colors.orange,
                      Colors.purple
                    ],
                  ),
                ),
                Text(
                  "$nome",
                  style: TextStyle(color: Colors.white, fontSize: 50),
                ),
                Text(
                  "Parabéns!",
                  style: TextStyle(color: Colors.white, fontSize: 70),
                ),
                Text(
                  "Você Acertou $resultado",
                  style: TextStyle(color: Colors.white, fontSize: 50),
                ),
                SizedBox(
                  width: 200,
                  height: 100,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        "/opcoes",
                        arguments: Parametros(
                          nome: args.nome,
                          opcoes: [],
                          resultado: 0,
                          quantidade: 0,
                        ),
                      );
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15.0),
                    ),
                    color: ColorConst.azulEscuro,
                    child: Text(
                      "Jogar Novamente",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
