import 'package:app_math/app/shared/components/button_floating.dart';
import 'package:app_math/app/shared/models/parametros.dart';
import 'package:flutter/material.dart';

class OpcoesPage extends StatefulWidget {
  @override
  _OpcoesPageState createState() => _OpcoesPageState();
}

class _OpcoesPageState extends State<OpcoesPage> {
  bool selectedSoma = false;
  bool selectedSubstracao = false;
  bool selectedMultiplicacao = false;
  bool selectedDivisao = false;

  List<String> listaOpcoes;

  @override
  Widget build(BuildContext context) {
    final Parametros args = ModalRoute.of(context).settings.arguments;
    print(args);
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Escolha a opção :',
              style: TextStyle(height: 5, fontSize: 50),
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
                              setState(() {
                                selectedSoma = !selectedSoma;
                              });
                              print(context.widget);
                            },
                            child: Center(
                              child: AnimatedContainer(
                                color: selectedSoma ? Colors.red : Colors.blue,
                                duration: Duration(seconds: 2),
                                curve: Curves.fastOutSlowIn,
                                child: Image.asset('images/osso1.png'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSubstracao = !selectedSubstracao;
                              });
                              print(context);
                            },
                            child: Center(
                              child: AnimatedContainer(
                                color: selectedSubstracao
                                    ? Colors.green
                                    : Colors.blue,
                                duration: Duration(seconds: 2),
                                curve: Curves.fastOutSlowIn,
                                child: Image.asset('images/osso2.png'),
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
                              setState(() {
                                selectedMultiplicacao = !selectedMultiplicacao;
                              });
                              print(context);
                            },
                            child: Center(
                              child: AnimatedContainer(
                                color: selectedMultiplicacao
                                    ? Colors.yellow
                                    : Colors.blue,
                                duration: Duration(seconds: 2),
                                curve: Curves.fastOutSlowIn,
                                child: Image.asset('images/osso3.png'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedDivisao = !selectedDivisao;
                              });
                              print(context);
                            },
                            child: Center(
                              child: AnimatedContainer(
                                color:
                                    selectedDivisao ? Colors.pink : Colors.blue,
                                duration: Duration(seconds: 2),
                                curve: Curves.fastOutSlowIn,
                                child: Image.asset('images/osso4.png'),
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
      floatingActionButton: ButtonFloating(
        route: "/operacao",
        parametros: Parametros(
          nome: args.nome,
          opcoes: args.opcoes,
          quantidade: 0,
          resultado: 0,
        ),
      ),
    );
  }
}

/*
Widget _buildImageColumn() => Container(
      child: Column(
        children: [
          _buildImageRow(1),
          _buildImageRow(3),
        ],
      ),
    );

Widget _buildDecoratedImage(int imageIndex) => Expanded(
      child: Container(
        /* decoration: BoxDecoration(
          border: Border.all(width: 10, color: Colors.black38),
          borderRadius: const BorderRadius.all(const Radius.circular(8)),
        ), */
        margin: const EdgeInsets.all(4),
        child: Image.asset('images/osso$imageIndex.png'),
      ),
    );

Widget _buildImageRow(int imageIndex) => Row(
      children: [
        _buildDecoratedImage(imageIndex),
        _buildDecoratedImage(imageIndex + 1),
      ],
    );

 class BotaoOpcao extends StatefulWidget {
  @override
  _BotaoOpcaoState createState() => _BotaoOpcaoState();
}

class _BotaoOpcaoState extends State<BotaoOpcao> {
  bool selectedSoma = false;
  bool selectedSubstracao = false;
  bool selectedMultiplicacao = false;
  bool selectedDivisao = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSoma = !selectedSoma;
                      });
                      print(context.widget);
                    },
                    child: Center(
                      child: AnimatedContainer(
                        color: selectedSoma ? Colors.red : Colors.blue,
                        duration: Duration(seconds: 2),
                        curve: Curves.fastOutSlowIn,
                        child: Image.asset('images/osso1.png'),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSubstracao = !selectedSubstracao;
                      });
                      print(context);
                    },
                    child: Center(
                      child: AnimatedContainer(
                        color: selectedSubstracao ? Colors.green : Colors.blue,
                        duration: Duration(seconds: 2),
                        curve: Curves.fastOutSlowIn,
                        child: Image.asset('images/osso2.png'),
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
                      setState(() {
                        selectedMultiplicacao = !selectedMultiplicacao;
                      });
                      print(context);
                    },
                    child: Center(
                      child: AnimatedContainer(
                        color:
                            selectedMultiplicacao ? Colors.yellow : Colors.blue,
                        duration: Duration(seconds: 2),
                        curve: Curves.fastOutSlowIn,
                        child: Image.asset('images/osso3.png'),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDivisao = !selectedDivisao;
                      });
                      print(context);
                    },
                    child: Center(
                      child: AnimatedContainer(
                        color: selectedDivisao ? Colors.pink : Colors.blue,
                        duration: Duration(seconds: 2),
                        curve: Curves.fastOutSlowIn,
                        child: Image.asset('images/osso4.png'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
} */
