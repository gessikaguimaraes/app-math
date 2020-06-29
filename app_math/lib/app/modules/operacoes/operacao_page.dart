import 'dart:math';

import 'package:app_math/app/shared/const/color_const.dart';
import 'package:app_math/app/shared/const/images_const.dart';
import 'package:app_math/app/shared/const/tipoOperacao_const.dart';
import 'package:app_math/app/shared/models/parametros.dart';
import 'package:flutter/material.dart';

class OperacaoPage extends StatefulWidget {
  @override
  _OperacaoPageState createState() => _OperacaoPageState();
}

class _OperacaoPageState extends State<OperacaoPage> {
  int numero1 = new Random().nextInt(9);
  int numero2 = new Random().nextInt(9);
  int quantidade = 0;

  @override
  Widget build(BuildContext context) {
    final Parametros args = ModalRoute.of(context).settings.arguments;
    //print(args.opcoes);

    final List<Color> listaCores = [
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
      return listaCores[new Random().nextInt(9)];
    }

    final List<String> listaOpcao = args.opcoes;
    if (listaOpcao.length == 0) {
      //Colocar na tela Opção uma snackBar informando para selecionar uma opção
      //retornar a tela de opção
      Navigator.popAndPushNamed(
        context,
        "/opcao",
      );
      print(context);
    }

    int radomOpcao() {
      return new Random().nextInt(listaOpcao.length);
    }

    String opcao = listaOpcao[radomOpcao()];
    String operacao = getOperacao(numero1, numero2, opcao);
    num resultadoOperacao = getResutado(numero1, numero2, opcao);

    List<num> listaQuadrado = getNumeroRandomico(resultadoOperacao);

    num numero3 = listaQuadrado[0];
    num numero4 = listaQuadrado[1];
    num numero5 = listaQuadrado[2];
    num numero6 = listaQuadrado[3];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagesConst.casa),
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
              getImagem('$opcao'),
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
                        //quadrado(context, args, resultadoOperacao),
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
                                  "$numero3",
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
                                  "$numero4",
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
                                  "$numero5",
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
                                  "$numero6",
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
            ],
          ),
        ),
      ),
    );
  }
}

getNumeroRandomico(num resultado) {
  List<num> listaQuadrado = [];
  int i = 0;
  listaQuadrado.add(resultado);
  while (i < 3) {
    int numero = new Random().nextInt(9);
    while (listaQuadrado.contains(numero)) {
      numero = new Random().nextInt(9);
    }
    listaQuadrado.add(numero);
    i++;
  }
  return listaQuadrado;
}

getRadomQuadrado(num resultadoOperacao) {
  List<num> listaQuadrado = getNumeroRandomico(resultadoOperacao);
  num numero = new Random().nextInt(listaQuadrado.length);
  print(numero);
  return numero.toString();
}

getImagem(String tipoOperacao) {
  switch (tipoOperacao) {
    case TipoOperacaoConst.Soma:
      return Image.asset(ImagesConst.ossoSoma);
    case TipoOperacaoConst.Divisao:
      return Image.asset(ImagesConst.ossoDivisao);
    case TipoOperacaoConst.Multiplicacao:
      return Image.asset(ImagesConst.ossoMultiplicacao);
    case TipoOperacaoConst.Substracao:
      return Image.asset(ImagesConst.ossoSubtracao);
    default:
      return Image.asset(ImagesConst.ossoSoma);
  }
}

getOperacao(int numero1, int numero2, String tipoOperacao) {
  switch (tipoOperacao) {
    case TipoOperacaoConst.Soma:
      return " + ";
    case TipoOperacaoConst.Divisao:
      return " / ";
    case TipoOperacaoConst.Multiplicacao:
      return " * ";
    case TipoOperacaoConst.Substracao:
      return " - ";
    default:
      return ' + ';
  }
}

getResutado(int numero1, int numero2, String tipoOperacao) {
  switch (tipoOperacao) {
    case TipoOperacaoConst.Soma:
      return numero1 + numero2;
    case TipoOperacaoConst.Divisao:
      num respostaCerta;
      if (numero2 == 0 && numero1 != 0) {
        respostaCerta = (numero2 / numero1);
      } else {
        respostaCerta = (numero1 / numero2);
      }
      return num.parse(respostaCerta.toStringAsPrecision(2));
    case TipoOperacaoConst.Multiplicacao:
      return numero1 * numero2;
    case TipoOperacaoConst.Substracao:
      int respostaCerta;
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

getCoresAleatoria() {
  final List<Color> listaCores = [
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
  return listaCores[new Random().nextInt(9)];
}

Widget quadrado(BuildContext context, Parametros args, num numero) => Expanded(
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
              color: getCoresAleatoria(),
              borderRadius: const BorderRadius.all(
                const Radius.circular(8),
              ),
            ),
            margin: const EdgeInsets.all(6),
            child: Text(
              "$numero",
              style: TextStyle(color: Colors.white, fontSize: 50),
            ),
          ),
        ),
      ),
    );
