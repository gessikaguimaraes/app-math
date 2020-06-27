import 'dart:math';

import 'package:app_math/app/shared/const/color_const.dart';
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
    print(args.opcoes);

    final List<Color> circleColors = [
      //ColorConst.amarelo,
      ColorConst.azulClaro,
      ColorConst.azulEscuro,
      ColorConst.laranja,
      ColorConst.rosaClaro,
      ColorConst.rosaEscuro,
      ColorConst.roxoClaro,
      ColorConst.roxoEscuro,
      ColorConst.verde,
      ColorConst.vermelho,
    ];

    Color randomGenerator() {
      return circleColors[new Random().nextInt(9)];
    }

    final List<String> listaOpcao = args.opcoes;

    int radomOpcao() {
      return new Random().nextInt(4);
    }

    print(listaOpcao[radomOpcao()]);

    String opcao = listaOpcao[radomOpcao()];
    String operacao = getOperacao(numero1, numero2, opcao);

    int resultadoOperacao = getResutado(numero1, numero2, opcao);

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
              ColorConst.azulClaro,
              ColorConst.verde,
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
                  color: ColorConst.vermelho,
                  borderRadius: BorderRadius.all(Radius.circular(7.0)),
                ),
                child: Text(
                  '$numero1 $operacao $numero2 = ',
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
                                      nome: args.nome,
                                      opcoes: args.opcoes,
                                      resultado: args.resultado + 1,
                                      quantidade: args.quantidade + 1,
                                    ),
                                  );
                                } else {
                                  Navigator.pushNamed(
                                    context,
                                    "/resultado",
                                    arguments: Parametros(
                                      nome: args.nome,
                                      opcoes: args.opcoes,
                                      resultado: args.resultado,
                                      quantidade: args.quantidade,
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: randomGenerator(),
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
                                      nome: args.nome,
                                      opcoes: args.opcoes,
                                      resultado: args.resultado,
                                      quantidade: args.quantidade + 1,
                                    ),
                                  );
                                } else {
                                  Navigator.pushNamed(
                                    context,
                                    "/resultado",
                                    arguments: Parametros(
                                      nome: args.nome,
                                      opcoes: args.opcoes,
                                      resultado: args.resultado,
                                      quantidade: args.quantidade,
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: randomGenerator(),
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
                                      nome: args.nome,
                                      opcoes: args.opcoes,
                                      resultado: args.resultado,
                                      quantidade: args.quantidade + 1,
                                    ),
                                  );
                                } else {
                                  Navigator.pushNamed(
                                    context,
                                    "/resultado",
                                    arguments: Parametros(
                                      nome: args.nome,
                                      opcoes: args.opcoes,
                                      resultado: args.resultado,
                                      quantidade: args.quantidade,
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: randomGenerator(),
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
                                      nome: args.nome,
                                      opcoes: args.opcoes,
                                      resultado: args.resultado,
                                      quantidade: args.quantidade + 1,
                                    ),
                                  );
                                } else {
                                  Navigator.pushNamed(
                                    context,
                                    "/resultado",
                                    arguments: Parametros(
                                      nome: args.nome,
                                      opcoes: args.opcoes,
                                      resultado: args.resultado,
                                      quantidade: args.quantidade,
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: randomGenerator(),
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

getOperacao(int numero1, int numero2, String tipoOperacao) {
  switch (tipoOperacao) {
    case "Soma":
      return " + ";
    case "Divisao":
      return " / ";
    case "Multiplicacao":
      return " * ";
    case "Substracao":
      return " - ";
    default:
      return ' + ';
  }
}

getResutado(int numero1, int numero2, String tipoOperacao) {
  switch (tipoOperacao) {
    case "Soma":
      return numero1 + numero2;
    case "Divisao":
      var respostaCerta;
      if (numero2 == 0 && numero1 != 0) {
        respostaCerta = (numero2 / numero1) as int;
      } else {
        respostaCerta = (numero1 / numero2) as int;
      }
      return respostaCerta;
    case "Multiplicacao":
      return numero1 * numero2;
    case "Substracao":
      var respostaCerta;
      if (numero1 > numero2) {
        respostaCerta = numero1 - numero2;
      } else {
        respostaCerta = numero2 - numero1;
      }
      return respostaCerta;
    default:
      return numero1 + numero2;
  }
}
