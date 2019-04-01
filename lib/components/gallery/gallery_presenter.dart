import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'gallery_model.dart';
import 'gallery_view.dart';

class GalleryPresenter extends StatelessWidget {
  final GalleryModel model;

  GalleryPresenter({this.model});

  @override
  Widget build(BuildContext context) =>
      GalleryView(model: model, presenter: this);

  back(BuildContext context) {
    Navigator.of(context).pop();
  }
}
