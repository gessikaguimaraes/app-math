import 'dart:async';

import 'package:flutter/material.dart';

class DesafioOperacao extends StatefulWidget {
  @override
  _DesafioOperacaoState createState() => _DesafioOperacaoState();
}

class _DesafioOperacaoState extends State<DesafioOperacao> {
  int _counter = 10;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTime();
  }

  void _startTime() {
    _counter = 10;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacementNamed(context, "/home");
      },
      child: Scaffold(
        backgroundColor: Colors.pink[300],
        body: Container(
          child: Column(
            children: <Widget>[
              Text(
                "0:$_counter",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
