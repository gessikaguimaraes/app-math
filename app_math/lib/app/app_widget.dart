import 'package:app_math/app/modules/home/homeScreen_page.dart';
import 'package:app_math/app/modules/home/home_page.dart';
import 'package:app_math/app/modules/opcoes/opcoes_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Math',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (_) => HomeScreenPage(),
        "/home": (_) => HomePage(),
        "/opcoes": (_) => OpcoesPage(),
      },
    );
  }
}
