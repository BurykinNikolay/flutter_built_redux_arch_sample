import 'package:flutter/material.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';

import 'package:yops_interview/domain/actions/actions.dart';
import 'package:yops_interview/domain/states/states.dart';


import 'main_screen_presenter.dart';
import 'main_screen_model.dart';

class MainScreenContainer
    extends StoreConnector<AppState, AppActions, MainScreenModel> {
  @override
  MainScreenModel connect(AppState state) => MainScreenModel(state);

  @override
  Widget build(
      BuildContext context, MainScreenModel model, AppActions actions) {
    return MainScreenPresenter(
      model: model,
      actions: actions,
    );
  }
}
