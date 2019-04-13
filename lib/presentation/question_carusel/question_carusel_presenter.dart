import 'package:flutter/material.dart';

import 'package:yops_interview/domain/actions/actions.dart';

import 'question_carusel_view.dart';
import 'question_carusel_model.dart';

class QuestionCaruselPresenter extends StatelessWidget {
  final QuestionCaruselModel model;
  final AppActions actions;

  QuestionCaruselPresenter({Key key, this.model, this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QuestionCaruselView(
      model: model,
      presenter: this,
    );
  }
}
