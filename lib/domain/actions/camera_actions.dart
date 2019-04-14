import 'package:built_collection/built_collection.dart';
import 'package:built_redux/built_redux.dart';
import 'package:camera/camera.dart';

part 'camera_actions.g.dart';

abstract class CameraAction extends ReduxActions {
  CameraAction._();

  ActionDispatcher<List<CameraDescription>> get setCameras;
  ActionDispatcher<CameraDescription> get setCameraDescription;
  ActionDispatcher<CameraController> get setCameraController;

  factory CameraAction() => new _$CameraAction();
}
