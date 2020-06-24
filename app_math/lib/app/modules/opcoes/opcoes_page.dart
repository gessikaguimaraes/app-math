import 'package:app_math/app/shared/components/button_floating.dart';
import 'package:flutter/material.dart';

class OpcoesPage extends StatefulWidget {
  @override
  _OpcoesPageState createState() => _OpcoesPageState();
}

class _OpcoesPageState extends State<OpcoesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Escolha a opção:',
              style: TextStyle(height: 5, fontSize: 50),
            ),
            //_buildImageColumn(),
            BotaoOpcao(),
          ],
        ),
      ),
      floatingActionButton: ButtonFloating(route: "/operacao"),
    );
  }
}

Widget _buildImageColumn() => Container(
      child: Column(
        children: [
          _buildImageRow(1),
          _buildImageRow(3),
        ],
      ),
    );

Widget _buildDecoratedImage(int imageIndex) => Expanded(
      child: Container(
        /*decoration: BoxDecoration(
        border: Border.all(width: 10, color: Colors.black38),
        borderRadius: const BorderRadius.all(const Radius.circular(8)),
      ),*/
        margin: const EdgeInsets.all(4),
        child: Image.asset('images/osso$imageIndex.png'),
      ),
    );

Widget _buildImageRow(int imageIndex) => Row(
      children: [
        _buildDecoratedImage(imageIndex),
        _buildDecoratedImage(imageIndex + 1),
      ],
    );

Widget aoSelecionar() => Container(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 10, color: Colors.black38),
          borderRadius: const BorderRadius.all(
            const Radius.circular(8),
          ),
        ),
      ),
    );

Widget _botoesGesture(BuildContext context) => GestureDetector(
      onTap: () {
        aoSelecionar();
        print("Opções");
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
