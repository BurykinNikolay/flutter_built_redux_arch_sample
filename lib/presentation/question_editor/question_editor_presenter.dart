import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';

import 'package:yops_interview/domain/actions/actions.dart';
import 'package:yops_interview/presentation/components/components.dart';

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

  void startProgress(BuildContext context) {
    showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Builder(builder: (BuildContext context) {
          return ProgressBar();
        });
      },
      barrierDismissible: false,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      transitionDuration: const Duration(milliseconds: 150),
    );
  }
}
