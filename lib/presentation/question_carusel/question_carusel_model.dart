import 'package:camera/camera.dart';
import 'package:video_player/video_player.dart';
import 'package:yops_interview/domain/states/states.dart';

class QuestionCaruselModel {
  final AppState appState;
  final List<String> questionList;
  QuestionCaruselModel(this.appState, this.questionList);
  List<String> get questions => questionList;
  CameraController get cameraController =>
      appState.cameraState.cameraController;
  List<CameraDescription> get cameras => appState.cameraState.cameras.toList();

  String get path => appState.caruselState.path;
  VideoPlayerController get player => appState.caruselState.player;
}
