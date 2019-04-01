import 'package:flutter/material.dart';

import 'package:yops_interview/domain/actions/actions.dart';

import 'package:yops_interview/domain/models/models.dart';
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
}
