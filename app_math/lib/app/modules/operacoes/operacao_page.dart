import 'dart:math';

import 'package:app_math/app/shared/const/images_const.dart';
import 'package:app_math/app/shared/models/parametros.dart';
import 'package:flutter/material.dart';

class OperacaoPage extends StatefulWidget {
  @override
  _OperacaoPageState createState() => _OperacaoPageState();
}

class _OperacaoPageState extends State<OperacaoPage> {
  int numero1 = new Random().nextInt(9);
  int numero2 = new Random().nextInt(9);

  int numero3 = new Random().nextInt(9);
  int numero4 = new Random().nextInt(9);
  int numero5 = new Random().nextInt(9);
  int quantidade = 0;

  @override
  Widget build(BuildContext context) {
    final Parametros args = ModalRoute.of(context).settings.arguments;
    print(args);

    int resultadoOperacao = numero1 + numero2;

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
              Container(
                padding: const EdgeInsets.all(0.0),
                //width: 200.0,
                //height: 30.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 240, 15, 56),
                  borderRadius: BorderRadius.all(Radius.circular(7.0)),
                ),
                child: Text(
                  '$numero1 + $numero2 = ',
                  style: TextStyle(color: Colors.white, fontSize: 50),
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: GestureDetector(
                              onTap: () {
                                if (args.quantidade != 10) {
                                  Navigator.pushNamed(
                                    context,
                                    "/operacao",
                                    arguments: Parametros(
                                      nome: "",
                                      opcoes: [],
                                      resultado: args.resultado + 1,
                                      quantidade: args.quantidade + 1,
                                    ),
                                  );
                                } else {
                                  Navigator.pushNamed(
                                    context,
                                    "/resultado",
                                    arguments: Parametros(
                                      nome: "",
                                      opcoes: [],
                                      resultado: args.resultado,
                                      quantidade: args.quantidade,
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(8),
                                  ),
                                ),
                                margin: const EdgeInsets.all(6),
                                child: Text(
                                  "$resultadoOperacao",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 50),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: GestureDetector(
                              onTap: () {
                                if (args.quantidade != 10) {
                                  Navigator.pushNamed(
                                    context,
                                    "/operacao",
                                    arguments: Parametros(
                                      nome: "",
                                      opcoes: [],
                                      resultado: args.resultado,
                                      quantidade: args.quantidade + 1,
                                    ),
                                  );
                                } else {
                                  Navigator.pushNamed(
                                    context,
                                    "/resultado",
                                    arguments: Parametros(
                                      nome: "",
                                      opcoes: [],
                                      resultado: args.resultado,
                                      quantidade: args.quantidade,
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(8),
                                  ),
                                ),
                                margin: const EdgeInsets.all(6),
                                child: Text(
                                  "$numero3",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 50),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: GestureDetector(
                              onTap: () {
                                if (args.quantidade != 10) {
                                  Navigator.pushNamed(
                                    context,
                                    "/operacao",
                                    arguments: Parametros(
                                      nome: "",
                                      opcoes: [],
                                      resultado: args.resultado,
                                      quantidade: args.quantidade + 1,
                                    ),
                                  );
                                } else {
                                  Navigator.pushNamed(
                                    context,
                                    "/resultado",
                                    arguments: Parametros(
                                      nome: "",
                                      opcoes: [],
                                      resultado: args.resultado,
                                      quantidade: args.quantidade,
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(8),
                                  ),
                                ),
                                margin: const EdgeInsets.all(6),
                                child: Text(
                                  "$numero4",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 50),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: GestureDetector(
                              onTap: () {
                                if (args.quantidade != 10) {
                                  Navigator.pushNamed(
                                    context,
                                    "/operacao",
                                    arguments: Parametros(
                                      nome: "",
                                      opcoes: [],
                                      resultado: args.resultado,
                                      quantidade: args.quantidade + 1,
                                    ),
                                  );
                                } else {
                                  Navigator.pushNamed(
                                    context,
                                    "/resultado",
                                    arguments: Parametros(
                                      nome: "",
                                      opcoes: [],
                                      resultado: args.resultado,
                                      quantidade: args.quantidade,
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(8),
                                  ),
                                ),
                                margin: const EdgeInsets.all(6),
                                child: Text(
                                  "$numero5",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 50),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //Conta(),
              //BotaoNumero()
            ],
          ),
        ),
      ),
    );
  }
}
