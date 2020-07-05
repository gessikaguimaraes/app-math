import 'package:app_math/app/shared/components/button_floating.dart';
import 'package:app_math/app/shared/components/cutom_appbar.dart';
import 'package:app_math/app/shared/const/color_const.dart';
import 'package:app_math/app/shared/const/images_const.dart';
import 'package:app_math/app/shared/models/parametros.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controladorNome = TextEditingController();

  _salvar() async {
    String valorDigitado = _controladorNome.text;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("nome", valorDigitado);
    print(valorDigitado);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.vermelho,
      appBar: PreferredSize(
        child: ClipPath(
          clipper: CustomAppBar(),
          child: Container(
            color: Colors.grey[400],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Home',
                        style: TextStyle(color: Colors.red, fontSize: 25),
                      ),
                    ),
                    Container(
                      // margin: const EdgeInsets.only(right: 150),
                      child: IconButton(
                        icon: Icon(
                          Icons.settings,
                          size: 40,
                        ),
                        //color: ColorConst.vermelho,
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            "/configuracao",
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        preferredSize: Size.fromHeight(kToolbarHeight + 50),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagesConst.ossoBranco),
            fit: BoxFit.contain,
          ),
          //color: ColorConst.vermelho,
        ),
        child: LayoutBuilder(builder: (_, constraints) {
          return Stack(
            alignment: Alignment.center,
            //mainAxisAlignmento: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5.0),
                alignment: Alignment.topCenter,
                //margin: const EdgeInsets.only(top: 100),
                child: Text(
                  "Qual é o seu nome?",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 25, left: 10),
                child: TextFormField(
                  autofocus: false,
                  controller: _controladorNome,
                  maxLength: 20,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: ButtonFloating(
        route: "/opcoes",
        parametros: Parametros(
          nome: _controladorNome.text,
          opcoes: [],
          quantidade: 0,
          resultado: 0,
        ),
      ),
    );
  }
}
