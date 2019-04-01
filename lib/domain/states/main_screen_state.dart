import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:yops_interview/domain/models/models.dart';

part 'main_screen_state.g.dart';

abstract class MainScreenState
    implements Built<MainScreenState, MainScreenStateBuilder> {
  @nullable
  BuiltList<Question> get questions;

  bool get loading;

  MainScreenState._();

  factory MainScreenState([updates(MainScreenStateBuilder b)]) =>
      new _$MainScreenState((b) => b
        ..loading = false
        ..update(updates));

  static Serializer<MainScreenState> get serializer =>
      _$mainScreenStateSerializer;
}
