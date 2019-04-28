import 'package:flutter/material.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';

import 'package:yops_interview/domain/actions/actions.dart';
import 'package:yops_interview/domain/states/states.dart';

import 'interview_presenter.dart';
import 'interview_model.dart';

class InterviewContainer
    extends StoreConnector<AppState, AppActions, InterviewModel> {
  @override
  InterviewModel connect(AppState state) => InterviewModel(state);

  @override
  Widget build(BuildContext context, InterviewModel model, AppActions actions) {
    return InterviewPresenter(
      model: model,
      actions: actions,
    );
  }
}
