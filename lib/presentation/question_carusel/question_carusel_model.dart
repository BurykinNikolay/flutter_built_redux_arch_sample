import 'package:camera/camera.dart';
import 'package:yops_interview/domain/states/states.dart';

class QuestionCaruselModel {
  final AppState appState;
  final List<String> questionList;
  QuestionCaruselModel(this.appState, this.questionList);
  List<String> get questions => questionList;
  CameraController get cameraController =>
      appState.cameraState.cameraController;
  List<CameraDescription> get cameras => appState.cameraState.cameras.toList();
}
