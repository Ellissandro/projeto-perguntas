import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntasSelecionada = 0;
  int _pontuacaoTotal = 0;
  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        { 'texto': 'Preto', 'pontuacao': 10 },
        { 'texto': 'Vermelho', 'pontuacao': 5 },
        { 'texto': 'Verde', 'pontuacao': 3 },
        { 'texto': 'Branco', 'pontuacao': 1 },
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        { 'texto':'Coelho', 'pontuacao': 10 },
        { 'texto':'Cobra', 'pontuacao': 5 },
        { 'texto':'Elefante', 'pontuacao': 3 },
        { 'texto':'Leão', 'pontuacao': 1 },
      ],
    },
    {
      'texto': 'Qual seu instrutor favorito?',
      'respostas': [
        { 'texto': 'Leo', 'pontuacao': 10 },
        { 'texto': 'Maria', 'pontuacao': 5 },
        { 'texto': 'João', 'pontuacao': 3 },
        { 'texto': 'Pedro', 'pontuacao': 1 },
      ],
    }
  ];

  void _responder(int pontuacao) {
    setState(() {
      _perguntasSelecionada++;
      _pontuacaoTotal += pontuacao;
    });
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntasSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntasSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntasSelecionada: _perguntasSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
