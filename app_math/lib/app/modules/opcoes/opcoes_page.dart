import 'dart:math';

import 'package:app_math/app/shared/components/button_floating.dart';
import 'package:app_math/app/shared/models/parametros.dart';
import 'package:flutter/material.dart';

class OpcoesPage extends StatefulWidget {
  @override
  _OpcoesPageState createState() => _OpcoesPageState();
}

class _OpcoesPageState extends State<OpcoesPage> {
  @override
  Widget build(BuildContext context) {
    final Parametros args = ModalRoute.of(context).settings.arguments;
    double borda = 0;
    print(args);
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Escolha a opção :',
              style: TextStyle(height: 5, fontSize: 50),
            ),
            //_buildImageColumn(),
            GestureDetector(
              onTap: () {
                setState(() {
                  //aoSelecionar();
                  borda = 10;
                });
              },
              child: _buildImageColumn(borda),
            ),
            //BotaoOpcao(),
          ],
        ),
      ),
      floatingActionButton: ButtonFloating(
        route: "/operacao",
        parametros: Parametros(
          nome: args.nome,
          opcoes: null,
          quantidade: 0,
          resultado: 0,
        ),
      ),
    );
  }
}

Widget _buildImageColumn(double borda) => Container(
      child: Column(
        children: [
          _buildImageRow(1, borda),
          _buildImageRow(3, borda),
        ],
      ),
    );

Widget _buildDecoratedImage(int imageIndex, double borda) => Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: borda, color: Colors.black38),
          borderRadius: const BorderRadius.all(const Radius.circular(8)),
        ),
        margin: const EdgeInsets.all(4),
        child: Image.asset('images/osso$imageIndex.png'),
      ),
    );

Widget _buildImageRow(int imageIndex, double borda) => Row(
      children: [
        _buildDecoratedImage(imageIndex, borda),
        _buildDecoratedImage(imageIndex + 1, borda),
      ],
    );

/* Widget aoSelecionar() => Container(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 10, color: Colors.black38),
          borderRadius: const BorderRadius.all(
            const Radius.circular(8),
          ),
        ),
      ),
    );
 */
void aoSelecionar() {
  // Para usar Random() tem que importar 'dart:math'
  int randomHexColor = Random().nextInt(0xFFFFFF);
  int opaqueColor = 0xFF000000 + randomHexColor;
  print(randomHexColor);
}

/* Widget _botoesGesture(BuildContext context) => GestureDetector(
      onTap: () {
        aoSelecionar();
        print(context);
      },
      child: _buildImageColumn(),
    );

class BotaoOpcao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _botoesGesture(context),
        ],
      ),
    );
  }
}
 */
