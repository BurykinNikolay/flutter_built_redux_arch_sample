import 'package:built_collection/built_collection.dart';
import 'package:rxdart/rxdart.dart';
import 'package:built_redux/built_redux.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yops_interview/domain/actions/actions.dart';

import 'package:yops_interview/domain/states/states.dart';

Observable getQuestionEpic(Observable<Action<dynamic>> stream,
    MiddlewareApi<AppState, AppStateBuilder, AppActions> api) {
  return stream
      .where((action) => action.name == QuestionsActionNames.getQuestions.name)
      .map((a) => a)
      .asyncMap((action) async {
    Firestore.instance.collection('questions').snapshots().listen((onData) {
      BuiltMap<String, BuiltList<String>> questionsBuilder =
          BuiltMap<String, BuiltList<String>>();

      final questions = questionsBuilder.rebuild((updates) {
        onData.documents.forEach((document) {
          document.data.forEach((key, questionList) {
            updates[key] = BuiltList.from(questionList);
          });
        });

        return updates;
      });
      print(questions);

      api.actions.question.setQuestions(questions);
    });
  });
}
