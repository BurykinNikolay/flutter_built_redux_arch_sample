import 'package:camera/camera.dart';
import 'package:video_player/video_player.dart';
import 'package:yops_interview/domain/states/states.dart';

class InterviewModel {
  final AppState appState;
  InterviewModel(this.appState);
  List<String> get questions => appState.interviewState.questions.toList();
  List<String> get results => appState.interviewState.results.toList();

  CameraController get cameraController =>
      appState.cameraState.cameraController;
  List<CameraDescription> get cameras => appState.cameraState.cameras.toList();

  String get path => appState.interviewState.path;
  String get currentFilePath => appState.cameraState.currentFilePath;
  VideoPlayerController get player => appState.interviewState.player;
}
