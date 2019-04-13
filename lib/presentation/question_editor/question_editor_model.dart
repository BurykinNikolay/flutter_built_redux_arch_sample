import 'package:yops_interview/domain/states/states.dart';

class QuestionEditorModel {
  final AppState appState;
  QuestionEditorModel(this.appState);
  MainScreenState get mainScreenState => appState.mainScreenState;

  bool get loadingStatus => appState.mainScreenState.loading;
}
