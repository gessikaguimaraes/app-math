import 'package:app_math/app/shared/const/color_const.dart';
import 'package:flutter/material.dart';

class ConfiguracaoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        backgroundColor: Colors.cyan[600],
        child: Container(
          // height: 300.0,
          // width: 300.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 32),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                        top: 4,
                        left: 16,
                        right: 16,
                        bottom: 4,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.people,
                            color: Colors.grey,
                          ),
                          hintText: "Nome",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: const Text(
                        '1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                      leading: Radio(
                        onChanged: (value) {},
                        groupValue: null,
                        value: null,
                      ),
                    ),
                    ListTile(
                      title: const Text(
                        '2',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                      leading: Radio(
                        onChanged: (value) {},
                        groupValue: null,
                        value: null,
                      ),
                    ),
                    ListTile(
                      title: const Text(
                        '3',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                      leading: Radio(
                        onChanged: (value) {},
                        groupValue: null,
                        value: null,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: RaisedButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                  ),
                  color: ColorConst.azulEscuro,
                  child: Text(
                    "Avaliar",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ));
    // showDialog(
    //     context: context, builder: (BuildContext context) => configuracao);
  }
}
