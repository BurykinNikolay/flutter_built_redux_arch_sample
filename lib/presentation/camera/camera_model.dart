import 'package:camera/camera.dart';
import 'package:yops_interview/domain/states/states.dart';

class CameraModel {
  CameraModel(this.appState);
  final AppState appState;

  CameraController get controller => appState.cameraState.cameraController;
  List<CameraDescription> get cameras => appState.cameraState.cameras.toList();

  String get currentFilePath => appState.cameraState.currentFilePath;
}
