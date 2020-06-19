import 'package:flutter/material.dart';
import 'package:app_math/widgets/opcoes.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      backgroundColor: Colors.pinkAccent,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                autofocus: true,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.black, fontSize: 30),
                decoration: InputDecoration(
                  labelText:"Qual é o seu nome?",
                  labelStyle: TextStyle(color: Colors.black),
                )
              ),
              ButtonTheme(
                height: 60.0,
                child: RaisedButton(
                  onPressed: () => { 
                    print("pressionei o botão"), 
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Opcoes()),
                    )
                  },
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  child: Text(
                    "Proximo",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  color:Colors.red,
                ),
              ),
            ],
         ),
        ),
      )     
    );
  }
}