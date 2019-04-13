import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

part 'questions_state.g.dart';

abstract class QuestionsState
    implements Built<QuestionsState, QuestionsStateBuilder> {
  @nullable
  BuiltMap<String, BuiltList<String>> get questions;

  QuestionsState._();

  factory QuestionsState([updates(QuestionsStateBuilder b)]) =>
      new _$QuestionsState((b) => b..update(updates));

  static Serializer<QuestionsState> get serializer =>
      _$questionsStateSerializer;
}
