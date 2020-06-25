import 'package:app_math/app/app_widget.dart';
import 'package:app_math/app/modules/home/homeScreen_page.dart';
import 'package:app_math/app/modules/home/home_page.dart';
import 'package:app_math/app/modules/opcoes/opcoes_page.dart';
import 'package:app_math/app/modules/operacoes/operacao_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [];
  /*  List<Bind> get binds {
    return [
      Bind((i) => AppController()),
    ];
  } */

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomeScreenPage()),
        Router('/home', child: (_, args) => HomePage()),
        Router('/opcoes', child: (_, args) => OpcoesPage()),
        Router('/operacao', child: (_, args) => OperacaoPage()),
      ];
}
