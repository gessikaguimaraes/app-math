/* import 'dart:math';
import 'package:flutter/material.dart';

class BotaoNumero extends StatelessWidget {
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

Widget _botoesNumeros() => Container(
      child: Column(
        children: [
          _botoesRow(1),
          _botoesRow(3),
        ],
      ),
    );

Widget _botoesDecorated(int numeroIndex, int numero) => Expanded(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: const BorderRadius.all(
            const Radius.circular(8),
          ),
        ),
        margin: const EdgeInsets.all(6),
        child: Text(
          "$numero",
          style: TextStyle(color: Colors.white, fontSize: 50),
        ),
      ),
    );

Widget _botoesRow(int numeroIndex) => Row(
      children: [
        _botoesDecorated(numeroIndex, new Random().nextInt(9)),
        _botoesDecorated(numeroIndex + 1, new Random().nextInt(9)),
      ],
    );

Widget _botoesGesture(BuildContext context) => GestureDetector(
      onTap: () {
        print("Numero");
        Navigator.pushNamed(context, "/operacao");
      },
      child: _botoesNumeros(),
    );
 */
