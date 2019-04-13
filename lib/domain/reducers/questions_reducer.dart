import 'package:built_collection/built_collection.dart';
import 'package:built_redux/built_redux.dart';
import 'package:yops_interview/domain/actions/actions.dart';

import 'package:yops_interview/domain/states/states.dart';

NestedReducerBuilder<AppState, AppStateBuilder, QuestionsState,
    QuestionsStateBuilder> createQuestionsReducer() => new NestedReducerBuilder<
        AppState, AppStateBuilder, QuestionsState, QuestionsStateBuilder>(
    (state) => state.questionState, (builder) => builder.questionState)
  ..add<BuiltMap<String, BuiltList<String>>>(
      QuestionsActionNames.setQuestions, _setQuestions)
  ..add<BuiltMap<String, BuiltList<String>>>(
      QuestionsActionNames.sendQuestion, _sendQuestion);

_setQuestions(
    QuestionsState state,
    Action<BuiltMap<String, BuiltList<String>>> action,
    QuestionsStateBuilder builder) {
  builder.questions.replace(action.payload);
}

_sendQuestion(
    QuestionsState state,
    Action<BuiltMap<String, BuiltList<String>>> action,
    QuestionsStateBuilder builder) {
  print("run sendQuestion epic");
}
