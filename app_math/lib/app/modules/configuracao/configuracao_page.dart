import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfiguracaoPage extends StatefulWidget {
  ConfiguracaoPage({Key key, this.cor, this.corButton}) : super(key: key);
  final Color cor;
  final Color corButton;

  @override
  _ConfiguracaoPageState createState() => _ConfiguracaoPageState();
}

class _ConfiguracaoPageState extends State<ConfiguracaoPage> {
  TextEditingController _controladorNome = TextEditingController();
  int selectedIndex = 1;
  String _nome = "";

  Future<String> getNamePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString("nome"));
    return prefs.getString("nome");
  }

  Future<int> getQuantidadePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getInt("quantidadeNumero"));
    return prefs.getInt("quantidadeNumero");
  }

  Future<bool> savedNamePreference(String nome) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("nome", nome);
    return prefs.commit();
  }

  Future<bool> savedQuantidadePreference(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("quantidadeNumero", index);
    return prefs.commit();
  }

  @override
  void initState() {
    getNamePreference().then(updateName);
    getQuantidadePreference().then(changeIndex);
    super.initState();
  }

  void saveNome(String nome) {
    savedNamePreference(nome).then((bool committed) {
      updateName(nome);
    });
  }

  void saveQuantidade(int index) {
    savedQuantidadePreference(index).then((bool committed) {
      changeIndex(index);
    });
  }

  void updateName(String nome) {
    setState(() {
      this._nome = nome;
    });
  }

  void changeIndex(int index) {
    setState(() {
      this.selectedIndex = index;
    });
  }

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
                        controller: _controladorNome,
                        //initialValue: _nome,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.people,
                            color: Colors.black87,
                          ),
                          hintText: "Nome",
                          labelText: _nome,
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        _customRadio("1", 1),
                        _customRadio("2", 2),
                        _customRadio("3", 3),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
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
                  Container(
                    child: RaisedButton(
                      onPressed: () {
                        saveNome(_controladorNome.text);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                      ),
                      color: widget.corButton,
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

  Widget _customRadio(String texto, int index) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: RaisedButton(
        color: selectedIndex == index ? widget.corButton : widget.cor,
        onPressed: () => saveQuantidade(index),
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
