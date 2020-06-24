import 'package:app_math/app/modules/operacoes/botaoNumero_widget.dart';
import 'package:app_math/app/modules/operacoes/conta_widget.dart';
import 'package:app_math/app/shared/const/images_const.dart';
import 'package:flutter/material.dart';

class OperacaoPage extends StatefulWidget {
  @override
  _OperacaoPageState createState() => _OperacaoPageState();
}

class _OperacaoPageState extends State<OperacaoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/casa.png"),
            fit: BoxFit.fill,
          ),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 15, 172, 240),
              Color.fromARGB(255, 15, 240, 132),
            ],
          ),
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              Image.asset(ImagesConst.ossoSoma),
              Conta(),
              BotaoNumero()
            ],
          ),
        ),
      ),
      /*body: Center(
        child: RaisedButton(
          onPressed: () { 
            Navigator.pop(context);
          },
          child: Text('Retornar !'),
        ),
      ),*/
    );
  }
}
