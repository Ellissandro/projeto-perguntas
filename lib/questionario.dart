import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntasSelecionada;
  final void Function(int) quandoResponder;

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
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntasSelecionada]['respostas']
            as List<Map<String, Object>>
        : [];

    return Column(children: [
      Questao(perguntas[perguntasSelecionada]['texto'].toString()),
      ...respostas.map((resp) {
        return Resposta(
          resp['texto'] as String,
          () => quandoResponder(int.parse(resp['pontuacao'].toString())),
        );
      }).toList(),
    ]);
  }
}
