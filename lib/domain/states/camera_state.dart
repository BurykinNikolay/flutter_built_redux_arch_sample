import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:camera/camera.dart';

part 'camera_state.g.dart';

abstract class CameraState implements Built<CameraState, CameraStateBuilder> {
  @nullable
  CameraDescription get cameraDescription;
  @nullable
  CameraController get cameraController;
  @nullable
  BuiltList<CameraDescription> get cameras;

  @nullable
  String get currentFilePath;

  CameraState._();

  factory CameraState([updates(CameraStateBuilder b)]) =>
      new _$CameraState((b) => b..update(updates));

  static Serializer<CameraState> get serializer => _$cameraStateSerializer;
}
