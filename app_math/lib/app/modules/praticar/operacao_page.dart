import 'dart:math';

import 'package:app_math/app/shared/const/color_const.dart';
import 'package:app_math/app/shared/const/images_const.dart';
import 'package:app_math/app/shared/const/tipoOperacao_const.dart';
import 'package:app_math/app/shared/models/parametros.dart';
import 'package:app_math/app/shared/services/admob_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OperacaoPage extends StatefulWidget {
  @override
  _OperacaoPageState createState() => _OperacaoPageState();
}

class _OperacaoPageState extends State<OperacaoPage> {
  int quantidadeNumero = 1;

  void updateQuantidadeNumero(int index) {
    setState(() {
      this.quantidadeNumero = index == null ? 1 : index;
    });
  }

  @override
  void initState() {
    getQuantidadePreference().then(updateQuantidadeNumero);
    AdMobService().mostrarBanner();
    super.initState();
  }

  @override
  void dispose() {
    AdMobService().bannerAd.dispose();
    super.dispose();
  }

  Future<int> getQuantidadePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("quantidadeNumero");
  }

  @override
  Widget build(BuildContext context) {
    final Parametros args = ModalRoute.of(context).settings.arguments;

    final List<String> listaOpcao = args.opcoes;
    if (quantidadeNumero == 1) {
      quantidadeNumero = 9;
    } else if (quantidadeNumero == 2) {
      quantidadeNumero = 99;
    } else if (quantidadeNumero == 3) {
      quantidadeNumero = 999;
    }

    int numero1 = new Random().nextInt(quantidadeNumero);
    int numero2 = new Random().nextInt(quantidadeNumero);

    String opcao = listaOpcao[new Random().nextInt(listaOpcao.length)];
    String operacao = getOperacao(numero1, numero2, opcao);
    if (operacao == " / ") {
      if (numero1 == 0 && numero2 == 0) {
        while (numero1 == 0) {
          numero1 = new Random().nextInt(quantidadeNumero);
        }
      }
    }
    num resultadoOperacao = getResutado(numero1, numero2, opcao);

    List<Color> listaCores = getCoresAleatoria();
    Color cor1 = listaCores[0];
    Color cor2 = listaCores[1];
    Color cor3 = listaCores[2];
    Color cor4 = listaCores[3];

    List<num> lista = getRadomQuadrado(resultadoOperacao, quantidadeNumero);
    num numero3 = lista[0];
    num numero4 = lista[1];
    num numero5 = lista[2];
    num numero6 = lista[3];

    String conta = getConta(numero1, numero2, operacao, opcao);
    int quantidade = args.quantidade + 1;

    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacementNamed(context, "/home");
      },
      child: Scaffold(
        backgroundColor: ColorConst.verde,
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
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                color: ColorConst.roxoClaro,
                child: Text(
                  "$quantidade / 10",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Image(
                image: AssetImage(getImagem('$opcao')),
                semanticLabel: getSemanticLabel('$opcao'),
                //fit: BoxFit.contain,
              ),
              Container(
                padding: const EdgeInsets.all(0),
                width: MediaQuery.of(context).size.width - 10,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ColorConst.vermelho,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Text(
                  '$conta',
                  style: TextStyle(color: Colors.white, fontSize: 50),
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        quadrado(
                            context, args, numero3, cor1, resultadoOperacao),
                        quadrado(
                            context, args, numero4, cor2, resultadoOperacao),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        quadrado(
                            context, args, numero5, cor3, resultadoOperacao),
                        quadrado(
                            context, args, numero6, cor4, resultadoOperacao),
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

getNumeroRandomico(num resultado, int quantidadeNumero) {
  List<num> listaQuadrado = [];
  int i = 0;
  listaQuadrado.add(resultado);
  while (i < 3) {
    int numero = new Random().nextInt(quantidadeNumero);
    while (listaQuadrado.contains(numero)) {
      numero = new Random().nextInt(quantidadeNumero);
    }
    listaQuadrado.add(numero);
    i++;
  }
  return listaQuadrado;
}

getRadomQuadrado(num resultadoOperacao, int quantidadeNumero) {
  List<num> lista = [];
  List<num> listaQuadrado =
      getNumeroRandomico(resultadoOperacao, quantidadeNumero);
  int i = 0;
  while (i < listaQuadrado.length) {
    num numero = listaQuadrado[new Random().nextInt(listaQuadrado.length)];
    while (lista.contains(numero)) {
      numero = listaQuadrado[new Random().nextInt(listaQuadrado.length)];
    }
    lista.add(numero);
    i++;
  }
  return lista;
}

getConta(int numero1, int numero2, String operacao, String opcao) {
  String conta = "$numero1 $operacao $numero2 = ";
  if (opcao != TipoOperacaoConst.Divisao) {
    if (numero1 < numero2) {
      conta = "$numero2 $operacao $numero1 = ";
    }
  } else {
    if (numero2 == 0 && numero1 != 0) {
      conta = "$numero2 $operacao $numero1 = ";
    }
  }
  return conta;
}

getImagem(String tipoOperacao) {
  switch (tipoOperacao) {
    case TipoOperacaoConst.Soma:
      return ImagesConst.ossoSoma;
    case TipoOperacaoConst.Divisao:
      return ImagesConst.ossoDivisao;
    case TipoOperacaoConst.Multiplicacao:
      return ImagesConst.ossoMultiplicacao;
    case TipoOperacaoConst.Substracao:
      return ImagesConst.ossoSubtracao;
    default:
      return ImagesConst.ossoSoma;
  }
}

getSemanticLabel(String tipoOperacao) {
  switch (tipoOperacao) {
    case TipoOperacaoConst.Soma:
      return 'Soma';
    case TipoOperacaoConst.Divisao:
      return 'Divisão';
    case TipoOperacaoConst.Multiplicacao:
      return 'Multiplicação';
    case TipoOperacaoConst.Substracao:
      return 'Subtração';
    default:
      return 'Soma';
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
      return num.parse(respostaCerta
          .toStringAsPrecision(2)
          .replaceAll(RegExp(r"([.]*0)(?!.*\d)"), ""));
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
    //ColorConst.vermelho,
  ];
  List<Color> lista = [];
  int i = 0;
  while (i < 4) {
    Color cor = listaCores[new Random().nextInt(listaCores.length)];
    while (lista.contains(cor)) {
      cor = listaCores[new Random().nextInt(listaCores.length)];
    }
    lista.add(cor);
    i++;
  }
  return lista;
}

Widget quadrado(BuildContext context, Parametros args, num numero, Color cor,
        num resultadoOperacao) =>
    Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height / 5,
        child: GestureDetector(
          onTap: () {
            var resultado = args.resultado;
            if (resultadoOperacao.toString() == "$numero") {
              resultado++;
            }
            if (args.quantidade != 9) {
              Navigator.pushNamed(
                context,
                "/operacao",
                arguments: Parametros(
                  opcoes: args.opcoes,
                  resultado: resultado,
                  quantidade: args.quantidade + 1,
                ),
              );
            } else {
              Navigator.pushNamed(
                context,
                "/resultado",
                arguments: Parametros(
                  opcoes: args.opcoes,
                  resultado: resultado,
                  quantidade: args.quantidade,
                ),
              );
            }
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: cor,
              borderRadius: const BorderRadius.all(
                const Radius.circular(8),
              ),
            ),
            margin: const EdgeInsets.all(6),
            child: Text(
              "$numero",
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
          ),
        ),
      ),
    );
