import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntasSelecionada;
  final void Function() quandoResponder;

 const Questionario({
    required this.perguntas,
    required this.perguntasSelecionada,
    required this.quandoResponder,
    super.key,
  });

  bool get temPerguntaSelecionada {
    return perguntasSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? perguntas[perguntasSelecionada].cast()['respostas']
        : [];

    return Column(children: [
      Questao(perguntas[perguntasSelecionada]['texto'].toString()),
      ...respostas.map((texto) => Resposta(texto, quandoResponder)).toList(),
    ]);
  }
}
