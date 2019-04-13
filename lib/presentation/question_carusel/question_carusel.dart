import 'package:flutter/material.dart';
import 'question_carusel_container.dart';

//EntryPoint of QuestionCarusel;

class QuestionCarusel extends StatelessWidget {
  final List<String> questionList;
  QuestionCarusel(this.questionList);

  Widget build(BuildContext context) {
    return QuestionCaruselContainer(questionList);
  }
}
