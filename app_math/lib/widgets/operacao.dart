import 'package:flutter/material.dart';

class Operacao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Operacao"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/casa.png"),
            fit: BoxFit.fill,
          )
        ),
        child: Center(
          child: Column(
            children: <Widget>[

            ]
          )
        )
      )
      /*body: Center(
        child: RaisedButton(
          onPressed: () { 
            Navigator.pop(context);
          },
          child: Text('Retornar !'),
        ),
      ),*/
    );
  }
}