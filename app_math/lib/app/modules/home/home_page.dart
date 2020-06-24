import 'package:app_math/app/shared/components/button_floating.dart';
import 'package:app_math/app/shared/const/images_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagesConst.ossoBranco),
            fit: BoxFit.none,
          ),
          color: Colors.red,
        ),
        child: LayoutBuilder(builder: (_, constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 15),
                child: Text(
                  "Qual é o seu nome?",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 25, left: 10),
                child: TextFormField(
                  controller: myController,
                  maxLength: 20,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
      floatingActionButton: ButtonFloating(route: "/opcoes"),
    );
  }
}
