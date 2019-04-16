import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:video_player/video_player.dart';
part 'carusel_state.g.dart';

abstract class CaruselState
    implements Built<CaruselState, CaruselStateBuilder> {
  @nullable
  String get path;

  @nullable
  VideoPlayerController get player;

  CaruselState._();

  factory CaruselState([updates(CaruselStateBuilder b)]) =>
      new _$CaruselState((b) => b..update(updates));

  static Serializer<CaruselState> get serializer => _$caruselStateSerializer;
}
