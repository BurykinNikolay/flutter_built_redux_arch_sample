// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_actions.dart';

// **************************************************************************
// BuiltReduxGenerator
// **************************************************************************

// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: annotate_overrides

class _$QuestionsAction extends QuestionsAction {
  factory _$QuestionsAction() => new _$QuestionsAction._();
  _$QuestionsAction._() : super._();

  final ActionDispatcher<void> getQuestions =
      new ActionDispatcher<void>('QuestionsAction-getQuestions');
  final ActionDispatcher<BuiltMap<String, BuiltList<String>>> setQuestions =
      new ActionDispatcher<BuiltMap<String, BuiltList<String>>>(
          'QuestionsAction-setQuestions');
  final ActionDispatcher<BuiltMap<String, BuiltList<String>>> sendQuestion =
      new ActionDispatcher<BuiltMap<String, BuiltList<String>>>(
          'QuestionsAction-sendQuestion');

  @override
  void setDispatcher(Dispatcher dispatcher) {
    getQuestions.setDispatcher(dispatcher);
    setQuestions.setDispatcher(dispatcher);
    sendQuestion.setDispatcher(dispatcher);
  }
}

class QuestionsActionNames {
  static final ActionName<void> getQuestions =
      new ActionName<void>('QuestionsAction-getQuestions');
  static final ActionName<BuiltMap<String, BuiltList<String>>> setQuestions =
      new ActionName<BuiltMap<String, BuiltList<String>>>(
          'QuestionsAction-setQuestions');
  static final ActionName<BuiltMap<String, BuiltList<String>>> sendQuestion =
      new ActionName<BuiltMap<String, BuiltList<String>>>(
          'QuestionsAction-sendQuestion');
}
