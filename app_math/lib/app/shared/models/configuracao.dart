import 'package:shared_preferences/shared_preferences.dart';

class Configuracao {
  final SharedPreferences _prefs;

  Configuracao(this._prefs);

  Future<bool> salvar(String key, String texto) async {
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    await _prefs.setString(key, texto);
    return _prefs.commit();
  }

  Future<String> mostrar(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String valor = prefs.getString(key);
    return valor;
  }
}
