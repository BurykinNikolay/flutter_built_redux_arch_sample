import 'package:flutter/material.dart';

import 'package:yops_interview/domain/actions/actions.dart';

import 'package:yops_interview/domain/models/models.dart';
import 'package:yops_interview/navigation/routes.dart';


import 'question_editor_view.dart';
import 'question_editor_model.dart';

class QuestionEditorPresenter extends StatelessWidget {
  final QuestionEditorModel model;
  final AppActions actions;

  QuestionEditorPresenter({Key key, this.model, this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QuestionEditorView(
      model: model,
      presenter: this,
    );
  }
}
