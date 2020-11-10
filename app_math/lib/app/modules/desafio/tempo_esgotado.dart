import 'package:app_math/app/modules/desafio/desafio_operacao.dart';
import 'package:app_math/app/shared/services/admob_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TempoEsgotado extends StatefulWidget {
  TempoEsgotado(
      {Key key, this.cor, this.corButton, this.totalQuestions, this.qtdAcerto})
      : super(key: key);
  final Color cor;
  final Color corButton;
  final String totalQuestions;
  final String qtdAcerto;

  @override
  _TempoEsgotadoState createState() => _TempoEsgotadoState();
}

class _TempoEsgotadoState extends State<TempoEsgotado> {
  TextEditingController _controladorNome = TextEditingController();
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      backgroundColor: widget.cor,
      title: Text(
        "Tempo Esgotado",
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
              Container(
                child: Text(
                  "Você acertou ${widget.qtdAcerto} de ${widget.totalQuestions}",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Container(
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DesafioOperacao(),
                      ),
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                  ),
                  color: widget.corButton,
                  child: Text(
                    "Jogar Novamente",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              Container(
                child: RaisedButton(
                  onPressed: () {
                    AdMobService().mostrarInterstitialHome(context, "/home");
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                  ),
                  color: widget.corButton,
                  child: Text(
                    "Voltar para o menu",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
