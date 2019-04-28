import 'package:flutter/material.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';

import 'package:yops_interview/domain/actions/actions.dart';
import 'package:yops_interview/domain/states/states.dart';

import 'camera_presenter.dart';
import 'camera_model.dart';

class CameraContainer
    extends StoreConnector<AppState, AppActions, CameraModel> {
  final Function() next;
  CameraContainer({this.next});

  @override
  CameraModel connect(AppState state) => CameraModel(state);

  @override
  Widget build(BuildContext context, CameraModel model, AppActions actions) {
    return CameraPresenter(
      model: model,
      actions: actions,
      next: next,
    );
  }
}
