import 'package:built_collection/built_collection.dart';
import 'package:rxdart/rxdart.dart';
import 'package:built_redux/built_redux.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yops_interview/domain/actions/actions.dart';

import 'package:yops_interview/domain/states/states.dart';

Observable sendQuestionEpic(Observable<Action<dynamic>> stream,
    MiddlewareApi<AppState, AppStateBuilder, AppActions> api) {
  return stream
      .where((action) => action.name == QuestionsActionNames.sendQuestion.name)
      .map((a) => a as Action<BuiltMap<String, BuiltList<String>>>)
      .asyncMap((action) async {
    String title = action.payload.keys.toList().first;
    List<String> questions = action.payload.values.toList().first.toList();
    Firestore.instance.runTransaction((transaction) async {
      await transaction.set(
          Firestore.instance.collection("questions").document(),
          {title: questions});
    });
  });
}
