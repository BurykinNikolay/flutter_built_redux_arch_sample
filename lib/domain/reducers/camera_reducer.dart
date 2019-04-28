import 'package:built_redux/built_redux.dart';
import 'package:camera/camera.dart';
import 'package:yops_interview/domain/actions/actions.dart';

import 'package:yops_interview/domain/states/states.dart';

NestedReducerBuilder<AppState, AppStateBuilder, CameraState, CameraStateBuilder>
    createCameraReducer() => new NestedReducerBuilder<AppState, AppStateBuilder,
            CameraState, CameraStateBuilder>(
        (state) => state.cameraState, (builder) => builder.cameraState)
      ..add<List<CameraDescription>>(CameraActionNames.setCameras, _setCameras)
      ..add<CameraDescription>(
          CameraActionNames.setCameraDescription, _setCameraDescription)
      ..add<String>(CameraActionNames.setCurrentFilePath, _setCurrentFilePath)
      ..add<void>(CameraActionNames.stop, _stop)
      ..add<String>(CameraActionNames.start, _start)
      ..add<CameraController>(
          CameraActionNames.setCameraController, _setCameraController);

_setCameras(CameraState state, Action<List<CameraDescription>> action,
    CameraStateBuilder builder) {
  builder.cameras.replace(action.payload);
}

_setCameraDescription(CameraState state, Action<CameraDescription> action,
    CameraStateBuilder builder) {
  builder.cameraDescription = action.payload;
}

_setCameraController(CameraState state, Action<CameraController> action,
    CameraStateBuilder builder) {
  builder.cameraController = action.payload;
}

_setCurrentFilePath(
    CameraState state, Action<String> action, CameraStateBuilder builder) {
  builder.currentFilePath = action.payload;
}

_start(CameraState state, Action<String> action,
    CameraStateBuilder builder) async {
  builder.currentFilePath = action.payload;
}

_stop(
    CameraState state, Action<void> action, CameraStateBuilder builder) async {}
