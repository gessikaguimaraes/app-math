import 'dart:math';

import 'package:flutter/material.dart';

class OperacaoPage extends StatelessWidget {
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
                    Color.fromARGB(255, 15, 240, 132)
                  ],
                )),
            child: Center(
                child: Column(children: <Widget>[
              Image.asset('images/osso1.png'),
              Conta(),
              BotaoNumero()
            ])))
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

class Conta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int numero1 = new Random().nextInt(9);
    int numero2 = new Random().nextInt(9);
    int resultado = numero1 + numero2;
    return Container(
      padding: const EdgeInsets.all(0.0),
      //width: 200.0,
      //height: 30.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 240, 15, 56),
          borderRadius: BorderRadius.all(Radius.circular(7.0))),
      child: Text('$numero1 + $numero2 = ',
          style: TextStyle(color: Colors.white, fontSize: 50)),
    );
  }
}

Widget _botoesNumeros() => Container(
      child: Column(
        children: [
          _botoesRow(1),
          _botoesRow(3),
        ],
      ),
    );

Widget _botoesDecorated(int numeroIndex, int numero) => Expanded(
      child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: const BorderRadius.all(const Radius.circular(8)),
          ),
          margin: const EdgeInsets.all(6),
          child: Text("$numero",
              style: TextStyle(color: Colors.white, fontSize: 50))),
    );

Widget _botoesRow(int numeroIndex) => Row(
      children: [
        _botoesDecorated(numeroIndex, new Random().nextInt(9)),
        _botoesDecorated(numeroIndex + 1, new Random().nextInt(9)),
      ],
    );

Widget _botoesGesture(BuildContext context) => GestureDetector(
      onTap: () {
        print("Numero");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OperacaoPage()),
        );
      },
      child: _botoesNumeros(),
    );

class BotaoNumero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _botoesGesture(context),
        ],
      ),
    );
  }
}
