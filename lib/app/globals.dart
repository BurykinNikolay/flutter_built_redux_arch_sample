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

List<CameraDescription> _cameras;

Store<AppState, AppStateBuilder, AppActions> _store;

Store<AppState, AppStateBuilder, AppActions> get store => _store;

setStore(store) => _store = store;

/// loggedIn status returned
Future<bool> initStore() async {
  var state = UserState();
  _cameras = await availableCameras();

  print(_cameras.length);
  CameraDescription cameraDescription;
  if (_cameras.length > 1) {
    cameraDescription = _cameras[1];
  }

  CameraController cameraController;
  if (cameraDescription != null) {
    cameraController =
        CameraController(cameraDescription, ResolutionPreset.high);
    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      print(e.toString());
    }
  }

  _store = Store<AppState, AppStateBuilder, AppActions>(
    reducers,
    AppState((b) => b..userState = state.toBuilder()),
    AppActions(),
    middleware: middlewares,
  );
  _store.actions.question.getQuestions();
  _store.actions.camera.setCameras(_cameras);
  _store.actions.camera.setCameraController(cameraController);
  _store.actions.camera.setCameraDescription(cameraDescription);

  return true;
}
