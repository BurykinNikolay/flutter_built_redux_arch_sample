import 'package:yops_interview/domain/states/states.dart';
import 'package:built_collection/built_collection.dart';

class MainScreenModel {
  final AppState appState;
  MainScreenModel(this.appState);
  MainScreenState get mainScreenState => appState.mainScreenState;
  BuiltMap<String, BuiltList<String>> get questions =>
      appState.questionState.questions;

  bool get loadingStatus => appState.mainScreenState.loading;
}
