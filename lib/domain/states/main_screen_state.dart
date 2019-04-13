import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'main_screen_state.g.dart';

abstract class MainScreenState
    implements Built<MainScreenState, MainScreenStateBuilder> {
  bool get loading;

  MainScreenState._();

  factory MainScreenState([updates(MainScreenStateBuilder b)]) =>
      new _$MainScreenState((b) => b
        ..loading = false
        ..update(updates));

  static Serializer<MainScreenState> get serializer =>
      _$mainScreenStateSerializer;
}
