import 'package:built_collection/built_collection.dart';
import 'package:built_redux/built_redux.dart';

part 'question_actions.g.dart';

abstract class QuestionsAction extends ReduxActions {
  QuestionsAction._();

  ActionDispatcher<void> get getQuestions;
  ActionDispatcher<BuiltMap<String, BuiltList<String>>> get setQuestions;
  ActionDispatcher<BuiltMap<String, BuiltList<String>>> get sendQuestion;

  factory QuestionsAction() => new _$QuestionsAction();
}
