import 'dart:math';

import 'package:app_math/app/shared/const/color_const.dart';
import 'package:app_math/app/shared/const/images_const.dart';
import 'package:app_math/app/shared/const/tipoOperacao_const.dart';
import 'package:flutter/material.dart';

class OperadorController {
  List<num> getNumeroRandomico(num resultado, int quantidadeNumero) {
    List<num> listaQuadrado = [];
    int i = 0;
    listaQuadrado.add(resultado);
    while (i < 3) {
      int numero = new Random().nextInt(quantidadeNumero);
      while (listaQuadrado.contains(numero)) {
        numero = new Random().nextInt(quantidadeNumero);
      }
      listaQuadrado.add(numero);
      i++;
    }
    return listaQuadrado;
  }

  List<num> getRadomQuadrado(num resultadoOperacao, int quantidadeNumero) {
    List<num> lista = [];
    List<num> listaQuadrado =
        getNumeroRandomico(resultadoOperacao, quantidadeNumero);
    int i = 0;
    while (i < listaQuadrado.length) {
      num numero = listaQuadrado[new Random().nextInt(listaQuadrado.length)];
      while (lista.contains(numero)) {
        numero = listaQuadrado[new Random().nextInt(listaQuadrado.length)];
      }
      lista.add(numero);
      i++;
    }
    return lista;
  }

  String getConta(int numero1, int numero2, String operacao, String opcao) {
    String conta = "$numero1 $operacao $numero2 = ";
    if (opcao != TipoOperacaoConst.Divisao) {
      if (numero1 < numero2) {
        conta = "$numero2 $operacao $numero1 = ";
      }
    } else {
      if (numero2 == 0 && numero1 != 0) {
        conta = "$numero2 $operacao $numero1 = ";
      }
    }
    return conta;
  }

  getImagem(String tipoOperacao) {
    switch (tipoOperacao) {
      case TipoOperacaoConst.Soma:
        return ImagesConst.ossoSoma;
      case TipoOperacaoConst.Divisao:
        return ImagesConst.ossoDivisao;
      case TipoOperacaoConst.Multiplicacao:
        return ImagesConst.ossoMultiplicacao;
      case TipoOperacaoConst.Substracao:
        return ImagesConst.ossoSubtracao;
      default:
        return ImagesConst.ossoSoma;
    }
  }

  getSemanticLabel(String tipoOperacao) {
    switch (tipoOperacao) {
      case TipoOperacaoConst.Soma:
        return 'Soma';
      case TipoOperacaoConst.Divisao:
        return 'Divisão';
      case TipoOperacaoConst.Multiplicacao:
        return 'Multiplicação';
      case TipoOperacaoConst.Substracao:
        return 'Subtração';
      default:
        return 'Soma';
    }
  }

  getOperacao(int numero1, int numero2, String tipoOperacao) {
    switch (tipoOperacao) {
      case TipoOperacaoConst.Soma:
        return " + ";
      case TipoOperacaoConst.Divisao:
        return " / ";
      case TipoOperacaoConst.Multiplicacao:
        return " * ";
      case TipoOperacaoConst.Substracao:
        return " - ";
      default:
        return ' + ';
    }
  }

  getResutado(int numero1, int numero2, String tipoOperacao) {
    switch (tipoOperacao) {
      case TipoOperacaoConst.Soma:
        return numero1 + numero2;
      case TipoOperacaoConst.Divisao:
        num respostaCerta;
        if (numero2 == 0 && numero1 != 0) {
          respostaCerta = (numero2 / numero1);
        } else {
          respostaCerta = (numero1 / numero2);
        }
        return num.parse(respostaCerta
            .toStringAsPrecision(2)
            .replaceAll(RegExp(r"([.]*0)(?!.*\d)"), ""));
      case TipoOperacaoConst.Multiplicacao:
        return numero1 * numero2;
      case TipoOperacaoConst.Substracao:
        int respostaCerta;
        if (numero1 > numero2) {
          respostaCerta = numero1 - numero2;
        } else {
          respostaCerta = numero2 - numero1;
        }
        return respostaCerta;
      default:
        return numero1 + numero2;
    }
  }

  getCoresAleatoria() {
    final List<Color> listaCores = [
      ColorConst.amarelo,
      ColorConst.azulClaro,
      ColorConst.azulEscuro,
      ColorConst.laranja,
      ColorConst.rosaClaro,
      ColorConst.rosaEscuro,
      ColorConst.roxoClaro,
      ColorConst.roxoEscuro,
      ColorConst.verde,
      //ColorConst.vermelho,
    ];
    List<Color> lista = [];
    int i = 0;
    while (i < 4) {
      Color cor = listaCores[new Random().nextInt(listaCores.length)];
      while (lista.contains(cor)) {
        cor = listaCores[new Random().nextInt(listaCores.length)];
      }
      lista.add(cor);
      i++;
    }
    return lista;
  }
}
