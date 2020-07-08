import 'package:app_math/app/shared/const/color_const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfiguracaoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      backgroundColor: Colors.cyan[600],
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
          // height: 300.0,
          // width: 300.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                // padding: EdgeInsets.only(top: 32),
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
                    ListTile(
                      title: const Text(
                        '1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                      leading: Radio(
                        activeColor: ColorConst.rosaEscuro,
                        onChanged: (value) {},
                        groupValue: null,
                        value: null,
                      ),
                    ),
                    ListTile(
                      title: const Text(
                        '2',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                      leading: Radio(
                        activeColor: ColorConst.rosaEscuro,
                        onChanged: (value) {},
                        groupValue: null,
                        value: null,
                      ),
                    ),
                    ListTile(
                      title: const Text(
                        '3',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                      leading: Radio(
                        activeColor: ColorConst.rosaEscuro,
                        onChanged: (value) {},
                        groupValue: null,
                        value: null,
                      ),
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
                  color: ColorConst.rosaEscuro,
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
    // showDialog(
    //     context: context, builder: (BuildContext context) => configuracao);
  }
}
