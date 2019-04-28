import 'package:built_collection/built_collection.dart';
import 'package:built_redux/built_redux.dart';
import 'package:video_player/video_player.dart';
import 'package:yops_interview/domain/actions/actions.dart';

import 'package:yops_interview/domain/states/states.dart';

NestedReducerBuilder<AppState, AppStateBuilder, InterviewState,
    InterviewStateBuilder> createInterviewReducer() => new NestedReducerBuilder<
        AppState, AppStateBuilder, InterviewState, InterviewStateBuilder>(
    (state) => state.interviewState, (builder) => builder.interviewState)
  ..add<String>(InterviewActionNames.setPath, _setPath)
  ..add<void>(InterviewActionNames.clearPath, _clearPath)
  ..add<VideoPlayerController>(InterviewActionNames.setPlayer, _setPlayer)
  ..add<BuiltList<String>>(InterviewActionNames.setQuestions, _setQuestions)
  ..add<List<String>>(InterviewActionNames.addResult, _addResult)
  ..add<void>(InterviewActionNames.repeat, _repeat);

_setPath(InterviewState state, Action<String> action,
    InterviewStateBuilder builder) {
  builder.path = action.payload;
}

_setPlayer(InterviewState state, Action<VideoPlayerController> action,
    InterviewStateBuilder builder) {
  final VideoPlayerController player = action.payload;
  // player.play();
  builder.player = player;
}

_addResult(InterviewState state, Action<List<String>> action,
    InterviewStateBuilder builder) {
  builder.results.replace(action.payload);
}

_setQuestions(InterviewState state, Action<BuiltList<String>> action,
    InterviewStateBuilder builder) {
  var resultList = List<String>(action.payload.length * 2);
  builder.results.replace(resultList);
  builder.questions.replace(action.payload);
}

_clearPath(
    InterviewState state, Action<void> action, InterviewStateBuilder builder) {
  builder.path = "";
}

_repeat(
    InterviewState state, Action<void> action, InterviewStateBuilder builder) {
  var resultList = List<String>(state.questions.length * 2);

  builder.results.replace(resultList);
  print("repeat");
}
