library application;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:yops_interview/domain/states/states.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  AppState._();

  factory AppState([updates(AppStateBuilder b)]) => new _$AppState((b) => b
    ..userState = UserState((b) => b).toBuilder()
    ..tabState = TabState((b) => b).toBuilder()
    ..mainScreenState = MainScreenState((b) => b).toBuilder()
    ..questionState = QuestionsState((b) => b).toBuilder()
    ..cameraState = CameraState((b) => b).toBuilder()
    ..update(updates));

  static Serializer<AppState> get serializer => _$appStateSerializer;

  TabState get tabState;
  MainScreenState get mainScreenState;
  UserState get userState;
  QuestionsState get questionState;
  CameraState get cameraState;
}
