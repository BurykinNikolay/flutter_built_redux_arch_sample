import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:video_player/video_player.dart';

part 'interview_state.g.dart';

abstract class InterviewState
    implements Built<InterviewState, InterviewStateBuilder> {
  @nullable
  BuiltList<String> get results;
  @nullable
  BuiltList<String> get questions;

  @nullable
  String get path;

  @nullable
  VideoPlayerController get player;

  InterviewState._();

  factory InterviewState([updates(InterviewStateBuilder b)]) =>
      new _$InterviewState((b) => b..update(updates));

  static Serializer<InterviewState> get serializer =>
      _$interviewStateSerializer;
}
