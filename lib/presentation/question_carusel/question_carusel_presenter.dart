import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:share_extend/share_extend.dart';

import 'package:yops_interview/domain/actions/actions.dart';
import 'package:yops_interview/presentation/components/components.dart';

import 'question_carusel_view.dart';
import 'question_carusel_model.dart';
import 'video_util.dart';

class QuestionCaruselPresenter extends StatelessWidget {
  final QuestionCaruselModel model;
  final AppActions actions;

  QuestionCaruselPresenter({Key key, this.model, this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QuestionCaruselView(
      model: model,
      presenter: this,
    );
  }

  void encodeVideo(BuildContext context, List<String> results) {
    startProgress(context);
    VideoUtil().encodeVideo(results).then((outputFilePath) {
      Navigator.of(context).pop();
      if (outputFilePath == "error") {
      } else {
        _shareFile(outputFilePath);
      }
    });
  }

  void startProgress(BuildContext context) {
    showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Builder(builder: (BuildContext context) {
          return ProgressBarShadow();
        });
      },
      barrierDismissible: false,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      transitionDuration: const Duration(milliseconds: 150),
    );
  }

  void _shareFile(String outputFilePath) async {
    var file = File(outputFilePath);
    ShareExtend.share(file.path, "file");
  }

  void setCameraController(CameraController controller) {
    actions.camera.setCameraController(controller);
  }
}
