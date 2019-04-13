import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';

import 'package:yops_interview/domain/actions/actions.dart';

import 'question_editor_view.dart';
import 'question_editor_model.dart';

class QuestionEditorPresenter extends StatelessWidget {
  final QuestionEditorModel model;
  final AppActions actions;

  QuestionEditorPresenter({Key key, this.model, this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QuestionEditorView(
      model: model,
      presenter: this,
    );
  }

  saveAndSendQuestion(BuiltMap<String, BuiltList<String>> question) {
    actions.question.sendQuestion(question);
  }
}
