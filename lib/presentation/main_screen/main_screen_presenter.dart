import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';

import 'package:yops_interview/domain/actions/actions.dart';

import 'package:yops_interview/navigation/routes.dart';

import 'main_screen_model.dart';
import 'main_screen_view.dart';

class MainScreenPresenter extends StatelessWidget {
  final MainScreenModel model;
  final AppActions actions;

  MainScreenPresenter({Key key, this.model, this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScreenView(
      model: model,
      presenter: this,
    );
  }

  openEditor() {
    actions.routeTo(AppRoute.from(Routes.questionEditor));
  }

  openInterview(BuiltList<String> questions) {
    actions.interview.setQuestions(questions);
    actions.routeTo(AppRoute.from(Routes.interview));
  }
}
