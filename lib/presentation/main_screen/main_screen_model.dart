import 'package:yops_interview/domain/states/states.dart';
import 'package:built_collection/built_collection.dart';
import 'package:yops_interview/domain/models/models.dart';

class MainScreenModel {
  final AppState appState;
  MainScreenModel(this.appState);
  MainScreenState get mainScreenState => appState.mainScreenState;

  bool get loadingStatus => appState.mainScreenState.loading;
}
