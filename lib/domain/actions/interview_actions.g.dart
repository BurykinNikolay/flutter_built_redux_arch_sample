// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interview_actions.dart';

// **************************************************************************
// BuiltReduxGenerator
// **************************************************************************

// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: annotate_overrides

class _$InterviewAction extends InterviewAction {
  factory _$InterviewAction() => new _$InterviewAction._();
  _$InterviewAction._() : super._();

  final ActionDispatcher<String> setPath =
      new ActionDispatcher<String>('InterviewAction-setPath');
  final ActionDispatcher<VideoPlayerController> setPlayer =
      new ActionDispatcher<VideoPlayerController>('InterviewAction-setPlayer');
  final ActionDispatcher<void> clearPath =
      new ActionDispatcher<void>('InterviewAction-clearPath');
  final ActionDispatcher<void> repeat =
      new ActionDispatcher<void>('InterviewAction-repeat');
  final ActionDispatcher<BuiltList<String>> setQuestions =
      new ActionDispatcher<BuiltList<String>>('InterviewAction-setQuestions');
  final ActionDispatcher<List<String>> addResult =
      new ActionDispatcher<List<String>>('InterviewAction-addResult');

  @override
  void setDispatcher(Dispatcher dispatcher) {
    setPath.setDispatcher(dispatcher);
    setPlayer.setDispatcher(dispatcher);
    clearPath.setDispatcher(dispatcher);
    repeat.setDispatcher(dispatcher);
    setQuestions.setDispatcher(dispatcher);
    addResult.setDispatcher(dispatcher);
  }
}

class InterviewActionNames {
  static final ActionName<String> setPath =
      new ActionName<String>('InterviewAction-setPath');
  static final ActionName<VideoPlayerController> setPlayer =
      new ActionName<VideoPlayerController>('InterviewAction-setPlayer');
  static final ActionName<void> clearPath =
      new ActionName<void>('InterviewAction-clearPath');
  static final ActionName<void> repeat =
      new ActionName<void>('InterviewAction-repeat');
  static final ActionName<BuiltList<String>> setQuestions =
      new ActionName<BuiltList<String>>('InterviewAction-setQuestions');
  static final ActionName<List<String>> addResult =
      new ActionName<List<String>>('InterviewAction-addResult');
}
