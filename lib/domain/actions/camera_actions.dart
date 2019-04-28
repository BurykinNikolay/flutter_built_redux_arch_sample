import 'package:built_redux/built_redux.dart';
import 'package:camera/camera.dart';

part 'camera_actions.g.dart';

abstract class CameraAction extends ReduxActions {
  CameraAction._();

  ActionDispatcher<List<CameraDescription>> get setCameras;
  ActionDispatcher<CameraDescription> get setCameraDescription;
  ActionDispatcher<CameraController> get setCameraController;
  ActionDispatcher<String> get setCurrentFilePath;
  ActionDispatcher<String> get start;
  ActionDispatcher<void> get stop;

  factory CameraAction() => new _$CameraAction();
}
