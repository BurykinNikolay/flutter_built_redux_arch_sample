import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:yops_interview/app/icons.dart';
import 'package:yops_interview/app/theme/app_theme.dart';

import 'package:yops_interview/domain/models/models.dart';

import 'question_editor_presenter.dart';
import 'question_editor_model.dart';

class QuestionEditorView extends StatelessWidget {
  final QuestionEditorModel model;
  final QuestionEditorPresenter presenter;
  QuestionEditorView({this.model, this.presenter});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CupertinoNavigationBar(
          backgroundColor: Color(0xFFE76A4B),
        ),
        body: _body(context));
  }

  Widget _body(BuildContext context) {
    return CustomScrollView(slivers: <Widget>[
      SliverList(
        delegate: SliverChildListDelegate([]),
      )
    ]);
  }
}
