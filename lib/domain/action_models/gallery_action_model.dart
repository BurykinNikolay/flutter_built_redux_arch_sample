library award;

import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

import 'package:yops_interview/domain/models/models.dart';

part 'gallery_action_model.g.dart';

abstract class GalleryActionModel
    implements Built<GalleryActionModel, GalleryActionModelBuilder> {
  static Serializer<GalleryActionModel> get serializer =>
      _$galleryActionModelSerializer;

  @nullable
  String get name;

  @nullable
  String get date;

  @nullable
  BuiltList<String> get attaches;

  @nullable
  String get id;

  @nullable
  bool get fullScreen;

  GalleryActionModel._();

  factory GalleryActionModel([updates(GalleryActionModelBuilder b)]) =
      _$GalleryActionModel;
}
