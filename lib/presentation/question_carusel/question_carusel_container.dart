import 'package:flutter/material.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';

import 'package:yops_interview/domain/actions/actions.dart';
import 'package:yops_interview/domain/states/states.dart';

import 'question_carusel_presenter.dart';
import 'question_carusel_model.dart';

class QuestionCaruselContainer
    extends StoreConnector<AppState, AppActions, QuestionCaruselModel> {
  final List<String> questionList;
  QuestionCaruselContainer(this.questionList);

  @override
  QuestionCaruselModel connect(AppState state) =>
      QuestionCaruselModel(state, questionList);

  @override
  Widget build(
      BuildContext context, QuestionCaruselModel model, AppActions actions) {
    return QuestionCaruselPresenter(
      model: model,
      actions: actions,
    );
  }
}
