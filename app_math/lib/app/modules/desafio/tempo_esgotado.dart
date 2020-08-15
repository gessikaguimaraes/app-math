import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TempoEsgotado extends StatefulWidget {
  TempoEsgotado({Key key, this.cor, this.corButton}) : super(key: key);
  final Color cor;
  final Color corButton;

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
      //backgroundColor: widget.cor,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pop(context, 'Lost');
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                      ),
                      //color: widget.corButton,
                      child: Text(
                        "Salvar",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
