import 'package:flutter/material.dart';

import 'package:yops_interview/domain/action_models/action_models.dart';

import 'gallery_presenter.dart';
import 'gallery_model.dart';

class Gallery extends StatelessWidget {
  final GalleryActionModel actionModel;
  Gallery(this.actionModel);

  Widget build(BuildContext context) {
    final model = GalleryModel(actionModel);
    return GalleryPresenter(model: model);
  }
}
