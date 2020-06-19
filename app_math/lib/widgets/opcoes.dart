import 'package:flutter/material.dart';
import 'package:app_math/widgets/operacao.dart';

class Opcoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Opções'),
      ),
      body: Center(
        child: Center(
          child: Column(
            children: <Widget>[
              Text('Escolha a opção:'),
               _buildImageColumn(),
              ButtonTheme(
                height: 60.0,
                child: RaisedButton(
                  onPressed: () => { 
                    print("pressionei o botão"), 
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Operacao()),
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
            ]
          )
        )
      ),
    );
  }

 // #docregion column
  Widget _buildImageColumn() => Container(
    decoration: BoxDecoration(
      color: Colors.black26,
    ),
    child: Column(
      children: [
        _buildImageRow(1),
        _buildImageRow(3),
      ],
    ),
  );
  // #enddocregion column

  // #docregion row
  Widget _buildDecoratedImage(int imageIndex) => Expanded(
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(width: 10, color: Colors.black38),
        borderRadius: const BorderRadius.all(const Radius.circular(8)),
      ),
      margin: const EdgeInsets.all(4),
      child: Image.asset('images/osso.png'),
      //child: Image.asset('images/pic$imageIndex.jpg'),
    ),
  );

  Widget _buildImageRow(int imageIndex) => Row(
    children: [
      _buildDecoratedImage(imageIndex),
      _buildDecoratedImage(imageIndex + 1),
    ],
  );
  // #enddocregion row

}