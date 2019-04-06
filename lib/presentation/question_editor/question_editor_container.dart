import 'package:flutter/material.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';

import 'package:yops_interview/domain/actions/actions.dart';
import 'package:yops_interview/domain/states/states.dart';

import 'question_editor_presenter.dart';
import 'question_editor_model.dart';

class QuestionEditorContainer
    extends StoreConnector<AppState, AppActions, QuestionEditorModel> {
  @override
  QuestionEditorModel connect(AppState state) => QuestionEditorModel(state);

  @override
  Widget build(
      BuildContext context, QuestionEditorModel model, AppActions actions) {
    return QuestionEditorPresenter(
      model: model,
      actions: actions,
    );
  }
}
