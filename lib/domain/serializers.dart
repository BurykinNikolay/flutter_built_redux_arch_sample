library serializers;

import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:yops_interview/domain/models/models.dart';
import 'package:yops_interview/domain/states/states.dart';
import 'package:yops_interview/domain/action_models/action_models.dart';
import 'package:camera/camera.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  AppState,
  CameraState,
  TabState,
  CaruselState,
  QuestionsState,
  Error,
  GalleryActionModel,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
