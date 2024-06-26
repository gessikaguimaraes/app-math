import 'package:app_math/app/app_widget.dart';
import 'package:app_math/app/modules/configuracao/configuracao_page.dart';
import 'package:app_math/app/modules/home/home_page.dart';
import 'package:app_math/app/modules/identificacao/identificacao_page.dart';
import 'package:app_math/app/modules/praticar/opcoes_page.dart';
import 'package:app_math/app/modules/praticar/operacao_page.dart';
import 'package:app_math/app/modules/praticar/resultado_page.dart';
import 'package:app_math/app/modules/splashScreen/splashScreen_page.dart';

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
        Router('/', child: (_, args) => SplashScreenPage()),
        Router('/home', child: (_, args) => HomePage()),
        Router('/identificacao', child: (_, args) => IdentificacaoPage()),
        Router('/opcoes', child: (_, args) => OpcoesPage()),
        Router('/operacao', child: (_, args) => OperacaoPage()),
        Router('/resultado', child: (_, args) => ResultadoPage()),
        Router('/configuracao', child: (_, args) => ConfiguracaoPage()),
      ];
}
