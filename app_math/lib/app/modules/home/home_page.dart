import 'package:app_math/app/shared/components/button_floating.dart';
import 'package:app_math/app/shared/models/parametros.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ButtonFloating(
        route: "/identificacao",
        parametros: Parametros(
          nome: "",
          opcoes: [],
          quantidade: 0,
          resultado: 0,
        ),
      ),
    );
  }
}
