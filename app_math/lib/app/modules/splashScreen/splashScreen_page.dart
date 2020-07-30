import 'dart:async';
import 'dart:math' as math;

import 'package:app_math/app/shared/const/images_const.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with TickerProviderStateMixin {
  AnimationController _controller;

  String route = "/identificacao";
  Future<String> getNamePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("nome") != "") {
      route = "/home";
    }
    return prefs.getString("nome");
  }

  @override
  void initState() {
    super.initState();
    getNamePreference();
    Future.delayed(Duration(seconds: 5)).then((value) {
      Navigator.pushNamed(context, route);
    });
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      //backgroundColor: Color(0xff93291E),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xffED213A), Color(0xff93291E)],
              ),
            ),
          ),
          SpinningContainer(controller: _controller),
        ],
      ),
    );
  }
}

class SpinningContainer extends AnimatedWidget {
  const SpinningContainer({Key key, AnimationController controller})
      : super(key: key, listenable: controller);

  Animation<double> get _progress => listenable;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _progress.value * 2.0 * math.pi,
      child: Container(
        alignment: Alignment.center,
        child: Image.asset(
          ImagesConst.favicon,
          semanticLabel: "Logo do sistema",
        ),
      ),
    );
  }
}
