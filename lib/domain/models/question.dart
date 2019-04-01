library question;

import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

part 'question.g.dart';

abstract class Question implements Built<Question, QuestionBuilder> {
  static Serializer<Question> get serializer => _$questionSerializer;

  BuiltList<String> get questionList;

  Question._();

  factory Question([updates(QuestionBuilder b)]) = _$Question;
}
