import 'package:built_collection/built_collection.dart';
import 'package:built_redux/built_redux.dart';
import 'package:video_player/video_player.dart';

part 'interview_actions.g.dart';

abstract class InterviewAction extends ReduxActions {
  InterviewAction._();

  ActionDispatcher<String> get setPath;
  ActionDispatcher<VideoPlayerController> get setPlayer;

  ActionDispatcher<void> get clearPath;
  ActionDispatcher<void> get repeat;

  ActionDispatcher<BuiltList<String>> get setQuestions;
  ActionDispatcher<List<String>> get addResult;

  factory InterviewAction() => new _$InterviewAction();
}
