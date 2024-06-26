import 'package:app_math/app/shared/const/color_const.dart';
import 'package:app_math/app/shared/models/parametros.dart';
import 'package:app_math/app/shared/services/admob_service.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResultadoPage extends StatefulWidget {
  @override
  _ResultadoPageState createState() => _ResultadoPageState();
}

class _ResultadoPageState extends State<ResultadoPage> {
  ConfettiController confettiController =
      ConfettiController(duration: Duration(seconds: 10));

  String nome = "";
  Future<String> getNamePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("nome");
  }

  @override
  void initState() {
    getNamePreference().then(updateName);
    super.initState();
  }

  void updateName(String nome) {
    setState(() {
      this.nome = nome;
    });
  }

  @override
  Widget build(BuildContext context) {
    confettiController.play();
    final Parametros args = ModalRoute.of(context).settings.arguments;
    int resultado = args.resultado;

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
                  nome,
                  style: TextStyle(color: Colors.white, fontSize: 50),
                ),
                Text(
                  "Parabéns!",
                  style: TextStyle(color: Colors.white, fontSize: 70),
                ),
                Text(
                  "Você Acertou $resultado",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
                SizedBox(
                  width: 200,
                  height: 100,
                  child: RaisedButton(
                    onPressed: () {
                      AdMobService().mostrarInterstitial(context);
                      // Navigator.pushNamed(
                      //   context,
                      //   "/opcoes",
                      //   arguments: Parametros(
                      //     opcoes: [],
                      //     resultado: 0,
                      //     quantidade: 0,
                      //   ),
                      // );
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
                SizedBox(
                  width: 200,
                  height: 100,
                  child: RaisedButton(
                    onPressed: () {
                      AdMobService().mostrarInterstitialHome(context, "/home");
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15.0),
                    ),
                    color: ColorConst.azulEscuro,
                    child: Text(
                      "Voltar para o menu",
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
