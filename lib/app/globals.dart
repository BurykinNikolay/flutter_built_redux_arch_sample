library globals;

/// Redux
import 'package:yops_interview/domain/actions/actions.dart';
import 'package:yops_interview/domain/states/app_state.dart';
import 'package:yops_interview/domain/reducers/reducer_builder.dart';
import 'package:yops_interview/domain/middleware/middlewares.dart';
import 'package:yops_interview/domain/states/states.dart';
import 'package:built_redux/built_redux.dart';
import 'package:camera/camera.dart';

import 'dart:async' show Future;

List<CameraDescription> cameras;

Store<AppState, AppStateBuilder, AppActions> _store;

Store<AppState, AppStateBuilder, AppActions> get store => _store;

setStore(store) => _store = store;

/// loggedIn status returned
Future<bool> initStore() async {
  var state = UserState();
  cameras = await availableCameras();

  _store = Store<AppState, AppStateBuilder, AppActions>(
    reducers,
    AppState((b) => b..userState = state.toBuilder()),
    AppActions(),
    middleware: middlewares,
  );
  _store.actions.question.getQuestions();

  return true;
}
