import 'package:built_collection/built_collection.dart';

import 'package:yops_interview/domain/action_models/action_models.dart';

class GalleryModel {
  final GalleryActionModel actionModel;
  GalleryModel(this.actionModel);

  double get height => 360;
  String get tag => actionModel.id;
  BuiltList<String> get images => actionModel.attaches;
  bool get fullScreen => actionModel.fullScreen;
}
