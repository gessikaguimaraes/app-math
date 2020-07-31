import 'package:app_math/app/shared/components/button_floating.dart';
import 'package:app_math/app/shared/components/header.dart';
import 'package:app_math/app/shared/const/color_const.dart';
import 'package:app_math/app/shared/const/images_const.dart';
import 'package:app_math/app/shared/const/tipoOperacao_const.dart';
import 'package:app_math/app/shared/models/parametros.dart';
import 'package:app_math/app/shared/services/admob_service.dart';
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

  List<String> listaOpcoes = [];

  @override
  void initState() {
    AdMobService().mostrarBanner();
    super.initState();
  }

  @override
  void dispose() {
    AdMobService().bannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Parametros args = ModalRoute.of(context).settings.arguments;
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacementNamed(context, "/home");
      },
      child: Scaffold(
        appBar: HeaderAppBar(
          ColorConst.roxoClaro,
          "Escolha a opção",
          Colors.blue[600],
          35,
          FontStyle.normal,
          ColorConst.azulClaro,
        ),
        backgroundColor: ColorConst.azulClaro,
        body: Container(
          //padding: const EdgeInsets.all(10.0),
          child: Wrap(
            direction: Axis.horizontal,
            children: <Widget>[
              Container(
                height: size.height / 7,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSoma = !selectedSoma;
                    });
                    if (selectedSoma &&
                        !listaOpcoes.contains(TipoOperacaoConst.Soma)) {
                      listaOpcoes.add(TipoOperacaoConst.Soma);
                    } else {
                      listaOpcoes.remove(TipoOperacaoConst.Soma);
                    }
                  },
                  child: Center(
                    child: AnimatedContainer(
                      color: selectedSoma
                          ? ColorConst.vermelho
                          : ColorConst.azulClaro,
                      duration: Duration(seconds: 2),
                      curve: Curves.fastOutSlowIn,
                      child: Image.asset(
                        ImagesConst.ossoSoma,
                        semanticLabel: "Soma",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: size.height / 7,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSubstracao = !selectedSubstracao;
                    });
                    if (selectedSubstracao &&
                        !listaOpcoes.contains(TipoOperacaoConst.Substracao)) {
                      listaOpcoes.add(TipoOperacaoConst.Substracao);
                    } else {
                      listaOpcoes.remove(TipoOperacaoConst.Substracao);
                    }
                  },
                  child: Center(
                    child: AnimatedContainer(
                      color: selectedSubstracao
                          ? ColorConst.verde
                          : ColorConst.azulClaro,
                      duration: Duration(seconds: 2),
                      curve: Curves.fastOutSlowIn,
                      child: Image.asset(
                        ImagesConst.ossoSubtracao,
                        semanticLabel: "Subtração",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: size.height / 7,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedMultiplicacao = !selectedMultiplicacao;
                    });
                    if (selectedMultiplicacao &&
                        !listaOpcoes
                            .contains(TipoOperacaoConst.Multiplicacao)) {
                      listaOpcoes.add(TipoOperacaoConst.Multiplicacao);
                    } else {
                      listaOpcoes.remove(TipoOperacaoConst.Multiplicacao);
                    }
                  },
                  child: Center(
                    child: AnimatedContainer(
                      color: selectedMultiplicacao
                          ? ColorConst.amarelo
                          : ColorConst.azulClaro,
                      duration: Duration(seconds: 2),
                      curve: Curves.fastOutSlowIn,
                      child: Image.asset(
                        ImagesConst.ossoMultiplicacao,
                        semanticLabel: "Multiplicação",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: size.height / 7,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDivisao = !selectedDivisao;
                    });
                    if (selectedDivisao &&
                        !listaOpcoes.contains(TipoOperacaoConst.Divisao)) {
                      listaOpcoes.add(TipoOperacaoConst.Divisao);
                    } else {
                      listaOpcoes.remove(TipoOperacaoConst.Divisao);
                    }
                  },
                  child: Center(
                    child: AnimatedContainer(
                      color: selectedDivisao
                          ? ColorConst.rosaEscuro
                          : ColorConst.azulClaro,
                      duration: Duration(seconds: 2),
                      curve: Curves.fastOutSlowIn,
                      child: Image.asset(
                        ImagesConst.ossoDivisao,
                        semanticLabel: "Divisão",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: ButtonFloating(
          route: "/operacao",
          parametros: Parametros(
            opcoes: listaOpcoes,
            quantidade: 0,
            resultado: 0,
          ),
          cor: ColorConst.roxoClaro,
        ),
      ),
    );
  }
}
