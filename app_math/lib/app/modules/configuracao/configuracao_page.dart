import 'package:app_math/app/shared/const/color_const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfiguracaoPage extends StatefulWidget {
  ConfiguracaoPage({Key key, this.cor, this.corButton}) : super(key: key);
  final Color cor;
  final Color corButton;

  @override
  _ConfiguracaoPageState createState() => _ConfiguracaoPageState();
}

class _ConfiguracaoPageState extends State<ConfiguracaoPage> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      backgroundColor: widget.cor,
      title: Text(
        "Configuração",
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
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                        top: 4,
                        left: 16,
                        right: 16,
                        bottom: 4,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.people,
                            color: Colors.black87,
                          ),
                          hintText: "Nome",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text("Quantidade de números",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _customRadio("1", 1),
                        _customRadio("2", 2),
                        _customRadio("3", 3),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: RaisedButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                  ),
                  color: widget.corButton,
                  child: Text(
                    "Avaliar",
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

  void changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget _customRadio(String texto, int index) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        right: 3,
        left: 3,
        bottom: 10,
      ),
      child: RaisedButton(
        color: selectedIndex == index ? widget.corButton : widget.cor,
        onPressed: () => changeIndex(index),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(
            color: widget.corButton,
          ),
        ),
        child: Text(
          texto,
          style: TextStyle(
            fontSize: 30,
            color: selectedIndex == index ? Colors.black : widget.corButton,
          ),
        ),
      ),
    );
  }
}
