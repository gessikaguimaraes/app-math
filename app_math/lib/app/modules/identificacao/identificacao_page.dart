import 'package:app_math/app/shared/components/header.dart';
import 'package:app_math/app/shared/const/color_const.dart';
import 'package:app_math/app/shared/const/images_const.dart';
import 'package:app_math/app/shared/services/admob_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IdentificacaoPage extends StatefulWidget {
  @override
  IdentificacaoPageState createState() => IdentificacaoPageState();
}

class IdentificacaoPageState extends State<IdentificacaoPage> {
  TextEditingController _controladorNome = TextEditingController();

  Future<bool> savedNamePreference(String nome) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("nome", nome);
    return prefs.commit();
  }

  Future<String> getNamePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String nome = prefs.getString("nome");
    return nome;
  }

  void saveName() {
    String nome = _controladorNome.text;
    savedNamePreference(nome).then((bool committed) {
      Navigator.of(context).pushNamed("/home");
    });
  }

  void updateName(String nome) {
    setState(() {
      this._controladorNome.text = nome;
    });
  }

  @override
  void initState() {
    AdMobService().mostrarBanner();
    //AdMobService().mostrarInterstitial();
    getNamePreference().then(updateName);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.vermelho,
      appBar: HeaderAppBar(
        Colors.cyan[600],
        "Matemática",
        Colors.pink[500],
        40,
        FontStyle.italic,
        ColorConst.vermelho,
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
                child: Text(
                  "Qual é o seu nome?",
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'RobotoMono',
                    fontWeight: FontWeight.bold,
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
                    counterText: "",
                    contentPadding: EdgeInsets.zero,
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          saveName();
        },
        label: Text('Próximo'),
        icon: Icon(Icons.forward),
        backgroundColor: Colors.cyan[600],
        foregroundColor: Colors.white,
        elevation: 6,
      ),
      /* floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: ButtonFloating(
        route: "/home",
        parametros: Parametros(
          nome: _controladorNome.text,
          opcoes: [],
          quantidade: 0,
          resultado: 0,
        ),
        cor: Colors.cyan[600],
      ), */
    );
  }
}
