import 'dart:async';
import 'dart:math';

import 'package:app_math/app/modules/desafio/tempo_esgotado.dart';
import 'package:app_math/app/modules/praticar/operacao_page.dart';
import 'package:app_math/app/shared/components/quadrado_desafio.dart';
import 'package:app_math/app/shared/const/color_const.dart';
import 'package:app_math/app/shared/const/tipoOperacao_const.dart';
import 'package:app_math/app/shared/controlador/operacaoController.dart';
import 'package:app_math/app/shared/models/parametros.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audio_cache.dart';

class DesafioOperacao extends StatefulWidget {
  @override
  _DesafioOperacaoState createState() => _DesafioOperacaoState();
}

class _DesafioOperacaoState extends State<DesafioOperacao> {
  AudioCache _audioCache = AudioCache(prefix: "audios/");
  //String valor = "1:00";
  //int _counter = 60;
  String valor = "0:10";
  int _counter = 10;
  Timer _timer;

  _executar(String nomeAudio) {
    _audioCache.play(nomeAudio + ".wav");
  }

  @override
  void initState() {
    super.initState();
    // _startTime();
  }

  void _startTime() {
    String conta = "";
    int contaDigitos = 0;
    String i = "";
    // _counter = 60;
    _counter = 10;
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
          conta = _counter.toString();
          contaDigitos = conta.length;
          if (contaDigitos != 2) {
            i = "0";
          }
          valor = "0:" + i + conta;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  OperadorController operadorController = OperadorController();

  @override
  Widget build(BuildContext context) {
    final List<String> listaOpcao = [
      TipoOperacaoConst.Soma,
      TipoOperacaoConst.Substracao,
      TipoOperacaoConst.Multiplicacao,
      TipoOperacaoConst.Divisao
    ];

    int numero1 = new Random().nextInt(9);
    int numero2 = new Random().nextInt(9);
    String opcao = listaOpcao[Random().nextInt(4)];
    String operacao = operadorController.getOperacao(numero1, numero2, opcao);
    if (operacao == " / ") {
      if (numero1 == 0 && numero2 == 0) {
        while (numero1 == 0) {
          numero1 = new Random().nextInt(9);
        }
      }
    }
    num resultadoOperacao =
        operadorController.getResutado(numero1, numero2, opcao);

    List<Color> listaCores = operadorController.getCoresAleatoria();
    Color cor1 = listaCores[0];
    Color cor2 = listaCores[1];
    Color cor3 = listaCores[2];
    Color cor4 = listaCores[3];

    List<num> lista = operadorController.getRadomQuadrado(resultadoOperacao, 9);
    num numero3 = lista[0];
    num numero4 = lista[1];
    num numero5 = lista[2];
    num numero6 = lista[3];

    String conta =
        operadorController.getConta(numero1, numero2, operacao, opcao);
    Parametros parametros;

    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacementNamed(context, "/home");
      },
      child: Scaffold(
        backgroundColor: Colors.pink[300],
        body: Container(
          child: Column(
            children: <Widget>[
              Center(
                child: Text(
                  valor,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
              ),
              Container(
                color: ColorConst.roxoClaro,
                child: Text(
                  "10",
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
                        QuadradoDesafio(
                          parametros: parametros,
                          numero: numero3,
                          cor: cor1,
                          resultadoOperacao: resultadoOperacao,
                        ),
                        QuadradoDesafio(
                          parametros: parametros,
                          numero: numero4,
                          cor: cor2,
                          resultadoOperacao: resultadoOperacao,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        QuadradoDesafio(
                          parametros: parametros,
                          numero: numero5,
                          cor: cor3,
                          resultadoOperacao: resultadoOperacao,
                        ),
                        QuadradoDesafio(
                          parametros: parametros,
                          numero: numero6,
                          cor: cor4,
                          resultadoOperacao: resultadoOperacao,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              /* (_counter > 0
                  ? Text("")
                  : SimpleDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      //backgroundColor: widget.cor,
                      title: Text(
                        "Que pena seu tempo acabou, tente novamente",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.pacifico(
                          color: Colors.black87,
                          letterSpacing: 1,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      children: <Widget>[
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Container(
                                    child: RaisedButton(
                                      onPressed: () {
                                        Navigator.pop(context, 'Lost');
                                      },
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(15.0),
                                      ),
                                      color: Colors.blueAccent,
                                      child: Text(
                                        "Jogar Novamente",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    )), */
            ],
          ),
        ),
      ),
    );
  }
}
