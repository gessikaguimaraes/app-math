import 'dart:async';
import 'dart:math';

import 'package:app_math/app/modules/configuracao/configuracao_page.dart';
import 'package:app_math/app/modules/desafio/tempo_esgotado.dart';
import 'package:app_math/app/modules/praticar/operacao_page.dart';
import 'package:app_math/app/shared/components/quadrado_desafio.dart';
import 'package:app_math/app/shared/const/color_const.dart';
import 'package:app_math/app/shared/const/images_const.dart';
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
  AudioCache audioCache = AudioCache(prefix: "audios/");
  TextStyle textStyle1 = TextStyle(fontSize: 22);

  String opcao = "";
  String question = '';
  List<num> optionList = List();
  List<Color> listaCores = List();
  int numOfCorrectAns = 0;
  int totalQuesAsk = 0;
  bool isGameOver = false;

  num correctAns;

  Timer _timer;
  int _start = 60;
  String tempo = "1:00";

  @override
  void initState() {
    generateQuestion();
    startCountDown();
    super.initState();
    audioCache.loadAll(["Trombone.wav"]);
  }

  generateQuestion() {
    Random random = Random();
    int numero1 = random.nextInt(10);
    int numero2 = random.nextInt(10);

    OperadorController operadorController = OperadorController();
    final List<String> listaOpcao = [
      TipoOperacaoConst.Soma,
      TipoOperacaoConst.Substracao,
      TipoOperacaoConst.Multiplicacao,
      TipoOperacaoConst.Divisao
    ];

    opcao = listaOpcao[Random().nextInt(4)];
    String operacao = operadorController.getOperacao(numero1, numero2, opcao);
    if (operacao == " / ") {
      if (numero1 == 0 && numero2 == 0) {
        while (numero1 == 0) {
          numero1 = new Random().nextInt(9);
        }
      }
    }
    question = operadorController.getConta(numero1, numero2, operacao, opcao);
    correctAns = operadorController.getResutado(numero1, numero2, opcao);
    optionList.clear();
    optionList = operadorController.getRadomQuadrado(correctAns, 9);
    listaCores = operadorController.getCoresAleatoria();
  }

  /* void _startTime() {
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
   */
  executar(String nomeAudio) {
    audioCache.play(nomeAudio + ".wav");
  }

  startCountDown() {
    String conta = "";
    int contaDigitos = 0;
    String i = "";
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_start < 1) {
          timer.cancel();
          gameOver();
        } else {
          _start = _start - 1;
          conta = _start.toString();
          contaDigitos = conta.length;
          if (contaDigitos != 2) {
            i = "0";
          }
          tempo = "0:" + i + conta;
        }
      });
    });
  }

  gameOver() {
    isGameOver = true;
    playAgain();
    //res = '$numOfCorrectAns / $totalQuesAsk';
    //also disable optionalAnswer selection
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                ColorConst.azulClaro,
                ColorConst.verde,
              ],
            ),
          ),
          child: Padding(
            padding:
                EdgeInsets.only(left: 15.0, right: 15.0, top: 25, bottom: 25),
            child: Container(
              child: Column(
                children: [
                  topRow(),
                  Image(
                    image: AssetImage(getImagem('$opcao')),
                    semanticLabel: getSemanticLabel('$opcao'),
                  ),
                  questionWidget(),
                  optionalAnswers(),
                  // result(),
                  // playAgain(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  topRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          color: ColorConst.roxoEscuro,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              //_start.toString(),
              tempo,
              style: textStyle1,
            ),
          ),
        ),
        Container(
          color: ColorConst.roxoEscuro,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '$numOfCorrectAns/$totalQuesAsk',
              style: textStyle1,
            ),
          ),
        ),
      ],
    );
  }

  questionWidget() {
    return Container(
      padding: const EdgeInsets.all(0),
      width: MediaQuery.of(context).size.width - 10,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ColorConst.vermelho,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Text(
        question,
        style: TextStyle(color: Colors.white, fontSize: 50),
      ),
    );
  }

  optionalAnswers() {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(4, (index) {
          return Center(
            child: GestureDetector(
              onTap: () {
                //executar("Trombone");
                if (!isGameOver) {
                  print(optionList[index].toString());
                  checkAnswer(index);
                }
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: listaCores[index],
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(8),
                  ),
                ),
                margin: const EdgeInsets.all(6),
                child: Text(
                  optionList[index].toString(),
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  playAgain() {
    showDialog(
      context: context,
      builder: (_) => TempoEsgotado(
        cor: ColorConst.azulClaro,
        corButton: ColorConst.azulClaro,
        totalQuestions: '$totalQuesAsk',
        qtdAcerto: '$numOfCorrectAns',
      ),
    );
    /*  return Visibility(
      visible: isGameOver,
      child: RaisedButton(
        onPressed: () {
          print('play again');
          startGame();
        },
        color: Color.fromARGB(255, 214, 215, 215),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'PLAY AGAIN',
            style: textStyle1,
          ),
        ),
      ),
    );*/
  }

  checkAnswer(int index) {
    setState(() {
      if (optionList[index] == correctAns) {
        numOfCorrectAns++;
      }

      totalQuesAsk++;
      generateQuestion();
    });
  }

  startGame() {
    setState(() {
      numOfCorrectAns = 0;
      totalQuesAsk = 0;
      isGameOver = false;
      generateQuestion();
      _start = 60;
      tempo = "1:00";
      startCountDown();
    });
  }
}
